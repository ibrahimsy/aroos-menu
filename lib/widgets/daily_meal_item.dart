import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class DailyMealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  DailyMealItem({this.title, this.imageUrl});

  // void _selectMeal(BuildContext ctx) {
  //   Navigator.of(ctx).pushNamed('/meal-details', arguments: {
  //     'title': title,
  //     'imageUrl': imageUrl,
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      // onTap: () {
      //   _selectMeal(context);
      // },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: CachedNetworkImage(
          imageUrl: imageUrl,
          imageBuilder: (ctx, imageProvider) {
            return Container(
              margin: EdgeInsets.all(6),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover)),
              child: Stack(children: [
                Positioned(
                  right: 10,
                  bottom: 10,
                  left: 10,
                  child: Container(
                    padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    color: Colors.black54,
                    child: Text(
                      title,
                      style: Theme.of(context).textTheme.headline1,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ]),
            );
          }),
    );
  }
}
