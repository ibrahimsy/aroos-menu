import 'package:aroos_menu/provider/language.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MealDetailsScreen extends StatelessWidget {
  static const routeName = '/meal-details';
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      height: 150,
      width: double.infinity,
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, Object>;
    final mealTitle = routeArg['title'];
    final mealImage = routeArg['imageUrl'];
    final mealPrice = routeArg['price'];
    final mealIngredients = routeArg['ingredients'];
    return Scaffold(
      appBar: AppBar(
        title: Text(mealTitle),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              CachedNetworkImage(
                imageUrl: mealImage,
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Center(
                        child: CircularProgressIndicator(
                            value: downloadProgress.progress)),
              ),
              SizedBox(height: 10),
              Text(
                mealTitle,
                style: Theme.of(context).textTheme.headline6,
              ),
              SizedBox(height: 10),
              Container(
                padding: EdgeInsets.all(10),
                color: Colors.black12,
                child: Text(
                  '${_language.tPrice()} : ${mealPrice}',
                  style: TextStyle(
                      fontFamily: 'Raleway',
                      fontWeight: FontWeight.bold,
                      fontSize: 20),
                ),
              ),
              SizedBox(height: 20),
              Text(_language.tDescription(),
                  style: Theme.of(context).textTheme.headline6),
              SizedBox(height: 10),
              buildContainer(Text(
                mealIngredients,
                style: TextStyle(fontSize: 20),
              )),
            ],
          ),
        ),
      ),
    );
  }
}
