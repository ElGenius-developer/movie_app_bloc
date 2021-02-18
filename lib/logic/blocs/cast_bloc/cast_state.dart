part of 'cast_bloc.dart';

abstract class CastState {}

class CastInitial extends CastState {}

class LoadingCast extends CastState {}

class SuccessLoadCast extends CastState {
  final Credits credits;

  SuccessLoadCast(this.credits);
}

class ErrorLoadCast extends CastState {
  final String errorMessage;

  ErrorLoadCast(this.errorMessage);
}
