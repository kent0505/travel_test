import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

import '../../../utils.dart';

part 'internet_event.dart';
part 'internet_state.dart';

class InternetBloc extends Bloc<InternetEvent, InternetState> {
  final Connectivity _connectivity = Connectivity();
  bool dialog = false;

  InternetBloc() : super(InternetInitial()) {
    on<CheckInternet>((event, emit) {
      _connectivity.onConnectivityChanged.listen((result) {
        logger('LISTENING CONNECTION...');
        if (result.contains(ConnectivityResult.mobile)) {
          logger('MOBILE');
          add(ChangeInternet(connected: true));
        } else if (result.contains(ConnectivityResult.wifi)) {
          logger('WIFI');
          add(ChangeInternet(connected: true));
        } else {
          logger('NO INTERNET');
          dialog = true;
          add(ChangeInternet(connected: false));
        }
      });
    });

    on<ChangeInternet>((event, emit) {
      if (event.connected) {
        emit(InternetSuccess(dialog: dialog));
      } else {
        emit(InternetFailure());
      }
    });
  }
}
