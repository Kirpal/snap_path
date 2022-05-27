import 'dart:math';

import 'package:flutter/material.dart';

class RoundedDialog extends StatelessWidget {
  RoundedDialog({
    required this.title,
    required this.items,
    required this.action,
  });

  final String title;
  final List<Widget> items;
  final String action;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(24),
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        width: min(400, MediaQuery.of(context).size.shortestSide),
        padding: const EdgeInsets.all(24),
        child: ListView(
          shrinkWrap: true,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ...items,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: TextButton(
                style: TextButton.styleFrom(
                  primary: Theme.of(context).backgroundColor,
                  backgroundColor: Theme.of(context).primaryColor,
                ),
                child: Text(action),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
