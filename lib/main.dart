import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_theme.dart';
import 'game_route.dart';
import 'home_route.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));

  runApp(
    MaterialApp(
      home: HomeRoute(),
      routes: <String, WidgetBuilder>{
        '/home': (BuildContext context) => HomeRoute(),
        '/game': (BuildContext context) => GameRoute()
      },
      theme: ThemeData(
        primaryColor: AppTheme.primary,
        primaryColorDark: AppTheme.primaryDark,
        secondaryHeaderColor: AppTheme.accent,
        textTheme: GoogleFonts.acmeTextTheme().copyWith(
            button: GoogleFonts.ubuntuMono(
          fontSize: 16,
          fontWeight: FontWeight.bold,
        )),
        buttonTheme: ButtonThemeData(
          buttonColor: AppTheme.accent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(24),
          ),
          textTheme: ButtonTextTheme.primary,
        ),
      ),
    ),
  );
}
