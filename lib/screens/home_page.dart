import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/screens/shopping_cart.dart';
import 'package:flutter/material.dart';
import 'package:bookshop/widgets/custom_grid_tile.dart';
import 'package:provider/provider.dart';
import 'package:bookshop/widgets/custom_drawer.dart';


enum FilterInfo  {Favourites , All}

class HomePage extends StatefulWidget {

  static const String id = 'homePage';

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  FilterInfo selectedEnum = FilterInfo.All;

  @override
  Widget build(BuildContext context) {

    var currentScreen = selectedEnum == FilterInfo.All ? Provider.of<BookData>(context).books : Provider.of<BookData>(context).favouriteScreen();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Explore all books'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (value){
              setState(() {
                selectedEnum = value;
              });
            },
            itemBuilder: (context){
             return [
                PopupMenuItem(
                  child: Text('Favourites'),
                  value: FilterInfo.Favourites,
                ),
                PopupMenuItem(
                  child: Text('All'),
                  value: FilterInfo.All,
                ),
              ];
            },
          ),
          IconButton(icon: Icon(Icons.shopping_cart), onPressed:(){
            Navigator.pushNamed(context, ShoppingCart.id);
          })
        ],
        ),
      body: Consumer<BookData>(
        builder: (context , bookData , child){return
          GridView.builder(
            padding: EdgeInsets.all(24),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                childAspectRatio: 3/4,
              ),
              itemCount: currentScreen.length,
              itemBuilder: (context , index){
                return CustomGridTile(
                  imageUrl: currentScreen[index].imageUrl,
                  id: currentScreen[index].id,
                  bookName: currentScreen[index].bookName,
                  authorName: currentScreen[index].authorName,
                  isLiked: currentScreen[index].isFavourite,
                 toggleShoppingCart: (){
                   Provider.of<BookData>(context , listen: false).addToCart(currentScreen[index]);
                 },
                 toggleLike: (){
                    bookData.addToFavourites(currentScreen[index]);
                 },
                );
              });},
      ),
    );
  }
}
