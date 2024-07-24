// ignore_for_file: avoid_print

import 'package:bloc/bloc.dart';
import 'package:fit_pro/domain/models/plan_overview/model.dart';
import 'package:fit_pro/infrastructure/repository/plan_overview/repo.dart';
import 'package:meta/meta.dart';
part 'plan_overview_event.dart';
part 'plan_overview_state.dart';

class PlanOverviewBloc extends Bloc<PlanOverviewEvent, PlanOverviewState> {
  PlanOverviewBloc() : super(PlanOverviewInitial()) {
    on<PlanOverviewEvent>((event, emit) {
      emit(PlanOverviewState());
    });
    on<PlanOverViewRequestEvent>((event, emit) async {
      emit(PlanLoading());
      try {
        final response = await PlanOverViewRepo.fetchWorkoutPlans(event.planId);
        emit(PlanFetchDone(list: response));
      } catch (e) {
        print(e);
      }
    });
  }
}
