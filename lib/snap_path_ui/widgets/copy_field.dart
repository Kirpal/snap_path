import 'package:async/async.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// A text field that allows you to click it and copy the text
class CopyField extends StatefulWidget {
  const CopyField({
    Key? key,
    this.text,
  }) : super(key: key);

  final String? text;

  @override
  _CopyFieldState createState() => _CopyFieldState();
}

class _CopyFieldState extends State<CopyField> {
  bool _showCopied = false;
  late RestartableTimer _copiedTimer;

  @override
  void initState() {
    super.initState();

    _copiedTimer = RestartableTimer(const Duration(seconds: 2), () {
      setState(() {
        _showCopied = false;
      });
    });
  }

  @override
  void dispose() {
    _copiedTimer.cancel();
    super.dispose();
  }

  void _onCopied() {
    Clipboard.setData(ClipboardData(text: widget.text));
    setState(() {
      _showCopied = true;
    });
    _copiedTimer.reset();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.text != null ? _onCopied : null,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(color: Theme.of(context).disabledColor)),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: <Widget>[
            Text(
              widget.text ?? '',
              maxLines: 1,
              overflow: TextOverflow.fade,
              softWrap: false,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 150),
                opacity: _showCopied ? 1 : 0,
                child: Container(
                  decoration: BoxDecoration(boxShadow: [
                    BoxShadow(
                      blurRadius: 4,
                      color: Theme.of(context).backgroundColor,
                      spreadRadius: 8,
                    )
                  ]),
                  child: Text(
                    'Copied!',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor.withOpacity(0.8),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
