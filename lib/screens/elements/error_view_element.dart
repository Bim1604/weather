 import 'package:flutter/material.dart';
import 'package:untitled1/components/buttons/button_default.dart';
import 'package:untitled1/datas/app_color.dart';

class ErrorViews extends StatefulWidget {
   const ErrorViews({super.key});

   @override
   State<ErrorViews> createState() => _ErrorViewsState();
 }

 class _ErrorViewsState extends State<ErrorViews> {
   @override
   Widget build(BuildContext context) {
     Size size = MediaQuery.sizeOf(context);
     return Container(
       alignment: Alignment.center,
       color: AppColor.screenErrBGColor,
       padding: EdgeInsets.symmetric(horizontal: size.width * .15),
       child: Column(
         crossAxisAlignment: CrossAxisAlignment.center,
         mainAxisAlignment: MainAxisAlignment.center,
         children: [
            Text("Something went wrong at our end!", style: Theme.of(context).textTheme.titleMedium, textAlign: TextAlign.justify,),
            const SizedBox(height: 44),
            const ButtonDefault(
              content: "RETRY",
            )
         ],
       ),
     );
   }
 }
