import 'package:fit_pro/presentation/screens/home/progress/widget/calender/widget/calender.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/calender/widget/quote.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/calender/widget/squre_widget.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/plan_progress/widget/top_image.dart';
import 'package:flutter/widgets.dart';

class CalenderScreenProgress extends StatelessWidget {
  const CalenderScreenProgress({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: const Column(
        children: [
          PlanProgressTopImage(),
          MyCalendar(),
          CalenderSqureWidgetProgressScreen(),
          TodayQuoteScreenProgress()
        ],
      ),
    );
  }
}
