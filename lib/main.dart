import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_app/core/services/notificationservice.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:to_do_app/features/borad_screen/page/boardScreen.dart';
import 'package:to_do_app/features/splashScreen/page/splashscreen.dart';
import 'core/blocs/cubit/tasks_cubit.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  NotificationService().initNotification();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => Tasksbloc()..createDatabase(),
      child: MaterialApp(
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            appBarTheme: const AppBarTheme(
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.bold)),
            inputDecorationTheme: InputDecorationTheme(
              contentPadding: const EdgeInsets.symmetric(horizontal: 10),
              floatingLabelBehavior: FloatingLabelBehavior.never,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                ),
              ),
              fillColor: const Color.fromARGB(255, 242, 242, 242),
              filled: true,
              focusColor: Colors.transparent,
              labelStyle: const TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          debugShowCheckedModeBanner: false,
          home: const splash()),
    );
  }
}
