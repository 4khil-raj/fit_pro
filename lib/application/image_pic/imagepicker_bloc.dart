import 'package:bloc/bloc.dart';
import 'package:fit_pro/infrastructure/repository/image_picker/image.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

part 'imagepicker_event.dart';
part 'imagepicker_state.dart';

class ImagepickerBloc extends Bloc<ImagepickerEvent, ImagepickerState> {
  ImagepickerBloc() : super(ImagepickerInitial()) {
    on<ImagepickerEvent>((event, emit) {
      emit(ImagepickerInitial());
    });
    on<ImageFromGallery>((event, emit) async {
      final image = await ImageService().pickImageFromGallery();
      if (image == null) {
        emit(ErrorState(msg: "Select Image"));
      } else {
        emit(ImageSelected(image: image));
      }
    });
    on<ImageFromCamera>((event, emit) async {
      final image = await ImageService().pickImageFromCamera();
      if (image == null) {
        emit(ErrorState(msg: "Select Image"));
      } else {
        emit(ImageSelected(image: image));
      }
    });
  }
}
