import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  const MainButton({
    Key? key,
    required this.text,
    this.backgroundColor = const Color.fromRGBO(49, 151, 149, 1),
    this.foregroundColor = Colors.white,
    this.fontSize = 18,
    required this.onPressed,
    this.sideColor = Colors.transparent,
    this.isLoading = false,
    this.isDisabled = false,
  }) : super(key: key);
  final String text;
  final double? fontSize;
  final Color backgroundColor;
  final Color foregroundColor;
  final VoidCallback onPressed;
  final Color sideColor;
  final bool isLoading;
  final bool isDisabled;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 60,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          side: BorderSide(
            color: sideColor,
            width: 1,
          ),
          foregroundColor: foregroundColor,
          backgroundColor: isDisabled ? Colors.grey : backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onPressed: isLoading || isDisabled ? null : onPressed,
        child: isLoading
            ? const CircularProgressIndicator(
                color: Colors.white,
              )
            : Text(
                text,
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
      ),
    );
  }
}
