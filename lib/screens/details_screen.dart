import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/screens/favourite_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDetailsScreen extends StatelessWidget {

  static const String id = 'bookDetailsScreen';

  @override
  Widget build(BuildContext context) {

    final routeArgs = ModalRoute.of(context).settings.arguments as String;

    final currentBook = Provider.of<BookData>(context).getCurrentBook(routeArgs);


    return Scaffold(
      appBar: AppBar(
        title: Text('BookDetails'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(currentBook.bookName),
          Text(currentBook.authorName),
          FlatButton(
            child: Text('Jump to Favourites'),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                return FavouriteScreen();
              }));
            },
          )
        ],
      ),
    );
  }
}
