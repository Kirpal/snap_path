import 'package:flutter/material.dart';

class RoundedDialog extends StatelessWidget {
  final String title;
  final List<Widget> items;
  final String action;

  RoundedDialog({@required this.title, @required this.items, @required this.action});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: EdgeInsets.all(24),
      backgroundColor: Theme.of(context).backgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: Text(title, style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w500,
              ),),
            ),
            ...items,
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10),
              child: FlatButton(
                textColor: Theme.of(context).backgroundColor,
                color: Theme.of(context).primaryColor,
                child: Text(action),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ),
            //     ),
          ],
        ),
      ),
    );
  }
}