part of 'links_bloc.dart';

abstract class LinksState extends Equatable {
  const LinksState();
}

class LinksInitial extends LinksState {
  List<Object> get props => [];
}

class SuccessLaunching extends LinksState {
  List<Object> get props => [];
}

class ErrorLaunching extends LinksState {
  final String errorMessage;

  ErrorLaunching({@required this.errorMessage});

  List<Object> get props => [errorMessage];
}
