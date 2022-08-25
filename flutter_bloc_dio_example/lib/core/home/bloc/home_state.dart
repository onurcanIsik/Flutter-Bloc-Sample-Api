import 'package:equatable/equatable.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeLoadingState extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoadedState extends HomeState {
  final String? titleName;
  final String? bodyName;
  final int? idCount;

  const HomeLoadedState(this.titleName, this.bodyName, this.idCount);

  @override
  List<Object> get props => [titleName!, bodyName!, idCount!];
}
