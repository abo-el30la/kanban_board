import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app.dart';
import 'app_bloc_observer.dart';

void main() async {
  // WidgetsBinding widgetsBinding =
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  // await HiveConfig.config();
  // await HiveConfig.openBox();
  //FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  Bloc.observer = AppBlocObserver();
  // FlutterNativeSplash.remove();
  runApp(
    ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: false,
      splitScreenMode: true,
      builder: (BuildContext context, Widget? child) => EasyLocalization(
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('ar', 'EG'),
        ],
        path: 'assets/translations',
        fallbackLocale: const Locale('en', 'US'),
        startLocale: const Locale('en', 'US'),
        child: const App(),
      ),
    ),
  );
}
