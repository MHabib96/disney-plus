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
  final bool? startInReverse;
  final EdgeInsets? padding;
  final String? label;
  final double? labelSize;
  final Function()? startIconOnTap;
  final Function()? endIconOnTap;

  const CustomAnimatedIcon({
    Key? key,
    required this.startIcon,
    required this.endIcon,
    required this.duration,
    this.startIconColor = Colors.black,
    this.endIconColor = Colors.black,
    this.startInReverse = false,
    this.iconSize = 26.0,
    this.beginRotation = 0.0,
    this.endRotation = 1.0,
    this.padding = EdgeInsets.zero,
    this.label,
    this.labelSize = 12.0,
    this.startIconOnTap,
    this.endIconOnTap,
  }) : super(key: key);

  @override
  _CustomAnimatedIconState createState() => _CustomAnimatedIconState();
}

class _CustomAnimatedIconState extends State<CustomAnimatedIcon>
    with SingleTickerProviderStateMixin {
  late final AnimationController _animationController;
  late final Widget _startWidget;
  late final Widget _endWidget;
  late final double _beginRotation;
  late final double _endRotation;
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
    _toggled = widget.startInReverse!;
    _beginRotation = (!widget.startInReverse! ? widget.beginRotation : widget.endRotation)!;
    _endRotation = (!widget.startInReverse! ? widget.endRotation : widget.beginRotation)!;
    _selectedWidget = widget.startInReverse! ? _endWidget : _startWidget;
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
          if (widget.startIconOnTap != null) {
            widget.startIconOnTap!();
          }
          _animationController.isCompleted
              ? _animationController.reverse()
              : _animationController.forward();
          setState(() => _selectedWidget = _endWidget);
        } else {
          if (widget.endIconOnTap != null) {
            widget.endIconOnTap!();
          }
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
              begin: _beginRotation,
              end: _endRotation,
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
