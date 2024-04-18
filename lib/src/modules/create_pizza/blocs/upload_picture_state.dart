part of 'upload_picture_bloc.dart';

sealed class UploadPictureState extends Equatable {
  const UploadPictureState();
  @override
  List<Object?> get props => [];

}

class UploadPictureInitial extends UploadPictureState {}

class UploadPictureLoading extends UploadPictureState {}

class UploadPictureFailure extends UploadPictureState {}

class UploadPictureSuccess extends UploadPictureState {
  final String url;
  const UploadPictureSuccess(this.url);

  @override
  List<Object?> get props => [url];
}
