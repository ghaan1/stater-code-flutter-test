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
//   int? page;
//   int? perPage;
//   int? total;
//   int? totalPages;
//   List<Quote>? data;
//   Support? support;

//   ResponseData({
//     this.page,
//     this.perPage,
//     this.total,
//     this.totalPages,
//     this.data,
//     this.support,
//   });

//   ResponseData.fromJson(Map<String, dynamic> json) {
//     page = json['page'];
//     perPage = json['per_page'];
//     total = json['total'];
//     totalPages = json['total_pages'];
//     if (json['data'] != null) {
//       data = <Quote>[];
//       json['data'].forEach((v) {
//         data!.add(Quote.fromJson(v));
//       });
//     }
//     support =
//         json['support'] != null ? Support.fromJson(json['support']) : null;
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['page'] = page;
//     data['per_page'] = perPage;
//     data['total'] = total;
//     data['total_pages'] = totalPages;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     if (support != null) {
//       data['support'] = support!.toJson();
//     }
//     return data;
//   }
// }

// class Quote {
//   int? id;
//   String? quote;
//   String? author;

//   Quote({
//     this.id,
//     this.quote,
//     this.author,
//   });

//   Quote.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     quote = json['quote'];
//     author = json['author'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['id'] = id;
//     data['quote'] = quote;
//     data['author'] = author;
//     return data;
//   }
// }

// class Support {
//   String? url;
//   String? text;

//   Support({this.url, this.text});

//   Support.fromJson(Map<String, dynamic> json) {
//     url = json['url'];
//     text = json['text'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = <String, dynamic>{};
//     data['url'] = url;
//     data['text'] = text;
//     return data;
//   }
}
