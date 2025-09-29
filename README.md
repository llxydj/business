Cat Grooming Business Forms App

Project Structure


business_forms_app/
├── lib/
│   ├── main.dart
│   ├── pages/
│   │   └── home_page.dart
│   ├── services/
│   │   └── local_data_service.dart
│   └── widgets/
│       ├── username_form.dart
│       ├── login_form.dart
│       ├── multi_input_form.dart
│       ├── registration_form.dart
│       ├── dropdown_form.dart
│       ├── date_time_form.dart
│       ├── controller_form.dart
│       └── list_saving_form.dart
├── pubspec.yaml

1. Document Tracker

username_form.dart → allows entry of a tracking ID (e.g., DOC-1234).
Saved into LocalDataService.documents.
Displays a list of tracked documents.

2. Ordering & Payment Process

dropdown_form.dart` → select a grooming service + price.
list_saving_form.dart` → saves order details (service, pet name, datetime, customer).
Includes a Pay button to mark the booking as paid → stored in LocalDataService.order.

3. Reservation

ate_time_form.dart → pick a date & time for grooming appointments.
Integrated with booking form so reservations are tracked.

4. Payment

Bookings begin as “Booked (unpaid)”.
Pressing Pay updates status to Paid and records it in payments history.

--All forms share LocalDataService, ensuring documents, bookings and payments are stored consistently.


Forms & Input Handling (Activity Breakdown)

This app demonstrates 10 core Flutter form-handling concepts:

1. Username Form (username_form.dart)

   TextFormField` with label “Username”
   Submit button → validates input → shows entered username or error.

2. Login Form (login_form.dart)

   Fields: Email + Password
   Submit button validates credentials.

3. Validation

   Email must contain @
   Password cannot be empty
   Uses validator in each field.

4. GlobalKey<FormState>

   Every form uses a GlobalKey<FormState> to handle validate() and save().

5. Multi-Input Form (multi_input_form.dart)

   Includes TextField, Checkbox, and Switch.
   Tracks boolean values with state.

6. Registration Form (registration_form.dart)

   Fields: Name, Email, Password, Confirm Password
   Validates non-empty inputs, email format and matching passwords.

7. Dropdown Form (dropdown_form.dart)

   Uses DropdownButtonFormField to select User Role (Admin/User) or Grooming Service.

8. Date & Time Picker (date_time_form.dart)

   Integrates showDatePicker and showTimePicker.
   Stores selected values for reservations.

9. Controller Form (controller_form.dart)

   Uses TextEditingController to capture and display user input dynamically.

10. List-Saving Form (list_saving_form.dart)

    Captures form input, saves into a local List.
    Displays submitted entries with ListView.
    Demonstrates simple state management + dynamic UI updates.



How to Run

1. Open [FlutLab.io](https://flutlab.io) or your local Flutter environment.
2. Upload/import this project structure.
3. Run main.dart.
4. The Home Page contains all forms for testing and demo.

Notes

LocalDataService is a temporary in-memory storage.

  Data is lost on app restart.
  Ideal for prototype and school projects.
  Can be extended with sqflite, hive or Firebase for persistent storage.