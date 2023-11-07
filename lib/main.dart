import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_test_app/features/screen_size/screen_size.dart';
import 'package:flutter_test_app/features/web_app/web_home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Widget runAppWidget = const Dummy();
  switch (2) {
    case 1:
      runAppWidget = const ScreenSize();
      break;
    case 2:
      if (kIsWeb) {
        runAppWidget = const WebHome();
      }
    default:
  }
  runApp(runAppWidget);
}

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        child: const Text(
          "Dummy!! Switch case didnt work",
        ),
      ),
    );
  }
}
