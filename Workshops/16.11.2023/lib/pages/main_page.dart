import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/expense.dart';
import 'package:flutter_application_1/widgets/expense_item.dart';
import 'package:flutter_application_1/widgets/new_expense.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List<Expense> expenses = [
    Expense(
        name: "Yemek",
        price: 500.529,
        date: DateTime.now(),
        category: Category.food),
    Expense(
        name: "Udemy Kursu",
        price: 200,
        date: DateTime.now(),
        category: Category.work),
  ];
  void addNewExpense(Expense newExpense) {
    setState(() {
      expenses.add(newExpense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        title: const Text("Expense App"),
        backgroundColor: Colors.deepPurpleAccent,
        actions: [
          IconButton(
              onPressed: () {
                showModalBottomSheet(
                    context: context,
                    builder: (ctx) {
                      return NewExpense(addNewExpense: (newExpense) {
                        addNewExpense(newExpense);
                        print("aaaaa");
                      });
                    });
              },
              icon: const Icon(Icons.add))
        ],
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 150,
            child: Text("Grafik Bölümü"),
          ),
          Expanded(
            child: ListView.builder(
                itemCount: expenses.length,
                itemBuilder: (context, index) {
                  return ExpenseItem(expenses[index]);
                }),
          ),
          const SizedBox(
            height: 150,
            child: Text("Burası bottom bar."),
          )
        ]),
      ),
    );
  }
}

//addNewExpense(Expense newExpense) {}
