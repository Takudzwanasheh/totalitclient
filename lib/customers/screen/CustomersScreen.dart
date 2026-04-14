import 'package:flutter/material.dart';
import 'package:totaliclient/customers/model/customer_dummy.dart';
import 'package:totaliclient/customers/model/customers.dart';
import 'package:totaliclient/customers/screen/addCustomer.dart';
import 'package:totaliclient/customers/widgets/CustomerList.dart';
import '../../sharedWidgets/buttons.dart';

class Customersscreen extends StatefulWidget {
  const Customersscreen({super.key});

  @override
  State<Customersscreen> createState() => _CustomersscreenState();
}

class _CustomersscreenState extends State<Customersscreen> {
  List<Customers> _allCustomers = [];
  List<Customers> _foundCustomers = [];

  @override
  void initState() {
    _allCustomers = CustomerDummy.getCustomers();
    _foundCustomers = _allCustomers;
    super.initState();
  }

  void _runFilter(String enteredKeyword) {
    List<Customers> results = [];
    if (enteredKeyword.isEmpty) {
      results = _allCustomers;
    } else {
      results = _allCustomers
          .where((customer) =>
              customer.Name.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              customer.Email.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              customer.Mobile_Number.toLowerCase().contains(enteredKeyword.toLowerCase()) ||
              customer.City.toLowerCase().contains(enteredKeyword.toLowerCase()))
          .toList();
    }

    setState(() {
      _foundCustomers = results;
    });
  }

  void _showDialogue() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Addcustomer();
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Row(
                children: [
                  Icon(Icons.people, size: 40, color: Colors.grey),
                  SizedBox(width: 20),
                  Text(
                    "Customer Details",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              const Text(
                "Dashboard/Manage Customer",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              CustomButton(
                text: "Add",
                onPressed: _showDialogue,
                type: ButtonType.primary,
                size: ButtonSize.medium,
                icon: Icons.add,
              ),
              const SizedBox(width: 10),
              CustomButton(
                text: "csv upload",
                onPressed: () {
                  print('CSV upload clicked');
                },
                type: ButtonType.primary,
                size: ButtonSize.medium,
                icon: Icons.upload_file,
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CustomButton(
                    text: "Copy",
                    onPressed: () {},
                    type: ButtonType.outlined,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: "Excel",
                    onPressed: () {},
                    type: ButtonType.outlined,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: "CSV",
                    onPressed: () {},
                    type: ButtonType.outlined,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: "PDF",
                    onPressed: () {},
                    type: ButtonType.outlined,
                  ),
                  const SizedBox(width: 10),
                  CustomButton(
                    text: "Print",
                    onPressed: () {},
                    type: ButtonType.outlined,
                  ),
                ],
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  onChanged: (value) => _runFilter(value),
                  decoration: InputDecoration(
                    hintText: 'Search customers...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[100],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Customerlist(customers: _foundCustomers),
          ),
        ],
      ),
    );
  }


}

