import 'package:flutter/material.dart';
import 'package:get_profile_page/bloc/ProfileBloc.dart';
import 'package:get_profile_page/data/DataRepository.dart';
import 'package:get_profile_page/pages/GitProfile.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLOC github profile Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: BlocProvider(
          create: (context) => ProfileBloc(DataRepository()),
          child: GitProfile()),
    );
  }
}