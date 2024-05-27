import 'package:flutter/material.dart';
import 'package:notes_app2/pages/register_page_old.dart';
import 'package:notes_app2/pages/rooms_page.dart';
import 'package:notes_app2/utils/constants.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Page to redirect users to the appropriate page depending on the initial auth state
class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  SplashPageState createState() => SplashPageState();
}

class SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    getInitialSession();
    super.initState();
  }

  Future<void> getInitialSession() async {
    // quick and dirty way to wait for the widget to mount
    await Future.delayed(Duration.zero);

    try {
      final session = Supabase.instance.client.auth.currentSession;
      if (session == null) {
        Navigator.of(context)
            .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
      } else {
        Navigator.of(context)
            .pushAndRemoveUntil(RoomsPage.route(), (_) => false);
      }
    } catch (_) {
      context.showErrorSnackBar(
        message: 'Error occurred during session refresh',
      );
      Navigator.of(context)
          .pushAndRemoveUntil(RegisterPage.route(), (_) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
