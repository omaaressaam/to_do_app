import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  Function onpress;
  String txt;
  MyButton({Key? key, required this.onpress, required this.txt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 20),
        height: 80,
        child: FloatingActionButton(
          onPressed: () {
            onpress();
          },
          backgroundColor: Colors.green,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            txt,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
