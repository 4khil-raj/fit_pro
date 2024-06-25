import 'package:flutter/material.dart';

class HomeScreenAppBar extends StatelessWidget {
  const HomeScreenAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Column(
      children: [
        Container(
          color: const Color.fromARGB(255, 131, 59, 186),
          height: statusBarHeight,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: SizedBox(
                    height: 50,
                    child: TextFormField(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(40)),
                          hintText: "Search workouts",
                          hintStyle: const TextStyle(color: Colors.grey),
                          // suffixIcon: Icon(Icons.search),
                          prefixIcon: const Icon(Icons.search)),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                  width:
                      10), // Add some spacing between the search bar and avatar
              const CircleAvatar(
                radius: 25,
                backgroundImage: NetworkImage(
                  "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.pinimg.com%2F736x%2F2d%2F00%2F35%2F2d003500486fc421f3497197689a7e06.jpg&f=1&nofb=1&ipt=9fad4b1450c71582ea96205d0b52c75334c0af16c8f6219e2c802ea4bcb57505&ipo=images",
                ),
              ),
              const SizedBox(width: 10),
              // CarouselSliderDemo()
            ],
          ),
        ),
      ],
    );
  }
}
