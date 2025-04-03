import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';
import 'package:untitled1/datas/app_icon.dart';
import 'package:untitled1/utils/image_utils.dart';

class LoadingViewElement extends StatefulWidget {
  const LoadingViewElement({super.key});

  @override
  State<LoadingViewElement> createState() => _LoadingViewElementState();
}

class _LoadingViewElementState extends State<LoadingViewElement> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();

    _rotation = Tween<double>(begin: 0, end: 2 * 3.1416).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.backgroundColor,
      body: Center(
        child: SizedBox(
          height: 96,
          width: 96,
          child: AnimatedBuilder(
            animation: _rotation,
            builder: (context, child) {
              return Transform.rotate(
                angle: _rotation.value,
                child: child,
              );
            },
            child: Image.asset(ImageUtils.getIconString(AppIcon.loading)),
          ),
        ),
      ),
    );
  }
}
