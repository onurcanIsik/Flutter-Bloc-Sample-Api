import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_dio_example/core/data/service/user_service.dart';
import 'package:flutter_bloc_dio_example/core/home/home.dart';

void main() {
  runApp(
    MaterialApp(
      home: MultiRepositoryProvider(
        providers: [
          RepositoryProvider(
            create: (context) => UserService(),
          ),
        ],
        child: const HomePage(),
      ),
    ),
  );
}
