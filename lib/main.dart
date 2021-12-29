import 'package:aroos_menu/provider/language.dart';
import 'package:aroos_menu/screens/category_meals_screen.dart';
import 'package:aroos_menu/screens/home_screen.dart';
import 'package:aroos_menu/screens/meal_details_screen.dart';
import 'package:aroos_menu/screens/tabs_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/categories_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';

String language = 'EN';
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // SharedPreferences.getInstance().then((instance) {
  //   language = 'EN';

  // });
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // var _language = Provider.of<Language>(context);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<Language>(
          create: (context) => Language(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.amber,
          accentColor: Colors.amber,
          fontFamily: 'Raleway',
          textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(color: Color.fromRGBO(20, 51, 51, 1)),
              headline1: TextStyle(
                  color: Colors.white,
                  fontFamily: 'RobotoCondensed',
                  fontSize: 15,
                  fontWeight: FontWeight.bold)),
        ),
        home: HomeScreen(),
        routes: {
          // '/': (ctx) => HomeScreen(),
          TabsScreen.routeName: (ctx) => TabsScreen(),
          CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(),
          MealDetailsScreen.routeName: (ctx) => MealDetailsScreen(),
        },
      ),
    );
  }
}
