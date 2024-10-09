import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/db/db.dart';
import '../../../../core/models/flight.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<GetFlightsEvent>((event, emit) async {
      await getFlights();
      emit(HomeLoadedState(flights: DB.flightsList));
    });

    on<AddFlightEvent>((event, emit) async {
      // DB.modelsList.insert(0, event.Flight);
      DB.flightsList.add(event.flight);
      await updateFlights();
      emit(HomeLoadedState(flights: DB.flightsList));
    });

    on<EditFlightEvent>((event, emit) async {
      for (Flight flight in DB.flightsList) {
        if (flight.id == event.flight.id) {
          flight.departureCountry = event.flight.departureCountry;
          flight.departureCity = event.flight.departureCity;
          flight.departureAirport = event.flight.departureAirport;
          flight.departureDate = event.flight.departureDate;
          flight.departureTime = event.flight.departureTime;
          flight.arrivalCountry = event.flight.arrivalCountry;
          flight.arrivalCity = event.flight.arrivalCity;
          flight.arrivalAirport = event.flight.arrivalAirport;
          flight.arrivalDate = event.flight.arrivalDate;
          flight.arrivalTime = event.flight.arrivalTime;
          flight.transferCountry = event.flight.transferCountry;
          flight.transferCity = event.flight.transferCity;
          flight.transferAirport = event.flight.transferAirport;
          flight.transferDepartureDate = event.flight.transferDepartureDate;
          flight.transferDepartureTime = event.flight.transferDepartureTime;
          flight.transferArrivalDate = event.flight.transferArrivalDate;
          flight.transferArrivalTime = event.flight.transferArrivalTime;
          flight.plans = event.flight.plans;
        }
      }
      await updateFlights();
      emit(HomeLoadedState(flights: DB.flightsList));
    });

    on<DeleteFlightEvent>((event, emit) async {
      DB.flightsList.removeWhere((element) => element.id == event.id);
      await updateFlights();
      emit(HomeLoadedState(flights: DB.flightsList));
    });
  }
}
