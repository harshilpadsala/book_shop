class Book {

  final String id;
  final String bookName;
  final String authorName;
  final double price;
  final String description;
  final String imageUrl;
  bool isFavourite;
  bool isInShoppingCart;

  Book({
    this.id,
    this.bookName,
    this.authorName,
    this.description,
    this.price,
    this.imageUrl,
    this.isFavourite = false,
    this.isInShoppingCart = false,
  }


  );

  void addToFav(){
    isFavourite =! isFavourite;
  }

  void addToShoppingCart(){
    isInShoppingCart = ! isInShoppingCart;
  }
}