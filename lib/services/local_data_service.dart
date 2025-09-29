/// Simple in-memory local service that simulates storage for:
/// - bookings (appointments)
/// - orders/payments
/// - documents (tracking)
class LocalDataService {
  static final LocalDataService _instance = LocalDataService._internal();
  factory LocalDataService() => _instance;
  LocalDataService._internal();

  final List<Map<String, String>> bookings = [];
  final List<Map<String, String>> orders = [];
  final List<Map<String, String>> documents = [];

  // Bookings
  void addBooking(Map<String, String> booking) {
    bookings.add(booking);
  }

  List<Map<String, String>> getBookings() => bookings;

  // Orders / Payments
  void addOrder(Map<String, String> order) {
    orders.add(order);
  }

  List<Map<String, String>> getOrders() => orders;

  // Document tracking
  void addDocument(Map<String, String> doc) {
    documents.add(doc);
  }

  List<Map<String, String>> getDocuments() => documents;
}
