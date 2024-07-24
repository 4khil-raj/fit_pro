part of 'plan_overview_bloc.dart';

@immutable
class PlanOverviewState {}

final class PlanOverviewInitial extends PlanOverviewState {}

final class PlanFetchDone extends PlanOverviewState {
  final List<PlanOverviewModel> list;

  PlanFetchDone({required this.list});
}

class PlanLoading extends PlanOverviewState {}
