import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String? text;
  final Color? textColor;
  final FontWeight? fontWeight;
  final double? fontSize;
  final Color? buttonBackroundColor;
  final Function()? onClick;
  final double? buttonHeight;
  final double? buttonWidth;
  final double? borderRadius;
  const CustomButton({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.buttonBackroundColor,
    this.onClick,
    this.buttonHeight,
    this.buttonWidth,
    this.borderRadius,
  });

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onClick ?? () {},
      child: Container(
        height: widget.buttonHeight ?? 50.0,
        width: widget.buttonWidth ?? 200.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(widget.borderRadius ?? 12),
          color: widget.buttonBackroundColor ?? Colors.amber,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 2), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            widget.text ?? "",
            style: TextStyle(
              color: widget.textColor ?? Colors.white,
              fontWeight: widget.fontWeight ?? FontWeight.w400,
              fontSize: widget.fontSize ?? 14,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
    );
  }
}
