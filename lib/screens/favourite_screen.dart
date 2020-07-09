import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/widgets/custom_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookshop/widgets/custom_grid_tile.dart';

class FavouriteScreen extends StatelessWidget {

  static const String id = 'favouriteScreen';

  @override
  Widget build(BuildContext context) {

    print(Provider.of<BookData>(context).favouriteScreen().length);

    final routeArgs = ModalRoute.of(context).settings.arguments as String;

    final favouriteScreen =   Provider.of<BookData>(context).favouriteScreen();

    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text(
          routeArgs == 'fav' ? 'Favourites' : 'shopping cart'
        ),
      ),
      body: Consumer<BookData>(
        builder: (context , bookData , child){
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 3/4,
              ),
              itemCount: favouriteScreen.length,
              itemBuilder: (context , index){
                return CustomGridTile(
                  authorName: favouriteScreen[index].bookName,
                  bookName: favouriteScreen[index].bookName,
                  isLiked: favouriteScreen[index].isFavourite,
                  imageUrl: favouriteScreen[index].imageUrl,
                );
              });
        },
      )
    );
  }
}
