part of 'addphoto_cubit.dart';

@immutable
sealed class AddphotoState {}

final class AddphotoInitial extends AddphotoState {}
final class loadingPhoto extends AddphotoState {}
final class DonePhoto extends AddphotoState {}
