import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const title = 'Drawer-Demo';
    return MaterialApp(
      title: title,
      home: Scaffold(
        body: DemoPageOne(),
      ),
    );
  }
}

class DemoPageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seite Eins"),
      ),
      body: const Center(
        child: Text('Demo: Seite Eins'),
      ),
      drawer: const MyDrawerWidget(),
    );
  }
}

class DemoPageTwo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seite Zwei"),
      ),
      body: const Center(
        child: Text('Demo: Seite Zwei'),
      ),
      drawer: const MyDrawerWidget(),
    );
  }
}

class DemoPageThree extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seite Drei"),
      ),
      body: const Center(
        child: Text('Demo: Seite Drei'),
      ),
      drawer: const MyDrawerWidget(),
    );
  }
}

class DemoPageFour extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Seite Vier"),
      ),
      body: const Center(
        child: Text('Demo: Seite Vier'),
      ),
      endDrawer: const MyDrawerWidget(),
    );
  }
}

class MyDrawerWidget extends StatelessWidget {
  const MyDrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          const DrawerHeader(
            child: Icon(Icons.home, size: 35),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Drawer Element 1'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DemoPageOne()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('Drawer Element 2'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DemoPageTwo()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.favorite),
            title: const Text('Drawer Element 3'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DemoPageThree()),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.list),
            title: const Text('Drawer Element 4'),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => DemoPageFour()),
              );
            },
          ),
        ],
      ),
    );
  }
}