import 'package:flutter/material.dart';

class OrientationDetector extends StatefulWidget {
  final Widget child;
  const OrientationDetector({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _OrientationDetectorState createState() => _OrientationDetectorState();
}

class _OrientationDetectorState extends State<OrientationDetector> {
  // Listener<Orientation> orientationListener = Orientation.portrait;
  @override
  Widget build(BuildContext context) {
    return OrientationBuilder(
      builder: (BuildContext context, Orientation orientation) {
        print("orientationDetector : $orientation");
        return widget.child;
      },
    );
  }
}
