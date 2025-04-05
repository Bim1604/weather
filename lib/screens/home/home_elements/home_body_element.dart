import 'package:flutter/material.dart';
import 'package:untitled1/datas/app_color.dart';
import 'package:untitled1/models/weather_forecast_model.dart';

class HomeBodyElement extends StatelessWidget {
  const HomeBodyElement({super.key, required this.forecast});

  final WeatherForecast forecast;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      child: ListView.builder(
          itemCount: forecast.list.length,
          padding: EdgeInsets.zero,
          physics: const AlwaysScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            ForecastItem item = forecast.list[index];
            List<double> dailyTemp = forecast.dailyTemp[item.dailyKey] ?? [];
            return buildItemWidget(context, item, dailyTemp);
          }
      ),
    );
  }
}

Widget buildItemWidget(BuildContext context, ForecastItem data, List<double> dailyTemp) {
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
        Text(data.getWeekDayByDate(), style: Theme.of(context).textTheme.titleSmall,),
        Text(data.getDisplayTemp(dailyTemp), style: Theme.of(context).textTheme.titleSmall,),
      ],
    ),
  );
  return result;
}