import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  @override
  Widget build(BuildContext context){
    const title = 'Demo Stateless Widget';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text(title),
        ),
        body: const MyTextWidget(),
      ),
    );
  }
}

class MyTextWidget extends StatelessWidget{
  const MyTextWidget({super.key});

  @override
  Widget build(BuildContext context){
    return const Center(
      child: Text('Hallo Minimalismus\nStateless Widget\nMaximal Zustandslos'),
    );
  }
}
