import 'dart:convert';
import 'book.dart';
import 'package:http/http.dart' as http;


Future<Book> fetchBook(String isbn) async {
  // 841901012X isbn
  String url = 'https://openlibrary.org/isbn/$isbn.json';
  final res = await http.get(Uri.parse(url));

  if(res.statusCode == 200){
    return Book.fromJson(jsonDecode(res.body) as Map<String,dynamic>);
  } else {
    throw Exception('failed to load book');
  }
}

String fetchCoverURI(String coverId) {
  // 841901012X isbn
  return 'https://covers.openlibrary.org/b/id/$coverId-S.jpg';
  // final res = await http.get(Uri.parse(url));
  // Image img = await Image.network(url);
  // return  img;
}