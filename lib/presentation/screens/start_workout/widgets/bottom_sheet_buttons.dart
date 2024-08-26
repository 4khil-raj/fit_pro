import 'package:fit_pro/application/reps&weight/repsandweightworkout_bloc.dart';
import 'package:fit_pro/application/superset_checker/supersetscreencheckbox_bloc.dart';
import 'package:fit_pro/presentation/screens/start_workout/widgets/picker.dart';
import 'package:fit_pro/presentation/widgets/buttons/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomSheetButtons extends StatelessWidget {
  final int index;
  const BottomSheetButtons({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Colors.blueGrey,
              color: const Color.fromARGB(255, 3, 1, 9),
              height: 40,
              fontweight: FontWeight.w500,
              radius: 10,
              textclr: Colors.white,
              name: 'Cancel',
              onTap: () {
                // BlocProvider.of<SupersetscreencheckboxBloc>(context)
                //     .add(ClearRepss(index: index));
                // BlocProvider.of<RepsandweightworkoutBloc>(context)
                //     .add(ClearReps(index: index));
                Navigator.pop(context);
              },
              textsize: 20,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
          const SizedBox(
            width: 17,
          ),
          Expanded(
            child: CustomButton(
              isNetwork: false,
              isRow: false,
              borderclr: Colors.blueGrey,
              color: Colors.yellow[700],
              height: 40,
              fontweight: FontWeight.w500,
              radius: 10,
              textclr: Colors.black,
              name: 'Save',
              onTap: () {
                BlocProvider.of<RepsandweightworkoutBloc>(context).add(GetReps(
                    index: index,
                    reps: repspickvalue,
                    weight: weightpickvalue));

                BlocProvider.of<SupersetscreencheckboxBloc>(context).add(
                    GetRepss(
                        index: index,
                        reps: repspickvalue,
                        weight: weightpickvalue));
                Navigator.pop(context);
                repspickvalue = 1;
                weightpickvalue = 0;
              },
              textsize: 20,
              width: MediaQuery.of(context).size.width / 2.5,
            ),
          ),
        ],
      ),
    );
  }
}
