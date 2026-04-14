import 'package:flutter/material.dart';
import 'package:totaliclient/customers/model/customer_dummy.dart';
import 'package:totaliclient/customers/model/customers.dart';
import 'package:totaliclient/customers/widgets/CustomerList.dart';
import '../../sharedWidgets/buttons.dart';

class Addcustomer extends StatefulWidget {

  Addcustomer({super.key});

  @override
  State<Addcustomer> createState() => _AddcustomerState();
}

class _AddcustomerState extends State<Addcustomer> {
  final TextEditingController nameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  bool _isNameValid = false;
  bool _isPhoneValid = false;
  bool _isAddressValid=false;

  @override
  void initState() {
    super.initState();
    nameController.addListener(_updateValidation);
    phoneController.addListener(_updateValidation);
    addressController.addListener(_updateValidation);
  }

  void _updateValidation() {
    setState(() {
      _isNameValid = nameController.text.trim().isNotEmpty;
      _isPhoneValid = phoneController.text.trim().isNotEmpty;
      _isAddressValid = addressController.text.trim().isNotEmpty;

    });
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    super.dispose();
  }

  bool get _isFormValid => _isNameValid && _isPhoneValid;

  @override

  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        "Add New Customer",
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      content: SingleChildScrollView(
        child: Container(
          width: 1000,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: "Full Name",
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 12),
              TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  labelText: "Phone Number",
                  prefixIcon: Icon(Icons.phone),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: "Email (Optional)",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(height: 12),
              TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  labelText: "Address (Optional)",
                  prefixIcon: Icon(Icons.location_on),
                  border: OutlineInputBorder(),
                ),
              ),
            ],
          ),
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: const Text(
            "Cancel",
            style: TextStyle(color: Colors.black),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            // Create customer object with entered data
            final newCustomer = {
              'name': nameController.text.trim(),
              'phone': phoneController.text.trim(),
              'email': emailController.text.trim(),
              'address': addressController.text.trim(),
            };

            // Validate required fields
            if (nameController.text.trim().isEmpty ||
                phoneController.text.trim().isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text("Please fill in Name and Phone Number"),
                  backgroundColor: Colors.red,
                ),
              );
              return;
            }
            Navigator.pop(context, newCustomer);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: (!_isFormValid)
                ? Colors.grey
                : Colors.green,
            foregroundColor: Colors.white,
          ),
          child: const Text("CREATE"),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    );
  }
}

void showAddCustomerDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Addcustomer();
    },
  ).then((customerData) {
    if (customerData != null) {
      print("New Customer Created: $customerData");


      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Customer ${customerData['name']} added successfully!"),
          backgroundColor: Colors.green,
        ),
      );
    }
  });
}