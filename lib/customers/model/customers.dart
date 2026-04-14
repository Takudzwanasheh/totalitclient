import 'dart:ffi';

class Customers {
  final String id;
  final String Name;
  final String Email;
  final String Mobile_Number;
  final String City;

  Customers ({
    required this.City,
    required this.Name,
    required this.Email,
    required this.Mobile_Number,
    required this.id
});
}