// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          body: Center(
        child: CheckBoxWithTextWidget(
          text: 'texttextteadadafxt',
          isSelected: true,
        ),
      )),
    );
  }
}

class CheckBoxWithTextWidget extends StatelessWidget {
  final String text;
  final bool isSelected;

  const CheckBoxWithTextWidget({
    Key? key,
    required this.text,
    required this.isSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 2,
            child: Text(
              text,
              overflow: TextOverflow.ellipsis,
            )),
        Expanded(
          flex: 8,
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              final boxWidth = constraints.constrainWidth();
              const dashWidth = 15.0;
              final dashCount = (boxWidth / (8 * dashWidth)).floor();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(dashCount, (_) {
                  return (boxWidth <= 10)
                      ? const SizedBox()
                      : const SizedBox(
                          width: dashWidth,
                          height: 1,
                          child: DecoratedBox(
                            decoration: BoxDecoration(color: Colors.black),
                          ),
                        );
                }),
              );
            },
          ),
        ),
        SizedBox(
          width: 24,
          height: 24,
          child: Checkbox(
            value: isSelected,
            onChanged: (value) {},
          ),
        ),
      ],
    );
  }
}
