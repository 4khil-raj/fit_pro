part of 'imagepicker_bloc.dart';

@immutable
class ImagepickerEvent {}

final class ImageFromGallery extends ImagepickerEvent {}

final class ImageFromCamera extends ImagepickerEvent {}
