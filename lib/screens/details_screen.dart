import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/screens/favourite_screen.dart';
import 'package:flutter/cupertino.dart';
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
          Image.network(currentBook.imageUrl,
          height: 200,
          width: 150,),
          Center(
            child: RichText(
              textAlign: TextAlign.center,
              text: TextSpan(
                children: [
                  TextSpan(
                    text: '${currentBook.bookName}\n',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w900,
                      color: Colors.black,
                    ),
                  ),
                  TextSpan(
                      text: currentBook.authorName,
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.grey,
                      ),
                  )
                ]
              ),
            ),
          )
        ],
      ),
    );
  }
}
