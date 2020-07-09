import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:bookshop/model/book_data.dart';
import 'package:bookshop/widgets/custom_drawer.dart';



class ShoppingCart extends StatelessWidget {

  static const String id = 'shoppingCart';

  double totalPrice = 0;



  @override
  Widget build(BuildContext context) {
    
    List shoppingCart = Provider.of<BookData>(context).cart;




    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Text('Shopping cart'),
      ),
      body: Consumer<BookData>(
        builder: (context , bookData , child){
          return Column(
            children: <Widget>[
          Expanded(
            child: ListView.builder(

            itemCount: shoppingCart.length,
                itemBuilder: (context , index){
                  return ListTile(
                    title: Text(shoppingCart[index].bookName),
                    subtitle: Text(shoppingCart[index].authorName),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: (){
                        Provider.of<BookData>(context , listen: false).removeFromCart(shoppingCart[index]);
                      },
                    ),
                    leading: Image.network(shoppingCart[index].imageUrl),
                  );
                }),
          ),



              Text(Provider.of<BookData>(context).calculatePrice.toString(),
              style: TextStyle(
                color: Colors.black,

              ),),

            ],
          );
        },
      )
    );
  }
}
