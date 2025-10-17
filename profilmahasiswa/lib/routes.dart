import 'package:flutter/material.dart';
import 'home_page.dart';
import 'profile_page.dart';
import 'gallery_page.dart';

final Map<String, WidgetBuilder> appRoutes = {
  '/': (context) => HomePage(),
  '/profil': (context) => ProfilePage(),
  '/galeri': (context) => GalleryPage(),
};
