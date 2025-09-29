import 'package:flutter/material.dart';

class DateTimeForm extends StatefulWidget {
  const DateTimeForm({super.key});

  @override
  State<DateTimeForm> createState() => _DateTimeFormState();
}

class _DateTimeFormState extends State<DateTimeForm> {
  DateTime? _selectedDate;
  TimeOfDay? _selectedTime;

  Future<void> _pickDate() async {
    final now = DateTime.now();
    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 2),
    );
    if (date != null) setState(() => _selectedDate = date);
  }

  Future<void> _pickTime() async {
    final time =
        await showTimePicker(context: context, initialTime: TimeOfDay.now());
    if (time != null) setState(() => _selectedTime = time);
  }

  void _confirm() {
    if (_selectedDate == null || _selectedTime == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please pick both date and time')),
      );
      return;
    }
    final dt = DateTime(_selectedDate!.year, _selectedDate!.month,
        _selectedDate!.day, _selectedTime!.hour, _selectedTime!.minute);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Appointment selected: ${dt.toLocal()}')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text('Appointment Date & Time (Reservation)',
                style: TextStyle(fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      onPressed: _pickDate,
                      child: Text(_selectedDate == null
                          ? 'Pick Date'
                          : 'Date: ${_selectedDate!.toLocal()}'.split(' ')[0])),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                      onPressed: _pickTime,
                      child: Text(_selectedTime == null
                          ? 'Pick Time'
                          : 'Time: ${_selectedTime!.format(context)}')),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ElevatedButton(
                onPressed: _confirm, child: const Text('Confirm Appointment')),
          ],
        ),
      ),
    );
  }
}
