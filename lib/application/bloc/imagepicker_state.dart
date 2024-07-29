part of 'imagepicker_bloc.dart';

@immutable
sealed class ImagepickerState {}

final class ImagepickerInitial extends ImagepickerState {}

final class ImageSelected extends ImagepickerState {
  final XFile image;

  ImageSelected({required this.image});
}

final class ErrorState extends ImagepickerState {
  final String msg;

  ErrorState({required this.msg});
}
