import 'helpers.dart' as helper;

class Book {

  final String title;
  final String refcode;
  final String coverURI;

  const Book({
    required this.title,
    required this.refcode,
    required this.coverURI
  });

  factory Book.fromJson(Map<String, dynamic> json){
    return switch(json){
      {
        'title': String title,
      } => Book(title: title, refcode: json['isbn_10'][0], coverURI: helper.fetchCoverURI(json['covers'][0].toString())),
        _ => throw const FormatException('Failed to load book'),
    };
  }
}