import 'package:bookshop/screens/details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class CustomGridTile extends StatelessWidget {

  final String imageUrl;
  final String id;
  final String bookName;
  final String authorName;
  bool isLiked;
  Function toggleLike;
  Function toggleShoppingCart;


  CustomGridTile({
    this.bookName,
    this.authorName,
    this.id,
    this.imageUrl,
    this.isLiked,
    this.toggleLike,
    this.toggleShoppingCart,
});


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.pushNamed(context, BookDetailsScreen.id , arguments: id);
      },
      child: GridTile(
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              bottomLeft: Radius.circular(15),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(0 ,3),
                blurRadius: 6.0,
              )
            ]
          ),
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 16 , top: 24 , right: 16),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.network(imageUrl,
                  height: 120,
                  width: 100,
                  fit: BoxFit.cover,
                    )
                  ,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  IconButton(
                    icon: Icon(isLiked ? Icons.favorite_border : Icons.favorite),
                    onPressed: toggleLike,
                  ),
                  IconButton(
                    icon: Icon(Icons.shopping_cart),
                    onPressed: toggleShoppingCart,
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
