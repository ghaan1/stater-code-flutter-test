class Quote {
  int? id;
  String? quote;
  String? author;

  Quote({
    this.id,
    this.quote,
    this.author,
  });

  Quote.fromJson(Map json)
      : id = json['id'],
        quote = json['quote'],
        author = json['author'];
}
