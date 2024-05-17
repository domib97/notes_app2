import 'package:flutter/material.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

// Beispiel 2: JSON-Datensatz
class MyData {
  final String items = '''{
    "data": [
      { "title": "Januar" },
      { "title": "Februar" },
      { "title": "März" }
    ]
  }''';
}

class DataSeries {
  final List<DataItem> dataModel;

  DataSeries({required this.dataModel});

  factory DataSeries.fromJson(Map<String, dynamic> json) {
    var list = json['data'] as List;
    List<DataItem> dataList = list.map((dataModel) => DataItem.fromJson(dataModel)).toList();
    return DataSeries(dataModel: dataList);
  }
}

class DataItem {
  final String title;

  DataItem({required this.title});

  factory DataItem.fromJson(Map<String, dynamic> json) {
    return DataItem(title: json['title']);
  }
}

class MyApp extends StatelessWidget {
  // Dieses Widget ist die Root der Anwendung.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Lokales JSON Future',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(
        title: 'Demo Lokales JSON Future',
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<DataSeries> dataSeries;

  Future<String> _loadLocalData() async {
    final MyData data = MyData();
    return data.items;
  }

  Future<DataSeries> fetchData() async {
    String jsonString = await _loadLocalData();
    final jsonResponse = json.decode(jsonString);
    DataSeries dataSeries = DataSeries.fromJson(jsonResponse);
    print(dataSeries.dataModel[0].title);
    return dataSeries;
  }

  @override
  void initState() {
    super.initState();
    dataSeries = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: FutureBuilder<DataSeries>(
        future: dataSeries,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.dataModel.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(snapshot.data!.dataModel[index].title),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
