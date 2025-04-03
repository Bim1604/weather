import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';

class HomeBodyElement extends StatelessWidget {
  const HomeBodyElement({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ListView.builder(
          itemCount: 4,
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return buildItemWidget(context);
          }
      ),
    );
  }
}

Widget buildItemWidget(BuildContext context) {
  Widget result = Container(
    height: 80,
    decoration: BoxDecoration(
      border: Border(
        bottom: BorderSide(width: 1, color: AppColor.borderColor)
      )
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tuesday', style: Theme.of(context).textTheme.titleSmall,),
        Text('24' + "C", style: Theme.of(context).textTheme.titleSmall,),
      ],
    ),
  );
  return result;
}