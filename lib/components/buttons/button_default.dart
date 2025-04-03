import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';

class ButtonDefault extends StatefulWidget {
  const ButtonDefault({super.key, this.width = 90, this.height = 45, required this.content, this.radiusAll = 5.0});

  final double width;
  final double height;
  final String content;
  final double radiusAll;

  @override
  State<ButtonDefault> createState() => _ButtonDefaultState();
}

class _ButtonDefaultState extends State<ButtonDefault> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColor.buttonBGColor,
          borderRadius: BorderRadius.circular(widget.radiusAll)
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: (){
            
          },
          radius: widget.radiusAll,
          splashColor: AppColor.buttonBGColor.withOpacity(.2),
          child: Container(
              alignment: Alignment.center,
              width: widget.width,
              height: widget.height,
              child: Text(widget.content, style: Theme.of(context).textTheme.labelLarge,)),
        ),
      ),
    );
  }
}
