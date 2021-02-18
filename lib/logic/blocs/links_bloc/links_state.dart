part of 'links_bloc.dart';

abstract class LinksState {}

class LinksInitial extends LinksState {}

class SuccessLaunching extends LinksState {}

class ErrorLaunching extends LinksState {
  final String errorMessage;

  ErrorLaunching({@required this.errorMessage});
}
