import 'package:bug_trucker/DataTypes/color_schemes.dart';
import 'package:bug_trucker/Pages/main_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model_theme.dart';

void main() {

  runApp(
    ChangeNotifierProvider(
      create: (_) => ModelTheme(),
      child: Consumer<ModelTheme>(
        builder: (context, ModelTheme themeNotifier, child) {
          print(themeNotifier.currentTheme);

          return MaterialApp(
            theme: switch (themeNotifier.currentTheme) {
              ColorSchemes.gloriousPurple => ThemeData(
                  scaffoldBackgroundColor: Color(0xff8B5FBF),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Color(0xff643A71),
                    secondary: Color(0xff8B5FBF),
                    tertiary: Color(0xffD183C9),
                  ),
                  textTheme: TextTheme(
                    titleSmall: TextStyle(color: Colors.lime),
                    //unknown
                    titleMedium: TextStyle(),
                    //dropdown
                    titleLarge: TextStyle(color: Colors.purple),
                    //unknown
                    bodySmall: TextStyle(color: Colors.lime),
                    bodyMedium: TextStyle(fontSize: 18),
                    //Text widget text
                    bodyLarge: TextStyle(color: Colors.purple),
                  ),
                  bottomAppBarTheme:
                      BottomAppBarTheme(color: Color(0xff643A71)),
                  cardTheme: CardTheme(color: Color(0xffD183C9)),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff8B5FBF),
                    ),
                  ),
                ),
              ColorSchemes.red => ThemeData(
                  scaffoldBackgroundColor: Color(0xff990033),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Color(0xff5F021F),
                    secondary: Color(0xff990033),
                    tertiary: Color(0xff660000),
                  ),
                  textTheme: TextTheme(
                    //dropdown
                    titleLarge: TextStyle(color: Colors.black),
                    bodyMedium: TextStyle(fontSize: 18),
                    //Text widget text
                    bodyLarge: TextStyle(color: Colors.black),
                  ),
                  bottomAppBarTheme:
                      BottomAppBarTheme(color: Color(0xff5F021F)),
                  cardTheme: CardTheme(color: Color(0xff660000)),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff990033),
                    ),
                  ),
                ),
              ColorSchemes.green => ThemeData(
                  scaffoldBackgroundColor: Color(0xff7DD181),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Color(0xff4B7F52),
                    secondary: Color(0xff7DD181),
                    tertiary: Color(0xff96E8BC),
                  ),
                  textTheme: TextTheme(
                    titleSmall: TextStyle(color: Colors.lime),
                    //unknown
                    titleMedium: TextStyle(),
                    //dropdown
                    titleLarge: TextStyle(color: Colors.black),
                    //unknown
                    bodySmall: TextStyle(color: Colors.lime),
                    bodyMedium: TextStyle(fontSize: 18),
                    //Text widget text
                    bodyLarge: TextStyle(color: Colors.black),
                  ),
                  bottomAppBarTheme:
                      BottomAppBarTheme(color: Color(0xff4B7F52)),
                  cardTheme: CardTheme(color: Color(0xff96E8BC)),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xff7DD181),
                    ),
                  ),
                ),
              ColorSchemes.blue => ThemeData(
                  scaffoldBackgroundColor: Color(0xffEAEBED),
                  colorScheme: ColorScheme.fromSwatch().copyWith(
                    primary: Color(0xff006989),
                    secondary: Color(0xffEAEBED),
                    tertiary: Color(0xffA3BAC3),
                  ),
                  textTheme: TextTheme(
                    titleSmall: TextStyle(color: Colors.lime),
                    //unknown
                    titleMedium: TextStyle(),
                    //dropdown
                    titleLarge: TextStyle(color: Colors.black),
                    //unknown
                    bodySmall: TextStyle(color: Colors.lime),
                    bodyMedium: TextStyle(fontSize: 18),
                    //Text widget text
                    bodyLarge: TextStyle(color: Colors.black),
                  ),
                  bottomAppBarTheme:
                      BottomAppBarTheme(color: Color(0xff006989)),
                  cardTheme: CardTheme(color: Color(0xffA3BAC3)),
                  elevatedButtonTheme: ElevatedButtonThemeData(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xffEAEBED),
                    ),
                  ),
                ),
            },
            home: MainPage(),
          );
        },
      ),
    ),
  );
}
