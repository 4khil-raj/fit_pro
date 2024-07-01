import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/weight_graph.dart';
import 'package:fit_pro/presentation/screens/home/progress/widget/stats/widget/weight_graph_widget.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';

class ProgressScreenTopButtons extends StatefulWidget {
  const ProgressScreenTopButtons({super.key});

  @override
  State<ProgressScreenTopButtons> createState() =>
      _WorkOutScreenTopButtonsState();
}

class _WorkOutScreenTopButtonsState extends State<ProgressScreenTopButtons> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        color: const Color.fromARGB(255, 53, 53, 53),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              InkWell(
                onTap: () => weightGraph(context),
                // onTap: () => customNavPush(context, WeightGraphWidget()),
                child: Container(
                  height: 40,
                  width: 120,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Last Week",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "This Month",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Six Months",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                height: 40,
                width: 120,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      "Year",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
