import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: MyApp(),
    ),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  TextEditingController textes = TextEditingController();
  TextEditingController amount = TextEditingController();
  String? result;

  void fn() {
    try {
      String? textesVar = textes.text;
      int? amountVar = int.parse(amount.text);
      result = (textesVar * amountVar);
    } catch (e) {
      print(e);
    }
    debugPrint("${textes.text} and ${amount.text}");
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 200,
            child: TextField(
              controller: textes,
              decoration: const InputDecoration(
                hintText: "Enter text",
              ),
            ),
          ),
          SizedBox(
            width: 200,
            child: TextField(
              controller: amount,
              decoration: const InputDecoration(
                hintText: "Enter times",
              ),
            ),
          ),
          TextButton(onPressed: fn, child: const Text("Repeat")),
          SizedBox(
            child: Center(
              child: Text(result!),
            ),
          )
        ], //column childern
      ),
    );
  } //buitd context
}//class
