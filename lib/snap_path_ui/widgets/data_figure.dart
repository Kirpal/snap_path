import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class DataFigure extends StatelessWidget {
  DataFigure({
    required this.group,
    this.name,
    this.data,
    this.unit,
  });

  final AutoSizeGroup group;
  final String? name;
  final String? data;
  final String? unit;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          if (name?.isNotEmpty ?? false)
            AutoSizeText(
              name!,
              maxLines: 1,
            ),
          if (data?.isNotEmpty ?? false)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: AutoSizeText(
                data!,
                group: group,
                maxLines: 1,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
            ),
          if (unit?.isNotEmpty ?? false)
            AutoSizeText(
              unit!,
              maxLines: 1,
            ),
        ],
      ),
    );
  }
}
