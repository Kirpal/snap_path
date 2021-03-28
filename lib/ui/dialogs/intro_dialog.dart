import 'package:flutter/material.dart';
import 'package:snap_path/ui/dialogs/rounded_dialog.dart';

class IntroDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RoundedDialog(
      title: 'Welcome!',
      action: 'Get started',
      items: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            IntroItem(
              icon: Image.asset('assets/icons/straight_path.png'),
              title: 'Tap',
              description: 'A route will be generated between points',
            ),
            IntroItem(
              icon: Image.asset('assets/icons/curved_path.png'),
              title: 'Scribble',
              description: 'Your drawing will snap to nearby roads and trails',
            ),
            IntroItem(
              icon: Image.asset('assets/icons/elevation_graph.png'),
              title: 'Chart',
              description: 'Swipe up to see the elevation profile',
            ),
          ],
        ),
      ],
    );
  }
}

class IntroItem extends StatelessWidget {
  IntroItem({
    @required this.icon,
    @required this.title,
    @required this.description,
  });

  final Widget icon;
  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          const Spacer(
            flex: 1,
          ),
          Flexible(child: icon, flex: 2),
          const Spacer(
            flex: 1,
          ),
          Flexible(
            fit: FlexFit.loose,
            flex: 12,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Text(
                    title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 20),
                  ),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
