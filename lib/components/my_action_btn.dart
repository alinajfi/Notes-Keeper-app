import 'package:flutter/material.dart';

class MyActionButton extends StatelessWidget {
  const MyActionButton({Key? key, required this.icon, required this.onTap})
      : super(key: key);

  final Icon icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var height = size.height;
    var width = size.width;
    return InkWell(
      splashColor: Colors.yellow,
      onTap: onTap,
      child: Material(
        elevation: 5,
        type: MaterialType.transparency,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            alignment: Alignment.center,
            clipBehavior: Clip.hardEdge,
            height: height * 0.05,
            width: width * 0.07,
            decoration: BoxDecoration(
              color: Colors.grey,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(8),
            ),
            child: icon,
          ),
        ),
      ),
    );
  }
}
