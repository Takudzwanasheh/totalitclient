import 'package:flutter/material.dart';
import 'package:totaliclient/customers/model/customers.dart';
import 'package:totaliclient/customers/screen/addCustomer.dart';

class Customerlist extends StatefulWidget {
  final List<Customers> customers;

  const Customerlist({super.key, required this.customers});

  @override
  State<Customerlist> createState() => _CustomerlistState();
}

class _CustomerlistState extends State<Customerlist> {
  int _currentPage = 0;
  final int _rowsPerPage = 8;

  @override
  Widget build(BuildContext context) {
    int start = _currentPage * _rowsPerPage;
    int end = (start + _rowsPerPage < widget.customers.length)
        ? start + _rowsPerPage
        : widget.customers.length;
    final paginatedCustomers = widget.customers.sublist(start, end);

    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Name')),
                  DataColumn(label: Text('Email')),
                  DataColumn(label: Text('Mobile Number')),
                  DataColumn(label: Text('City')),
                  DataColumn(label: Text('Action')),
                ],
                rows: paginatedCustomers.map((customer) {
                  return DataRow(
                    cells: [
                      DataCell(Text(customer.id)),
                      DataCell(Text(customer.Name)),
                      DataCell(Text(customer.Email)),
                      DataCell(Text(customer.Mobile_Number)),
                      DataCell(Text(customer.City)),
                      DataCell(Row(
                        children: [
                          IconButton(
                            onPressed: _showEditDialogue,
                            icon: Icon(Icons.edit, color: Colors.blue[900]),
                          ),
                          IconButton(
                            onPressed: _showDeleteDaialogue,
                            icon: const Icon(Icons.delete_forever, color: Colors.red),
                          ),
                        ],
                      )),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text('Showing  ${widget.customers.length}'),
            const SizedBox(width: 20),
            IconButton(
              onPressed: _currentPage > 0
                  ? () => setState(() => _currentPage--)
                  : null,
              icon: const Icon(Icons.arrow_circle_left),
            ),
            IconButton(
              onPressed: end < widget.customers.length
                  ? () => setState(() => _currentPage++)
                  : null,
              icon: const Icon(Icons.arrow_circle_right),
            ),
          ],
        ),
      ],
    );
  }

  void _showDeleteDaialogue() {
    showDialog(context: context, builder: (context){
      return AlertDialog(
        title: Text("Confirm Delete"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child:Text("Cancel")),
          TextButton(onPressed: (){}, child: Text("Delete"))
        ],
      );
    },
    );
  }

  void _showEditDialogue(){
    showDialog(context: context, builder: (context){
      return Addcustomer();
    },);
  }
}
