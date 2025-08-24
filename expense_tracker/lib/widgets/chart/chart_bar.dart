// widgets/chart/chart_bar.dart
import 'package:flutter/material.dart';

class ChartBar extends StatefulWidget {
  const ChartBar({super.key, required this.fill, required this.color});
  final double fill;
  final Color color;

  @override
  State<ChartBar> createState() => _ChartBarState();
}

class _ChartBarState extends State<ChartBar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _heightAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    );
    _heightAnimation = Tween<double>(
      begin: 0.0,
      end: widget.fill,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));
    _controller.forward();
  }

  @override
  void didUpdateWidget(ChartBar oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.fill != widget.fill) {
      _heightAnimation = Tween<double>(
        begin: oldWidget.fill,
        end: widget.fill,
      ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
      _controller.reset();
      _controller.forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 6),
        child: AnimatedBuilder(
          animation: _heightAnimation,
          builder: (context, child) {
            return Container(
              height: 120,
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 120 * _heightAnimation.value,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [widget.color, widget.color.withOpacity(0.7)],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: widget.color.withOpacity(0.3),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
