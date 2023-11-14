import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_test_app/features/bottom_modal_sheet/bttom_sheet_animatables/bottom_sheet_icon.dart';

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
        const CustomBottomSheet()
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
  final _draggableScrollableController = DraggableScrollableController();
  final minHeightPercentage = 0.1;
  final maxHeightPercentage = 0.5;

  Widget containerForBottomSheet(Color? color) => Container(
        height: 100,
        color: color ?? Colors.red,
      );
  final forceDown = false;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    // print("minHeight :  ${mediaQueryData.size.height * 0.2},maxHeight: "
    //     "${mediaQueryData.size.height * 0.5}");
    // return Builder(builder: (builder) {
    //   return Align(
    //     heightFactor: 1,
    //     child: Container(
    //       width: View.of(context).display.size.width,
    //       height: 200,
    //       color: Colors.red,
    //     ),
    //   );
    // });
    return DraggableScrollableSheet(
      controller: _draggableScrollableController,
      initialChildSize: minHeightPercentage,
      minChildSize: minHeightPercentage,
      maxChildSize: maxHeightPercentage,
      builder: (context, scrollController) {
        // print("draggable context : ${context.size?.height?? 0}");
        return NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll.disallowIndicator();
            return true;
          },
          child: SingleChildScrollView(
            controller: scrollController,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: () {
                    if (_draggableScrollableController.size >= 0.49) {
                      _draggableScrollableController.animateTo(minHeightPercentage,
                          duration: Duration(seconds: 2), curve: Curves.ease);
                    } else {
                      _draggableScrollableController.animateTo(maxHeightPercentage,
                          duration: Duration(seconds: 2), curve: Curves.ease);
                    }
                  },
                  child: Container(
                    color: Colors.white,
                    width: double.infinity,
                    height: 100,
                  ),
                ),
                BottomSheetIconAnimation(
                  parentScrollController: _draggableScrollableController,
                  minHeight: minHeightPercentage,
                  maxHeight: maxHeightPercentage,
                ),
                containerForBottomSheet(Colors.red),
              ],
            ),
          ),
        );
      },
    );
  }
}
