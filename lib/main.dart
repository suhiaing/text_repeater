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
  static const myTextStyle = TextStyle(
    fontWeight: FontWeight.w600,
    fontSize: 25,
    wordSpacing: 13,
  );
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
        result = (('$textesVar\n') * amountVar);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const SizedBox(
              width: double.infinity,
              height: 100,
              child: Center(
                child: Text("Welcome Human!", style: myTextStyle),
              )),
          SizedBox(
            width: 500,
            height: 100,
            child: TextField(
              controller: textes,
              cursorColor: Colors.black87,
              decoration: const InputDecoration(
                  hintText: "Enter text:",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            width: 500,
            height: 100,
            child: TextField(
              controller: amount,
              cursorColor: Colors.black87,
              decoration: const InputDecoration(
                  hintText: "Enter times:",
                  border: OutlineInputBorder(),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey))),
            ),
          ),
          SizedBox(
            width: 500,
            child: TextButton(
                onPressed: fn,
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(fontSize: 15),
                  backgroundColor: Colors.grey[400],
                  foregroundColor: Colors.black,
                  fixedSize: const Size(480, 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text("Repeat")),
          ),
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            width: 500,
            child: Center(
              child: SelectableText(
                result!,
                style: myTextStyle,
              ),
            ),
          )
        ], //column childern
      ),
    );
  } //buitd context
}//class
