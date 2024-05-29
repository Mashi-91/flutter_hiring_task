import 'package:flutter/material.dart';
import 'package:flutter_hiring_task/widgets/custom_text.dart';

class CustomTile extends StatelessWidget {
  final String text;
  final IconData iconData;
  Color? textColor;
  Color? iconDataColor;
  bool? isBottomMargin;

  CustomTile({
    super.key,
    required this.text,
    required this.iconData,
    this.isBottomMargin = true,
    this.iconDataColor,
    this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isBottomMargin! ? 30 : 0),
      child: Row(
        children: [
          Icon(
            iconData,
            color: iconDataColor ?? Colors.black,
          ),
          const SizedBox(width: 8),
          CustomText(
            text: text,
            color: textColor ?? Colors.black,
          ),
        ],
      ),
    );
  }
}
