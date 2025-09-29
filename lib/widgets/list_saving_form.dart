import 'package:flutter/material.dart';
import '../services/local_data_service.dart';

class ListSavingForm extends StatefulWidget {
  const ListSavingForm({super.key});

  @override
  State<ListSavingForm> createState() => _ListSavingFormState();
}

class _ListSavingFormState extends State<ListSavingForm> {
  final _formKey = GlobalKey<FormState>();
  final _customerController = TextEditingController();
  final _petController = TextEditingController();
  final _amountController = TextEditingController();
  String? _service;
  DateTime? _date;
  TimeOfDay? _time;
  final LocalDataService _serviceStore = LocalDataService();

  final Map<String, double> _services = {
    'Bath': 300.0,
    'Nail Trimming': 150.0,
    'Styling': 500.0,
    'Premium Spa Package': 1200.0,
  };

  @override
  void dispose() {
    _customerController.dispose();
    _petController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final d = await showDatePicker(
        context: context,
        initialDate: now,
        firstDate: now,
        lastDate: DateTime(now.year + 2));
    if (d != null) setState(() => _date = d);
  }

  Future<void> _pickTime() async {
    final t =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (t != null) setState(() => _time = t);
  }

  void _submitBooking() {
    if (_formKey.currentState!.validate()) {
      if (_service == null) {
        ScaffoldMessenger.of(context)
            .showSnackBar(const SnackBar(content: Text('Select service')));
        return;
      }
      if (_date == null || _time == null) {
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Select date and time')));
        return;
      }
      final amount = _services[_service!]!.toStringAsFixed(2);
      final map = {
        'customer': _customerController.text.trim(),
        'pet': _petController.text.trim(),
        'service': _service!,
        'datetime': '${_date!.toLocal()} ${_time!.format(context)}',
        'amount': amount,
        'status': 'Booked (unpaid)',
      };
      _serviceStore.addBooking(map);
      _customerController.clear();
      _petController.clear();
      _amountController.clear();
      setState(() {});
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Booking saved locally')));
    }
  }

  void _submitPayment(int index) {
    final booking = _serviceStore.getBookings()[index];
    final paid = {
      'customer': booking['customer'] ?? '',
      'service': booking['service'] ?? '',
      'amount': booking['amount'] ?? '0',
      'paidAt': DateTime.now().toIso8601String(),
    };
    _serviceStore.addOrder(paid);
    // mark booking as paid (for demo we mutate list)
    booking['status'] = 'Paid';
    setState(() {});
    ScaffoldMessenger.of(context)
        .showSnackBar(const SnackBar(content: Text('Payment recorded (demo)')));
  }

  @override
  Widget build(BuildContext context) {
    final bookings = _serviceStore.getBookings();
    final orders = _serviceStore.getOrders();

    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child:
            Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
          const Text('Booking & Payment (Save to Local List)',
              style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Form(
            key: _formKey,
            child: Column(children: [
              TextFormField(
                controller: _customerController,
                decoration: const InputDecoration(labelText: 'Customer Name'),
                validator: (v) => v == null || v.trim().isEmpty
                    ? 'Enter customer name'
                    : null,
              ),
              const SizedBox(height: 8),
              TextFormField(
                controller: _petController,
                decoration: const InputDecoration(labelText: 'Pet Name'),
                validator: (v) =>
                    v == null || v.trim().isEmpty ? 'Enter pet name' : null,
              ),
              const SizedBox(height: 8),
              DropdownButtonFormField<String>(
                value: _service,
                decoration: const InputDecoration(labelText: 'Service'),
                items: _services.keys
                    .map((s) => DropdownMenuItem(
                        value: s,
                        child:
                            Text('$s — ₱${_services[s]!.toStringAsFixed(0)}')))
                    .toList(),
                onChanged: (v) => setState(() => _service = v),
                validator: (v) => v == null ? 'Select service' : null,
              ),
              const SizedBox(height: 8),
              Row(children: [
                Expanded(
                    child: ElevatedButton(
                        onPressed: _pickDate,
                        child: Text(_date == null
                            ? 'Pick Date'
                            : 'Date: ${_date!.toLocal()}'.split(' ')[0]))),
                const SizedBox(width: 8),
                Expanded(
                    child: ElevatedButton(
                        onPressed: _pickTime,
                        child: Text(_time == null
                            ? 'Pick Time'
                            : 'Time: ${_time!.format(context)}'))),
              ]),
              const SizedBox(height: 8),
              ElevatedButton(
                  onPressed: _submitBooking,
                  child: const Text('Save Booking Locally')),
            ]),
          ),
          const SizedBox(height: 12),
          const Text('Saved Bookings:',
              style: TextStyle(fontWeight: FontWeight.w600)),
          bookings.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('No bookings yet'),
                )
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: bookings.length,
                  itemBuilder: (context, idx) {
                    final b = bookings[idx];
                    return Card(
                      color: b['status'] == 'Paid' ? Colors.green[50] : null,
                      child: ListTile(
                        title: Text('${b['customer']} — ${b['service']}'),
                        subtitle: Text(
                            'Pet: ${b['pet']} • ${b['datetime']}\nAmount: ₱${b['amount']} • Status: ${b['status']}'),
                        isThreeLine: true,
                        trailing: b['status'] == 'Paid'
                            ? const Icon(Icons.check_circle,
                                color: Colors.green)
                            : ElevatedButton(
                                onPressed: () => _submitPayment(idx),
                                child: const Text('Pay (simulate)'),
                              ),
                      ),
                    );
                  },
                ),
          const SizedBox(height: 12),
          const Text('Recorded Payments (orders):',
              style: TextStyle(fontWeight: FontWeight.w600)),
          orders.isEmpty
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 8),
                  child: Text('No payments recorded'))
              : ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: orders.length,
                  itemBuilder: (context, i) {
                    final o = orders[i];
                    return ListTile(
                      title: Text('${o['customer']} — ₱${o['amount']}'),
                      subtitle: Text(
                          'Service: ${o['service']} • PaidAt: ${o['paidAt']}'),
                    );
                  },
                ),
        ]),
      ),
    );
  }
}
