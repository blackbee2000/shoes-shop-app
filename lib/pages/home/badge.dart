import 'package:flutter/material.dart';

class Badge extends StatefulWidget {
  const Badge({
    Key? key,
    required this.child,
    required this.value,
    this.color,
  }) : super(key: key);

  final Widget child;
  final int value;
  final Color? color;

  @override
  State<Badge> createState() => _BadgeState();
}

class _BadgeState extends State<Badge> {
  @override
  Widget build(BuildContext context) {
    print(widget.value);
    return Stack(
      alignment: Alignment.center,
      children: [
        widget.child,
        widget.value > 0
            ? Positioned(
                right: 0,
                top: 12,
                child: Container(
                  padding: EdgeInsets.all(2.0),
                  // color: Theme.of(context).accentColor,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    // ignore: deprecated_member_use
                    color: widget.color != null ? widget.color : Colors.red,
                  ),
                  constraints: BoxConstraints(
                    minWidth: 12,
                    minHeight: 12,
                  ),
                  child: Text(
                  widget.value > 99 ? "99+" :widget.value.toString(),
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 8,
                    ),
                  ),
                ),
              )
            : Container()
      ],
    );
  }
}
