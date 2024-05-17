import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Google Fonts',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: TextTheme(
          bodyLarge: GoogleFonts.aBeeZee(
            fontSize: 30,
            color: Colors.deepOrange,
          ),
          bodyMedium: GoogleFonts.aBeeZee(
            fontSize: 20,
            color: Colors.white60,
          ),
        ),
      ),
      home: const MyHomePage(title: 'Flutter und Kochbuch'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final String title;

  const MyHomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          const Text('Yo MTV Raps', style: TextStyle(fontSize: 30, color: Colors.white)),
          Text(
            'Yo MTV Raps',
            style: GoogleFonts.coiny(
              fontSize: 30,
              color: Colors.blueGrey,
            ),
          ),
          Text(
            'Yo MTV Raps',
            style: GoogleFonts.actor(
              fontSize: 30,
              color: Colors.indigo,
            ),
          ),
        ],
      ),
    );
  }
}
