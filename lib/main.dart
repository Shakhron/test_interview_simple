import 'dart:developer';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Scaffold(
          body: Center(
        child: CheckBoxWithTextWidget(
          text: 'texttextteadadafxt',
          isSelected: true,
        ),
      )),
    );
  }
}

class CheckBoxWithTextWidget extends StatefulWidget {
  final String text;
  final bool isSelected;

  const CheckBoxWithTextWidget({
    super.key,
    required this.text,
    required this.isSelected,
  });

  @override
  State<CheckBoxWithTextWidget> createState() => _CheckBoxWithTextWidgetState();
}

class _CheckBoxWithTextWidgetState extends State<CheckBoxWithTextWidget> {
  var textVisible = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    log(textVisible.toString());
    return Row(
      children: [
        ValueListenableBuilder(
            valueListenable: textVisible,
            builder: (context, value, w) {
              if (value) {
                return Text(widget.text);
              } else {
                return Flexible(
                  child: Text(
                    widget.text,
                    overflow: TextOverflow.ellipsis,
                  ),
                );
              }
            }),
        DashWidget(textVisible: textVisible),
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: widget.isSelected,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}

class DashWidget extends StatelessWidget {
  final ValueNotifier<bool> textVisible;
  const DashWidget({super.key, required this.textVisible});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          final boxWidth = constraints.constrainWidth();
          const dashWidth = 5.0;
          final dashCount = (boxWidth / (2 * dashWidth)).floor();
          if (dashCount <= 2) {
            textVisible.value = false;
          } else {
            textVisible.value = true;
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: List.generate(dashCount, (_) {
              return SizedBox(
                width: dashWidth,
                height: 1,
                child: (textVisible.value)
                    ? const DecoratedBox(
                        decoration: BoxDecoration(color: Colors.black),
                      )
                    : const SizedBox(),
              );
            }),
          );
        },
      ),
    );
  }
}
