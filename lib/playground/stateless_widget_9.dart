import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'RichText-Demo';
    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyRichText(),
      ),
    );
  }
}

class MyRichText extends StatelessWidget {
  const MyRichText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RichText(
        text: const TextSpan(
          text: 'Hello ',
          style: TextStyle(color: Colors.black, fontSize: 30),
          children: <TextSpan>[
            TextSpan(
                text: 'bold',
                style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' world!'),
          ],
        ),
      ),
    );
  }
}
