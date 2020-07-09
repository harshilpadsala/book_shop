import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'book_model.dart';

class BookData extends ChangeNotifier {


  List<Book> _books = [
    Book(
        id: 'b1',
        bookName: 'The Fault in our Stars',
        authorName: 'John Green',
        description: 'The love story of two teenagers having cancer',
        price: 350,
        imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81a4kCNuH+L.jpg'
    ),

    Book(
      id: 'b2',
      bookName: 'The Night Circus',
      authorName: 'Erin Morgenstern',
      description: 'The magical love story of two young magician engaged in a contest',
      price: 400,
      imageUrl: 'https://images-na.ssl-images-amazon.com/images/I/81RzOsu0RqL.jpg',
    ),

    Book(
        id: 'b3',
        bookName: 'The Graveyard Book',
        authorName: 'Neil Gaiman',
        description: 'The life of a boy whose parents are murdered by an assassin when he was young and had to grow up with dead',
        price: 326,
        imageUrl: 'https://mediad.publicbroadcasting.net/p/kwit/files/styles/x_large/public/201603/graveyard-book_copy.jpg'
    ),

  ];


  List cart = [];

  int get booksCount{
    return _books.length;
  }

  UnmodifiableListView<Book> get books{
    return UnmodifiableListView(_books);
  }

  Book getCurrentBook(String id){
    final currentBook = _books.firstWhere((element) => element.id == id);
    return currentBook;
  }

  void addToFavourites(Book book)
  {
    book.addToFav();
    notifyListeners();
  }

  List favouriteScreen()
  {
    final List favourites = _books.where((element) => element.isFavourite == true).toList();
    return favourites;
  }

  void addToCart(Book book){
    cart.add(book);
    notifyListeners();
  }

  void removeFromCart(Book book){
    cart.remove(book);
    notifyListeners();
  }

  double get calculatePrice{
   double total = 0;
   cart.forEach((  element) {
     total +=  element.price;});
    return total;
  }





}