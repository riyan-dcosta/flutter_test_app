import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test_app/core/orientation_detector.dart';

class ScreenSize extends StatefulWidget {
  const ScreenSize({Key? key}) : super(key: key);

  @override
  _ScreenSizeState createState() => _ScreenSizeState();
}

class _ScreenSizeState extends State<ScreenSize> {
  @override
  void initState() {
    super.initState();
    // makeFullScreen();
    getWindowSize();
  }

  getWindowSize() {
    final windowSize = WidgetsBinding.instance.platformDispatcher.implicitView;
    print("WindowSizen : height-${windowSize?.display.size.height}"
        " width- ${windowSize?.display.size.width}");
    print("device refresh rate : ${windowSize?.display.refreshRate}");
    // print("dpr : ${windowSize.devicePixelRatio}");
    // print("resolution : ${windowSize}");

    final mediaQueryData = PlatformDispatcher.instance.implicitView;
    print("viewInsets ${mediaQueryData?.viewInsets}");
    print("viewPadding ${mediaQueryData?.viewPadding}");
  }

  makeFullScreen() {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.red,
        statusBarBrightness: Brightness.light,
        systemNavigationBarColor: Colors.blue,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.manual,
      overlays: [],
    ).then(
      (value) => getWindowSize(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return OrientationDetector(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        home: SafeArea(
          child: Scaffold(
            appBar: AppBar(
              title: const Text("Hello"),
              backgroundColor: Colors.green,
            ),
            body: const ScreenSizeHome(),
          ),
        ),
      ),
    );
  }
}

class ScreenSizeHome extends StatefulWidget {
  const ScreenSizeHome({super.key});

  @override
  State<ScreenSizeHome> createState() => _ScreenSizeHomeState();
}

class _ScreenSizeHomeState extends State<ScreenSizeHome> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: const Text("Place the width and height of the screen, "
          "also update it when it changes its orientation"),
    );
  }
}
