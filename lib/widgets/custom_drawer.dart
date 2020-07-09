import 'package:bookshop/screens/favourite_screen.dart';
import 'package:bookshop/screens/shopping_cart.dart';
import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {

  ListTile listTileBuilder(text , iconData , context ,  route , )
  {
    return ListTile(
      title: Text(text),
      leading: Icon(iconData),
      onTap: (){
        Navigator.pushReplacementNamed(context, route );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          UserAccountsDrawerHeader(
              accountName: Text('Harshil Padsala'),
              accountEmail: Text('harshilpadsala2000@gmail.com'),
              currentAccountPicture: CircleAvatar(
                 child: Text('H'),
          ),
          ),
          listTileBuilder('Favourites', Icons.favorite, context ,  FavouriteScreen.id),
          Divider(),
          listTileBuilder('Cart', Icons.shopping_cart, context , ShoppingCart.id),
          Divider(),
        ],
      ),
    );
  }
}
