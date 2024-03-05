import 'package:flutter/material.dart';
import 'book.dart';

class BookTable extends StatelessWidget {

  const BookTable({
    super.key, 
    required this.bookData
  });

  final List<Book> bookData;

  @override
  Widget build(BuildContext context){

    Iterable<DataRow> rows = bookData.map((b) => DataRow(cells: <DataCell>[
        DataCell(Text(b.title)),
        DataCell(Text(b.refcode)),
        DataCell(InkWell(onTap: () => showDialog(
          builder: (BuildContext context) => AlertDialog(
            backgroundColor: Colors.transparent,
            insetPadding: const EdgeInsets.all(2),
            title: Container(
              decoration: const BoxDecoration(),
              width: MediaQuery.of(context).size.width,
              child: 
                // Expanded(child: Image.network(b.coverURI, fit: BoxFit.contain))
                Image.network(b.coverURI)
            ),
          ), context: context),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.network(b.coverURI, fit: BoxFit.scaleDown,)
          ),
        )),
        // DataCell(FadeInImage(image: NetworkImage(b.coverURI), placeholder: const AssetImage('assets/images/book_placeholder.png')), onTap: onImageTap),
    ]));

    return DataTable(
      columns: const <DataColumn>[
        DataColumn(label: Expanded(child: Text('Title', style: TextStyle(fontStyle: FontStyle.italic),))),
        DataColumn(label: Expanded(child: Text('ISBN', style: TextStyle(fontStyle: FontStyle.italic),))),
        DataColumn(label: Expanded(child: Text('Cover', style: TextStyle(fontStyle: FontStyle.italic),))),
      ],
      rows: rows.toList()
    );
  }
}