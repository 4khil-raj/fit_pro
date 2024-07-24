part of 'plan_overview_bloc.dart';

@immutable
class PlanOverviewEvent {}

class PlanOverViewRequestEvent extends PlanOverviewEvent {
  final String planId;
  PlanOverViewRequestEvent({required this.planId});
}
