import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter-Codebeispiel für Navigator',
      // MaterialApp enthält unseren Navigator auf oberster Ebene
      initialRoute: '/signup',
      routes: <String, WidgetBuilder>{
        '/': (BuildContext context) => const HomePage(),
        '/signup': (BuildContext context) => const SignUpPage(),
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: Container(
        color: Colors.white,
        alignment: Alignment.center,
        child: const Text('Homepage'),
      ),
    );
  }
}

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    // SignUpPage erstellt ihren eigenen Navigator, der in
    // der App eingebettet sein wird.
    return Navigator(
      initialRoute: 'signup/personal_info',
      onGenerateRoute: (RouteSettings settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case 'signup/personal_info':
          // Annahme: CollectPersonalInfoPage holt persönliche Daten und
          // navigiert dann nach 'signup/choose_credentials'.
            builder = (BuildContext context) => const CollectPersonalInfoPage();
            break;
          case 'signup/choose_credentials':
          // Annahme ChooseCredentialsPage holt neue Credentials und
          // ruft dann 'onSignupComplete()' auf.
            builder = (BuildContext _) => ChooseCredentialsPage(
              onSignupComplete: () {
                // Navigator.of(context) bezieht sich hier auf den
                // obersten Navigator, weil sich SignUpPage oberhalb des
                // eingebetteten erzeugten Navigators befindet. Daher wird
                // dieses pop() die gesamte "Anmelde"-Reise holen und zur
                // ""-Route ( = HomePage) zurückkehren.
                Navigator.of(context).pop();
              },
            );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute<void>(
          builder: builder,
          settings: settings,
        );
      },
    );
  }
}

class ChooseCredentialsPage extends StatelessWidget {
  const ChooseCredentialsPage({
    super.key,
    required this.onSignupComplete,
  });

  final VoidCallback onSignupComplete;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSignupComplete,
      child: DefaultTextStyle(
        style: Theme.of(context).textTheme.headlineMedium!,
        child: Container(
          color: Colors.pink,
          alignment: Alignment.center,
          child: const Text('Credentials-Seite auswählen'),
        ),
      ),
    );
  }
}

class CollectPersonalInfoPage extends StatelessWidget {
  const CollectPersonalInfoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: Theme.of(context).textTheme.headlineMedium!,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name: Max, Adresse: Schlossallee",
              style: TextStyle(fontSize: 20, color: Colors.black87),
            ),
            const SizedBox(height: 10.0),
            GestureDetector(
              onTap: () {
                // Wechsel von der persönlichen Infoseite zur Credentials-Seite,
                // Ersatz dieser Seite.
                Navigator.of(context).pushReplacementNamed('signup/choose_credentials');
              },
              child: const SizedBox(
                child: Text(
                  'Link: Page',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}