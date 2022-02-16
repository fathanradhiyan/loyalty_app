import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:paramita_loyalty_app/cubits/cubit.dart';
import 'package:paramita_loyalty_app/pages/pages.dart';
import 'package:paramita_loyalty_app/shared/shared.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    MaterialColor colorMain = MaterialColor(0xFFFFFFFF, color);
    MaterialColor main = MaterialColor(0xFF1A2C6A, color);
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => UserCubit()),
      ],
      child: GetMaterialApp(
        title: 'Paramita Loyalty App',
        theme: ThemeData(
          primarySwatch: main,
          accentColor: main,
        ),
        home: const Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
