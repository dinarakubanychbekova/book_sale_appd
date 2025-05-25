class Book {
  final String id;
  final String title;
  final double price;

  Book({required this.id, required this.title, required this.price});

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Book && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => id.hashCode;
}
