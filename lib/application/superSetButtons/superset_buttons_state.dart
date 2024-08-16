part of 'superset_buttons_bloc.dart';

@immutable
sealed class SupersetButtonsState {}

final class SupersetButtonsInitial extends SupersetButtonsState {}

final class DoneState extends SupersetButtonsState {}

final class Goback extends SupersetButtonsState {}
