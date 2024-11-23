import 'package:flutter/material.dart';
import 'package:mazaya/core/views/pages/about_page/about_page.dart';
import 'package:mazaya/core/views/pages/admin_offer_list/admin_custom_offer_detials.dart';
import 'package:mazaya/core/views/pages/admin_offer_list/admin_offer_list.dart';
import 'package:mazaya/core/views/pages/admin_two_page/admin_two_page.dart';
import 'package:mazaya/core/views/pages/contact_us_page/contact_us_page.dart';
import 'package:mazaya/core/views/pages/frq_questions_page/frq_questions_page.dart';
import 'package:mazaya/core/views/pages/home_page/home_page.dart';
import 'package:mazaya/core/views/pages/login_page/login_page.dart';
import 'package:mazaya/core/views/pages/newest_offers_page/newest_offers_page.dart';
import 'package:mazaya/core/views/pages/offer_details_page/offer_details_page.dart';
import 'package:mazaya/core/views/pages/offer_category_page/offer_kide_page.dart';
import 'package:mazaya/core/views/pages/offer_list_page/offer_list_page.dart';
import 'package:mazaya/core/views/pages/offers_register_page/offers_page.dart';
import 'package:mazaya/core/views/pages/show_message_contact_page/show_message_contact_page.dart';
import 'package:mazaya/core/views/pages/update_offers_page/update_offers_page.dart';

class AppRoutes {
  static String initialRoute = HomePage.id;
  static Map<String, WidgetBuilder> routes = {
    HomePage.id: (context) => const HomePage(),
    LoginPage.id: (context) => const LoginPage(),
    ContactUsPage.id: (context) => const ContactUsPage(),
    AboutPage.id: (context) => const AboutPage(),
    FrqQuestionsPage.id: (context) => const FrqQuestionsPage(),
    NewestOffersPage.id: (context) => const NewestOffersPage(),
    RegisterOfferPage.id: (context) => const RegisterOfferPage(),
    OfferListPage.id: (context) => const OfferListPage(),
    OfferKidePage.id: (context) => const OfferKidePage(),
    OfferDetailsPage.id: (context) => const OfferDetailsPage(),
    ShowMessageContactPage.id: (context) => const ShowMessageContactPage(),
    AdminOfferList.id: (context) => const AdminOfferList(),
    AdminCustomOfferDetials.id: (context) => const AdminCustomOfferDetials(),
    UpdateOffersPage.id: (context) => const UpdateOffersPage(),
    AdminTwoPage.id: (context) => const AdminTwoPage(),
  };
}
