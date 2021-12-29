import 'package:aroos_menu/provider/language.dart';
import 'package:aroos_menu/widgets/meal_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryMealsScreen extends StatelessWidget {
  static const routeName = '/category-meals';
  // final catId;
  // final catTitle;

  // CategoryMealsScreen(this.catId, this.catTitle);
  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final catTitle = routeArg['title'];
    final catId = routeArg['id'];
    return Scaffold(
        appBar: AppBar(
          title: Text(catTitle),
        ),
        body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('categories/${catId}/meals')
              .snapshots(),
          builder: (ctx, mealsSnapshot) {
            print('from meals screen');
            if (mealsSnapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            final mealDocuments = mealsSnapshot.data.docs;
            return ListView.builder(
              itemBuilder: (ctx, index) {
                return MealItem(
                  title: mealDocuments[index][_language.mealTitle()],
                  imageUrl: mealDocuments[index]['imageUrl'],
                  price: mealDocuments[index]['price'],
                  ingredient: mealDocuments[index][_language.mealDesc()],
                );
              },
              itemCount: mealDocuments.length,
            );
            // return ListView(
            //     children: (mealDocuments as List).map((meal) {
            //   return MealItem(
            //     title: meal['title'],
            //     imageUrl: meal['imageUrl'],
            //     price: meal['price'],
            //     ingredient: List.from(meal['ingredients']),
            //   );
            // }).toList());
          },
        ));
  }
}
