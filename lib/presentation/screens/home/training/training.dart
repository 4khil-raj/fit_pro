import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatelessWidget {
  const TrainingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 6, 2, 19),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 81, 37, 114),
        title: Text(
          "Training",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(11.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Programe Name',
                        style: TextStyle(color: Colors.white, fontSize: 17),
                      ),
                      Text(
                        'Week 4/ Day 2',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ],
                  ),
                  Spacer(),
                  Icon(
                    Icons.bookmark_outline,
                    color: Colors.white,
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: LinearProgressIndicator(
                  color: Colors.blue,
                  value: .7,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        'Week 4/ Day 2',
                        style: TextStyle(color: Colors.white, fontSize: 14),
                      ),
                    ),
                    Spacer(),
                    Text(
                      '71%',
                      style: TextStyle(color: Colors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 400,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fget.wallhere.com%2Fphoto%2Fwomen-working-out-blonde-fitness-model-1597269.jpg&f=1&nofb=1&ipt=9a44e4fec1f079c79e99ab486cf6e8a8ad51ee1a79fabb8a106117855aad2129&ipo=images"))),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Metabolic Booster',
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                  alignment: FractionalOffset.topLeft,
                  child: Text(
                    '55 min| 10execises | Gym Equipment Required',
                    style: TextStyle(color: Colors.white, fontSize: 14),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CustomButton(
                  isNetwork: false,
                  isRow: false,
                  borderclr: Colors.transparent,
                  color: Colors.yellow,
                  fontweight: FontWeight.w600,
                  height: 60,
                  name: "View Week 2/Day 4",
                  textclr: Colors.black,
                  textsize: 16,
                  radius: 10,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
