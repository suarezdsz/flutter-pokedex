import 'package:flutter/material.dart';

Future<void> showMyDialog(BuildContext context) async {
  showGeneralDialog(
    context: context,
    barrierDismissible: true,
    barrierLabel: '',
    transitionDuration: const Duration(microseconds: 400),
    pageBuilder: ((context, animation, secondaryAnimation) {
      return Container();
    }),
    transitionBuilder: (context, animation, secondaryAnimation, child) {
      return ScaleTransition(
          scale: Tween(begin: 0.5, end: 0.5).animate(animation),
          child: AlertDialog(
            title: const Text(
              'AlertDialog Title',
              style: TextStyle(fontSize: 32),
            ),
            content: const SizedBox(
                width: 600, height: 250, child: Text('Data error')),
            shape: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none),
            actions: <Widget>[
              TextButton(
                child: const Text('Aceptar'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          ));
    },
  );
}
