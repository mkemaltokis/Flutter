import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewExpense extends StatefulWidget {
  const NewExpense({Key? key}) : super(key: key);

  @override
  _NewExpenseState createState() => _NewExpenseState();
}

class _NewExpenseState extends State<NewExpense> {
  var _expenseNameController = TextEditingController();
  var _expensePriceController = TextEditingController();

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2022),
        lastDate: DateTime.now());
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(children: [
          TextField(
            controller: _expenseNameController,
            maxLength: 50,
            decoration: const InputDecoration(labelText: "Harcama Adı"),
          ),
          TextField(
            controller: _expensePriceController,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(labelText: "Harcama Miktarı"),
          ),
          IconButton(
              onPressed: () {
                _selectDate(context);
              },
              icon: const Icon(Icons.calendar_month)),
          Text(DateFormat.yMd().format(selectedDate)),
          ElevatedButton(
              onPressed: () {
                print(
                    "Kaydedilen değer: ${_expenseNameController.text} ${_expensePriceController.text}");
              },
              child: const Text("Ekle"))
        ]),
      ),
    );
  }
}
