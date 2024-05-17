import 'package:flutter/material.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget{
  const MyApp({Key? key}):super(key: key);

  static const String _title = 'Beispiel';


  @override
  Widget build(BuildContext context){
    const title = _title;
    home: const MyStatelessWidget();
  }
}

class MyStatelessWidget extends StatelessWidget{
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scaffold-Bsp'),
        backgroundColor: Colors.cyan,
        /*bottomNavigationBar: const BottomAppBar(
          color: Colors.cyanAccent,
          shape: CircularNotchedRectangle(),
          child: SizedBox(
            height: 300,
            child:  Center(child:Text("bottom_nav_bar")),
        ),
      ),*/
      //body: _buildCardWidget(),
      ));
  }

  Widget _buildCardWidget(){
    return const SizedBox(
      height: 200,
      child: Card(
        child: Center(
          child: Text('Oberste ard'),
        ),
      ),
    );
  }
}