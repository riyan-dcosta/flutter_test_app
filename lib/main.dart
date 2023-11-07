import 'dart:ui';

import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:flutter_test_app/features/screen_size/screen_size.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Widget runAppWidget = const Dummy();
  switch (1) {
    case 1:
      runAppWidget = const ScreenSize();
      break;
    default:
  }
  runApp(runAppWidget);
}

class Dummy extends StatelessWidget {
  const Dummy({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
