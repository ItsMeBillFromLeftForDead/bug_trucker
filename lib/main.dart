import 'package:bug_trucker/Pages/main_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xff8B5FBF),
          colorScheme: ColorScheme.fromSwatch().copyWith(
            primary: Color(0xff643A71),
            secondary: Color(0xff8B5FBF),
            tertiary: Color(0xffD183C9),
          ),
          textTheme: TextTheme(
            titleSmall: TextStyle(color: Colors.lime), //unknown
            titleMedium: TextStyle(color: Colors.deepOrange), //dropdown
            titleLarge: TextStyle(color: Colors.purple), //unknown
            bodySmall:TextStyle(color: Colors.lime),
            bodyMedium: TextStyle(fontSize: 18), //Text widget text
            bodyLarge: TextStyle(color: Colors.purple),
      ),
          bottomAppBarTheme: BottomAppBarTheme(color: Color(0xff643A71)),
          cardTheme: CardTheme(color: Color(0xffD183C9)),
          elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xff8B5FBF)))),
      home: MainPage()));
}
