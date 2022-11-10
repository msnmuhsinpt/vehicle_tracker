import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:vehicle_tracker/bloc/vehicle_bloc.dart';
import 'package:vehicle_tracker/view/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VehicleBloc(),
      child:  MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'vehicle Tracker',
        home:  HomePage(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
