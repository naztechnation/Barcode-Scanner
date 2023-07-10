import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

import 'bloc/qrbloc_bloc.dart';
import 'bq_scan.dart';
import 'config/theme_config/AppTheme.dart';
import 'config/theme_config/ThemeModel.dart';
import 'splash_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    ChangeNotifierProvider<ThemeModel>(
      create: (BuildContext context) => ThemeModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QRBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'ESOWP',
        theme: AppTheme.light,
        // darkTheme: AppTheme.dark,
        // themeMode: ThemeMode.system,
        home: const SplashScreen(),
      ),
    );
  }
}
