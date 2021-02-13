part of 'cast_bloc.dart';

abstract class CastState extends Equatable {
  const CastState();
}

class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

class LoadingCast extends CastState {
  @override
  List<Object> get props => [];
}

class SuccessLoadCast extends CastState {
  final Credits credits;

  SuccessLoadCast(this.credits);

  @override
  List<Object> get props => [credits];
}

class ErrorLoadCast extends CastState {
  final String errorMessage;

  ErrorLoadCast(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
