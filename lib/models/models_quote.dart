import 'dart:convert';

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
//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{'id': id, 'text': text, 'author': author};
//   }

//   factory Quote.fromMap(Map<String, dynamic> map) {
//     return Quote(
//       id: map['id'],
//       text: map['text'] ?? '',
//       author: map['author'] ?? '',
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Quote.fromJson(String source) =>
//       Quote.fromMap(json.decode(source) as Map<String, dynamic>);
// }
