import 'package:fit_pro/application/fetch_bookmark_day/fetch_bookmark_bloc.dart';
import 'package:fit_pro/presentation/screens/home/homeScreen/sub_pages/featured_plans/featured_plans.dart';
import 'package:fit_pro/presentation/widgets/custom_nav/customnav.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class BookMarkScreenHome extends StatelessWidget {
  const BookMarkScreenHome({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchBookmarkBloc, FetchBookmarkState>(
      builder: (context, state) {
        if (state is FetchedDone) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 14, right: 13),
                child: Row(
                  children: [
                    Text(
                      "Bookmarks",
                      style: GoogleFonts.urbanist(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Colors.white),
                    ),
                    const Spacer(),
                    TextButton(
                        onPressed: () => customNavPush(
                            context,
                            FeturedPlansSubScreen(
                              trending: false,
                              bookmark: true,
                              bookmarkState: state,
                            )),
                        child: const Text(
                          "See all",
                          style: TextStyle(color: Colors.blue),
                        ))
                  ],
                ),
              ),
              SizedBox(
                height: 210,
                child: ListView.builder(
                  itemCount: state.list[0].bookmarks.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 200,
                      width: 180,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(
                                state.list[0].bookmarks[index].dayBannerImage)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              )
            ],
          );
        }
        return const SizedBox();
      },
    );
  }
}
