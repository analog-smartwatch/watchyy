import 'package:flutter/material.dart';
import 'package:watchyy/styles/styles.dart';
import 'package:watchyy/widgets/icons.dart';

class WAAccordion extends StatefulWidget {
  const WAAccordion({
    super.key,
    required this.title,
    required this.content,
    this.initiallyExpanded = false,
  });

  final String title;
  final String content;
  final bool initiallyExpanded;

  @override
  WAAccordionState createState() => WAAccordionState();
}

class WAAccordionState extends State<WAAccordion>
    with SingleTickerProviderStateMixin {
  var _isExpanded = false;

  late final AnimationController _animationController;
  late final Animation<double> _animation;

  static const _duration = Duration(milliseconds: 200);
  static const _curve = Curves.easeInOut;

  @override
  void initState() {
    super.initState();
    _isExpanded = widget.initiallyExpanded;

    _animationController = AnimationController(
      vsync: this,
      duration: _duration,
    );
    _animation = CurvedAnimation(
      parent: _animationController,
      curve: _curve,
    );

    if (_isExpanded) {
      _animationController.value = 1.0;
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _toggleExpansion() {
    setState(() {
      _updateExpansion(!_isExpanded);
    });
  }

  void _updateExpansion(bool expand) {
    _isExpanded = expand;
    if (_isExpanded) {
      _animationController.forward();
    } else {
      _animationController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return GestureDetector(
      onTap: _toggleExpansion,
      child: Container(
        padding: WASpacings.lg.all,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: colorScheme.inverseSurface,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    widget.title,
                    style: AppTheme.of(context).appTypography.bodyLarge,
                  ),
                ),
                Padding(
                  padding: WASpacings.lg.start,
                  child: Icon(
                    _isExpanded ? WAIcons.chevronUp : WAIcons.chevronDown,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),
            SizeTransition(
              axisAlignment: 1,
              sizeFactor: _animation,
              child: Semantics(
                container: true,
                child: Padding(
                  padding: WASpacings.lg.top,
                  child: Text(
                    widget.content,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
