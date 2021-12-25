import 'package:flutter/material.dart';

class CustomAnimatedIcon extends StatefulWidget {
  final IconData startIcon;
  final IconData endIcon;
  final Duration duration;
  final Color? startIconColor;
  final Color? endIconColor;
  final double? iconSize;
  final double? beginRotation;
  final double? endRotation;
  final bool? startWithEnd;
  final EdgeInsets? padding;
  final String? label;
  final double? labelSize;

  const CustomAnimatedIcon({
    Key? key,
    required this.startIcon,
    required this.endIcon,
    required this.duration,
    this.startIconColor = Colors.black,
    this.endIconColor = Colors.black,
    this.startWithEnd = false,
    this.iconSize = 24.0,
    this.beginRotation = 0.0,
    this.endRotation = 1.0,
    this.padding = EdgeInsets.zero,
    this.label,
    this.labelSize = 12.0,
  }) : super(key: key);

  @override
  _CustomAnimatedIconState createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Widget _startWidget;
  late final Widget _endWidget;
  late Widget _selectedWidget;
  late bool _toggled;

  @override
  void initState() {
    _startWidget = Icon(
      widget.startIcon,
      key: UniqueKey(),
      size: widget.iconSize,
      color: widget.startIconColor,
    );
    _endWidget = Icon(
      widget.endIcon,
      key: UniqueKey(),
      size: widget.iconSize,
      color: widget.endIconColor,
    );
    _toggled = widget.startWithEnd! ? true : false;
    _selectedWidget = widget.startWithEnd! ? _endWidget : _startWidget;
    _animationController = AnimationController(
      vsync: this,
      duration: widget.duration,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        setState(() => _toggled = !_toggled);
        if (_toggled) {
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward();
          setState(() => _selectedWidget = _endWidget);
        } else {
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward();
          setState(() => _selectedWidget = _startWidget);
        }
      },
      child: Column(
        children: [
          RotationTransition(
            turns: Tween(
              begin: !widget.startWithEnd! ? widget.beginRotation : widget.endRotation,
              end: !widget.startWithEnd! ? widget.endRotation : widget.beginRotation,
            ).animate(
              CurvedAnimation(
                parent: _animationController,
                curve: Curves.easeInOut,
              ),
            ),
            child: Padding(
              padding: widget.padding!,
              child: AnimatedSwitcher(
                duration: widget.duration,
                child: _selectedWidget,
              ),
            ),
          ),
          if (widget.label != null) ...[
            Text(
              widget.label!,
              style: TextStyle(fontSize: widget.labelSize),
            ),
          ],
        ],
      ),
    );
  }
}
