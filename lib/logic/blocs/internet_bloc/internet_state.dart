part of 'internet_bloc.dart';

@immutable
abstract class InternetState {}
enum ConnectionType{
 mobile,wifi
}
class InternetInitial extends InternetState {}
class InternetLoading extends InternetState {}
class InternetIsDisconnected extends InternetState {}
class InternetIsConnected extends InternetState {
  final ConnectionType connectionType;

  InternetIsConnected(this.connectionType);
}

