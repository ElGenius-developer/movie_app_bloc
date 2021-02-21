import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:meta/meta.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity connectivity;
  InternetBloc(this.connectivity) : super(InternetInitial());

  Stream<InternetState> mapEventToState(
    InternetEvent event,
  ) async* {
    if (event is TryToConnect) {
      yield InternetLoading();
      final result = await event.connectivity.checkConnectivity();
      switch (result) {
        case ConnectivityResult.none:

          yield InternetIsDisconnected();
          break;
        case ConnectivityResult.wifi:
          yield InternetIsConnected(ConnectionType.wifi);
          break;
        case ConnectivityResult.mobile:
          yield InternetIsConnected(ConnectionType.mobile);
          break;
      }
    }
  }


}
