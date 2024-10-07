part of 'internet_bloc.dart';

abstract class InternetEvent {}

class CheckInternet extends InternetEvent {}

class ChangeInternet extends InternetEvent {
  final bool connected;
  ChangeInternet({required this.connected});
}
