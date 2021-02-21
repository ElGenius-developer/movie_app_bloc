part of 'internet_bloc.dart';

@immutable
abstract class InternetEvent {}
  class TryToConnect extends InternetEvent {
  final Connectivity connectivity;

  TryToConnect(this.connectivity);

 }
