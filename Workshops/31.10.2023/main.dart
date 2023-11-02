import 'package:flutter/material.dart';

void main() {

  runApp(
    const MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 57, 7, 96), // Configuration Widget
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              image: AssetImage("pic/me.jpg"),
            ),
            Text("Muhammed Kemal Tokis",
                style: TextStyle(fontSize: 30, color: Colors.white)),
            Text("Tobeto - Mobil Geliştirme - 1B",
                style: TextStyle(fontSize: 20, color: Colors.white)),
            Text("31.10.2023",
                style: TextStyle(fontSize: 20, color: Colors.white)),
          ],
        )),
      ),
    ),
  );
}
