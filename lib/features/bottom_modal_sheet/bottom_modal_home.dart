import 'dart:ui';

import 'package:flutter/material.dart';

class BottomModalHome extends StatelessWidget {
  const BottomModalHome({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.grey,
      home: Scaffold(
        backgroundColor: Colors.grey,
        body: ShowBottomModal(),
      ),
    );
  }
}

class ShowBottomModal extends StatelessWidget with WidgetsBindingObserver {
  const ShowBottomModal({super.key});

  @override
  void didChangeMetrics() {
    // super.didChangeMetrics();
    print("didChangeMetrics");
    final keyboardOpen =
        PlatformDispatcher.instance.implicitView?.viewInsets.bottom ?? 0 > 0;
    print("keyboardOpen $keyboardOpen");
  }

  @override
  Widget build(BuildContext context) {
    final padding = View.of(context).padding;
    final viewInsets = View.of(context).viewInsets;
    final viewPadding = View.of(context).viewPadding;
    print("Padding $padding");
    print("viewInsets $viewInsets");
    print("viewPadding $viewPadding");
    return Stack(
      children: [
        Positioned(
          left: 0,
          right: 0,
          top: 0,
          height: 100,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: DecoratedBox(
              decoration: const BoxDecoration(color: Colors.red),
              child: Column(
                children: [
                  const Text("Hello"),
                  Container(
                    color: Colors.blue,
                    child: const TextField(
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Positioned(bottom: 0, child: const CustomBottomSheet())
      ],
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({super.key});

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  Widget containerForBottomSheet(Color? color) => Container(
        width: double.infinity,
        height: 100,
        color: color ?? Colors.red,
      );

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (builder) {
      return Align(
        heightFactor: 1,
        child: Container(
          width: View.of(context).display.size.width,
          height: 200,
          color: Colors.red,
        ),
      );
    });
    return DraggableScrollableSheet(
      initialChildSize: 0.5,
      minChildSize: 0.2,
      maxChildSize: 0.5,
      builder: (context, scrollController) {
        return SingleChildScrollView(
          controller: scrollController,
          child: Column(
            children: [
              containerForBottomSheet(Colors.red),
            ],
          ),
        );
      },
    );
  }
}

// class MeasureSize extends SingleChildRenderObjectWidget{
//   const MeasureSize({super.key});
//
//   @override
//   RenderObject createRenderObject(BuildContext context) {
//
//   }
//
// }
