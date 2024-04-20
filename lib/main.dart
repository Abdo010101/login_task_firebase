import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_task/bloc_observer.dart';
import 'package:login_task/cores/di.dart';
import 'package:login_task/feaures/login_feature/presention/login/cubit/login_cubit.dart';
import 'package:login_task/feaures/login_feature/presention/login/cubit/login_screen.dart';
import 'package:login_task/firebase_options.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:device_preview/device_preview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  Bloc.observer = MyBlocObserver();
  setup();
  runApp(DevicePreview(
      enabled: false,
      builder: (context) {
        return const MyApp();
      }));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BlocProvider(
          create: (context) => getIt.get<LoginCubit>(),
          child: LoginScreen(),
        ),
      ),
    );
  }
}
