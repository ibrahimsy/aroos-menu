import 'package:aroos_menu/provider/language.dart';
import 'package:aroos_menu/widgets/daily_meal_item.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DailyMealScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var _language = Provider.of<Language>(context, listen: true);
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('dailymeals').snapshots(),
      builder: (ctx, streamSnapshot) {
        print('from Daily Meals screen');
        if (streamSnapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        }
        final documents = streamSnapshot.data.docs;
        print(documents.length);
        return Container(
          child: ListView.builder(
            itemCount: documents.length,
            padding: const EdgeInsets.all(5),
            itemBuilder: (ctx, index) {
              return DailyMealItem(
                title: documents[index][_language.dailyMealTitle()],
                imageUrl: documents[index]['imageUrl'],
              );
            },
          ),
        );
      },
    );
  }
}
