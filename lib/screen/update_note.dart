import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class UpdateNote extends StatelessWidget {
  const UpdateNote({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text('Upadte Note'),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(
                context,
              );
            },
            child: Text('pop'))
      ]),
    );
  }
}
