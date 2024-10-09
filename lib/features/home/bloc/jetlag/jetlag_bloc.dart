import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/db/prefs.dart';

part 'jetlag_event.dart';
part 'jetlag_state.dart';

class JetlagBloc extends Bloc<JetlagEvent, JetlagState> {
  JetlagBloc() : super(JetlagInitial()) {
    on<GetJetlagEvent>((event, emit) async {
      emit(JetlagLoadedState(
        arrival: jetlagArrival,
        departure: jetlagDeparture,
        time: jetlagTime,
      ));
    });

    on<AddJetlagEvent>((event, emit) async {
      jetlagArrival = event.arrival;
      jetlagDeparture = event.departure;
      jetlagTime = event.time;
      await saveString('jetlagArrival', jetlagArrival);
      await saveString('jetlagDeparture', jetlagDeparture);
      await saveString('jetlagTime', jetlagTime);
      emit(JetlagLoadedState(
        arrival: jetlagArrival,
        departure: jetlagDeparture,
        time: jetlagTime,
      ));
    });

    on<RemoveJetlagEvent>((event, emit) async {
      jetlagArrival = '';
      jetlagDeparture = '';
      jetlagTime = '';
      await saveString('jetlagArrival', jetlagArrival);
      await saveString('jetlagDeparture', jetlagDeparture);
      await saveString('jetlagTime', jetlagTime);
      emit(JetlagLoadedState(
        arrival: jetlagArrival,
        departure: jetlagDeparture,
        time: jetlagTime,
      ));
    });
  }
}
