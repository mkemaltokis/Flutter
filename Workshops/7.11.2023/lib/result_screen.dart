import 'package:flutter/material.dart';

class ResultScreen extends StatefulWidget {
  const ResultScreen({super.key, required this.userAnswers});
  final List<String> userAnswers;

  @override
  State<ResultScreen> createState() => _ResultScreenState();
}

class _ResultScreenState extends State<ResultScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          itemCount: widget.userAnswers.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(widget.userAnswers[index]),
            );
          },
        ),
      ),
    );
  }
}
