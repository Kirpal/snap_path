import 'package:flutter/material.dart';

class MapControlButton extends StatelessWidget {
  MapControlButton({
    Key key,
    this.icon,
    this.enabled,
    this.size = 52,
    this.onPressed,
  }) : super(key: key);

  final bool enabled;
  final IconData icon;
  final double size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(milliseconds: 200),
      opacity: enabled ? 1 : 0.3,
      child: Material(
        color: Theme.of(context).backgroundColor,
        shape: const CircleBorder(),
        child: InkResponse(
          containedInkWell: true,
          highlightShape: BoxShape.circle,
          highlightColor: Theme.of(context).primaryColor.withOpacity(0.2),
          splashColor: Theme.of(context).primaryColor.withOpacity(0.2),
          customBorder: const CircleBorder(),
          child: SizedBox(
            width: size,
            height: size,
            child: Center(
              child: Icon(
                icon,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          onTap: enabled ? onPressed : null,
        ),
      ),
    );
  }
}

class FloatingMapControlButton extends StatelessWidget {
  FloatingMapControlButton({
    Key key,
    this.icon,
    this.enabled,
    this.size = 52,
    this.onPressed,
  }) : super(key: key);

  final bool enabled;
  final IconData icon;
  final double size;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Theme.of(context).backgroundColor,
        boxShadow: [
          BoxShadow(
              blurRadius: 10,
              offset: const Offset(0, 10),
              color: Colors.black.withOpacity(0.1))
        ],
      ),
      child: MapControlButton(
        icon: icon,
        enabled: enabled,
        size: size,
        onPressed: onPressed,
      ),
    );
  }
}
