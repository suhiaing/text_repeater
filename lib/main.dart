import 'package:flutter/material.dart';

void main() {
  runApp(const MaterialApp(
    home: Scaffold(
      body: Center(
        child: MyApp(),
      ),
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
  String? result = "";

  void fn() {
    setState(() {
      String? textesVar;
      int? amountVar;
      try {
        textesVar = textes.text;
        amountVar = int.parse(amount.text);
      } catch (e) {
        debugPrint("$e");
      }
      if (textesVar != null && amountVar != null) {
        result = (textesVar * amountVar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 500,
            height: 100,
            child: TextField(
              controller: textes,
              decoration: const InputDecoration(
                hintText: "Enter text:",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          SizedBox(
            width: 500,
            height: 100,
            child: TextField(
              controller: amount,
              decoration: const InputDecoration(
                hintText: "Enter times:",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          TextButton(
              onPressed: fn,
              style: TextButton.styleFrom(
                backgroundColor: Colors.black,
                foregroundColor: Colors.white,
                fixedSize: const Size(480, 50),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
              child: const Text("Repeat")),
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
