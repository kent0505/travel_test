part of 'internet_bloc.dart';

abstract class InternetState {}

class InternetInitial extends InternetState {}

class InternetSuccess extends InternetState {
  final bool dialog;
  InternetSuccess({required this.dialog});
}

class InternetFailure extends InternetState {}
