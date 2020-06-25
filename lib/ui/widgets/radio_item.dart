import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class RadioItem extends StatelessWidget {
  final bool selected;
  final String text;
  final Function() onSelected;

  RadioItem({@required this.selected, @required this.text, @required this.onSelected});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: selected ? Theme.of(context).primaryColor.withOpacity(0.3) : Colors.transparent,
          borderRadius: BorderRadius.circular(5),
        ),
        child: AutoSizeText(text, maxLines: 1, minFontSize: 6, style: TextStyle(
          color: Theme.of(context).primaryColor,
          fontWeight: selected ? FontWeight.bold : FontWeight.normal,
          fontSize: 16
        ),)
      ),
    );
  }
}