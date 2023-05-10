import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final String? name;
  final String? mail;
  final String? flatButtonText;
  final Function()? onClickFunction;
  final Color? nameTextColor;
  final Color? mailTextColor;
  final Color? buttonTextColor;
  final double? nameFontSize;
  final double? mailFontSize;
  final double? buttonFontSize;
  final FontWeight? nameFontWeight;
  final FontWeight? mailFontWeight;
  final FontWeight? buttonFontWeight;
  const CustomDrawer({
    super.key,
    this.name,
    this.mail,
    this.flatButtonText,
    this.onClickFunction,
    this.buttonFontSize,
    this.buttonFontWeight,
    this.buttonTextColor,
    this.mailFontSize,
    this.mailFontWeight,
    this.mailTextColor,
    this.nameFontSize,
    this.nameFontWeight,
    this.nameTextColor,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        padding: const EdgeInsets.only(
          left: 30.0,
          right: 30.0,
          top: 150.0,
          bottom: 50.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              name ?? "",
              style: TextStyle(
                color: nameTextColor ?? Colors.white,
                fontWeight: nameFontWeight ?? FontWeight.w400,
                fontSize: nameFontSize ?? 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Text(
              mail ?? "",
              style: TextStyle(
                color: mailTextColor ?? Colors.white,
                fontWeight: mailFontWeight ?? FontWeight.w400,
                fontSize: mailFontSize ?? 14,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.red,
                ),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              child: TextButton(
                onPressed: onClickFunction,
                child: Text(
                  flatButtonText ?? "",
                  style: TextStyle(
                    color: buttonTextColor ?? Colors.white,
                    fontWeight: buttonFontWeight ?? FontWeight.w400,
                    fontSize: buttonFontSize ?? 14,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
