import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
part 'addphoto_state.dart';

class AddphotoCubit extends Cubit<AddphotoState> {
  AddphotoCubit() : super(AddphotoInitial());

  static AddphotoCubit get(context) => BlocProvider.of(context);

  File? fileImage;
  var imgPicker = ImagePicker();
  var downloadURL;
  bool isblurlLoading = false;
  bool fristOften = true;
  Future<void> uploadImageFrom_gallery_or_camera(context,
      {required gallery_or_camera}) async {
    var pickedImage = await imgPicker.pickImage(
        source: gallery_or_camera == "gallery"
            ? ImageSource.gallery
            : gallery_or_camera == "camera"
                ? ImageSource.camera
                : null!);
    if (pickedImage != null) {
      isblurlLoading = true;
      emit(DonePhoto());

      emit(DonePhoto());
      var imagePath = pickedImage.path;
      fileImage = File(imagePath);
      // Start uploading to Firebase Storage
      var storageReference = FirebaseStorage.instance.ref("images/$fileImage");
      await storageReference.putFile(fileImage!);

      downloadURL = await storageReference.getDownloadURL();
      isblurlLoading = false;
      emit(DonePhoto());
      print(downloadURL);

      // End uploading to Firebase Storage
    }
  }
}
