import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/screens/details_screen.dart';
import 'package:bookshop/screens/favourite_screen.dart';
import 'package:bookshop/screens/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'screens/home_page.dart';

void main() => runApp(BookShop());

class BookShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<BookData>(
      create: (context) => BookData(),
      child: MaterialApp(
        initialRoute: HomePage.id,
        routes: {
          BookDetailsScreen.id : (context) => BookDetailsScreen(),
          HomePage.id : (context) => HomePage(),
          FavouriteScreen.id : (context) => FavouriteScreen(),
          ShoppingCart.id : (context) => ShoppingCart(),
        },
      ),
    );
  }
}
