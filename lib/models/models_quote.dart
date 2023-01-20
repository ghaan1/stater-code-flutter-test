class Quote {
  int id;
  String quote;
  String author;

  Quote({
    required this.id,
    required this.quote,
    required this.author,
  });

  Quote.fromJson(Map json)
      : id = json['id'],
        quote = json['quote'],
        author = json['author'];
}
