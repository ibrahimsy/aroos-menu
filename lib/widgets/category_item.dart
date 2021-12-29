import 'package:aroos_menu/provider/language.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:provider/provider.dart';

import '../screens/category_meals_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  CategoryItem({this.id, this.title, this.imageUrl});

  void _selectCategory(BuildContext ctx) {
    Navigator.of(ctx)
        .pushNamed('/category-meals', arguments: {'id': id, 'title': title});
  }

  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    return InkWell(
      onTap: () {
        _selectCategory(context);
      },
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(30),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: CachedNetworkImage(
              imageUrl: imageUrl,
              fit: BoxFit.contain,
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
                      child: CircularProgressIndicator(
                          value: downloadProgress.progress)),
            ),
          ),
          Positioned(
            right: 5,
            bottom: 10,
            child: Container(
                color: Colors.black54,
                padding: EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 20,
                ),
                child: FittedBox(
                  child: Text(
                    title,
                    style: TextStyle(
                        fontFamily: _language.tFont(), color: Colors.white),
                    softWrap: true,
                    overflow: TextOverflow.fade,
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
