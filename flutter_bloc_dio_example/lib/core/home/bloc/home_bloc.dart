import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_example/core/data/service/user_service.dart';
import 'package:flutter_bloc_dio_example/core/home/bloc/home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final UserService _userService;
  HomeBloc(this._userService) : super(HomeLoadingState()) {
    on<LoadApiEvent>((event, emit) async {
      final activity = await _userService.getPost();
      emit(HomeLoadedState(
          activity!.title.toString(), activity.body.toString(), activity.id!));
    });
  }
}
