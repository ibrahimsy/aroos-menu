import 'package:aroos_menu/provider/language.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';

import '../widgets/category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  static const routeName = '/categories';
  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('categories').snapshots(),
        builder: (ctx, streamSnapshot) {
          print('from category screen');
          if (streamSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          final documents = streamSnapshot.data.docs;
          return Container(
            child: GridView.builder(
              itemCount: documents.length,
              padding: const EdgeInsets.all(5),
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  childAspectRatio: 3 / 2,
                  crossAxisSpacing: 5,
                  mainAxisSpacing: 5),
              itemBuilder: (ctx, index) {
                return CategoryItem(
                  id: documents[index]['id'],
                  title: documents[index][_language.categoryTitle()],
                  imageUrl: documents[index]['imageUrl'],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
