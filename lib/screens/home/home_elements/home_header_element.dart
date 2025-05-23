import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';

class HomeHeaderElement extends StatelessWidget {
  const HomeHeaderElement({super.key, required this.temperature, required this.location});

  final String temperature;
  final String location;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 56, bottom: 62),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: AppColor.backgroundColor,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            spreadRadius: 2,
            offset: const Offset(0, 4),
          ),
        ]
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('$temperature°', style: Theme.of(context).textTheme.displayLarge, textAlign: TextAlign.center,),
          Text(location, style: Theme.of(context).textTheme.displayMedium, textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}
