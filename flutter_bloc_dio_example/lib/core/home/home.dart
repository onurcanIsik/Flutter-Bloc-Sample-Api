import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_example/core/data/service/user_service.dart';
import 'package:flutter_bloc_dio_example/core/home/bloc/home_bloc.dart';
import 'package:flutter_bloc_dio_example/core/home/bloc/home_event.dart';

import 'bloc/home_state.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(
        RepositoryProvider.of<UserService>(context),
      )..add(LoadApiEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Activity User"),
        ),
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: ((context, state) {
            if (state is HomeLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is HomeLoadedState) {
              return Column(
                children: [
                  Text(state.titleName!),
                  Text(state.bodyName!),
                  Text(state.idCount.toString()),
                ],
              );
            }
            return Container();
          }),
        ),
      ),
    );
  }
}
