import 'package:flutter/material.dart';

class CustomAnimatedIcon extends StatefulWidget {
  final IconData startIcon;
  final IconData endIcon;
  final Duration duration;
  final Color? startIconColor;
  final Color? endIconColor;
  final bool? startWithEnd;
  final double? beginRotation;
  final double? endRotation;

  const CustomAnimatedIcon({
    Key? key,
    required this.startIcon,
    required this.endIcon,
    required this.duration,
    this.startIconColor = Colors.black,
    this.endIconColor = Colors.black,
    this.startWithEnd = false,
    this.beginRotation = 0.0,
    this.endRotation = 1.0,
  }) : super(key: key);

  @override
  _CustomAnimatedIconState createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late Widget _startWidget;
  late Widget _endWidget;
  late Widget _selectedWidget;
  late bool _toggled;

  @override
  void initState() {
    _startWidget = Icon(
      widget.startIcon,
      key: UniqueKey(),
      color: widget.startIconColor,
    );
    _endWidget = Icon(
      widget.endIcon,
      key: UniqueKey(),
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
      child: RotationTransition(
        turns: Tween(
          begin: !widget.startWithEnd! ? widget.beginRotation : widget.endRotation,
          end: !widget.startWithEnd! ? widget.endRotation : widget.beginRotation,
        ).animate(
          CurvedAnimation(
            parent: _animationController,
            curve: Curves.easeInOut,
          ),
        ),
        child: AnimatedSwitcher(
          duration: widget.duration,
          child: _selectedWidget,
        ),
      ),
    );
  }
}
