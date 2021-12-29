import 'package:flutter/material.dart';
import '../main.dart';

class Language extends ChangeNotifier {
  String _lang = language;

  getLanguage() {
    return _lang;
  }

  setLanguage(String lang) {
    _lang = lang;
    notifyListeners();
  }

  String tFont() {
    if (getLanguage() == 'AR') {
      return "Cairo";
    } else if (getLanguage() == 'EN') {
      return "Raleway";
    }
  }

  ///User Profile translated Strings
  String tMenu() {
    if (getLanguage() == 'AR') {
      return "القائمة";
    } else if (getLanguage() == 'EN') {
      return "menu";
    }
  }

  String tLanguage() {
    if (getLanguage() == 'AR') {
      return "العربية";
    } else if (getLanguage() == 'EN') {
      return "English";
    }
  }

  String tCategory() {
    if (getLanguage() == 'AR') {
      return "التصنيفات";
    } else if (getLanguage() == 'EN') {
      return "Categories";
    }
  }

  String tDailyMeals() {
    if (getLanguage() == 'AR') {
      return "الوجبات اليومية";
    } else if (getLanguage() == 'EN') {
      return "Daily Meals";
    }
  }

  String tWelcome() {
    if (getLanguage() == 'AR') {
      return "أهلا وسهلاً في مطعم عروس دمشق";
    } else if (getLanguage() == 'EN') {
      return "Welcome To Aroos Damascus Restaurant";
    }
  }

  String tPrice() {
    if (getLanguage() == 'AR') {
      return "السعر";
    } else if (getLanguage() == 'EN') {
      return "Price";
    }
  }

  String tDescription() {
    if (getLanguage() == 'AR') {
      return "المكونات";
    } else if (getLanguage() == 'EN') {
      return "Description";
    }
  }

  String categoryTitle() {
    if (getLanguage() == 'AR') {
      return "titleAr";
    } else if (getLanguage() == 'EN') {
      return "titleEn";
    }
  }

  String dailyMealTitle() {
    if (getLanguage() == 'AR') {
      return "titleAr";
    } else if (getLanguage() == 'EN') {
      return "titleEn";
    }
  }

  String mealTitle() {
    if (getLanguage() == 'AR') {
      return "titleAr";
    } else if (getLanguage() == 'EN') {
      return "titleEn";
    }
  }

  String mealDesc() {
    if (getLanguage() == 'AR') {
      return "descAr";
    } else if (getLanguage() == 'EN') {
      return "descEn";
    }
  }
}
