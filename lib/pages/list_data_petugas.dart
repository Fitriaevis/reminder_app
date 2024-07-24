import 'package:flutter/material.dart';
import 'detail_screen.dart';

class ListDataPetugas extends StatelessWidget {
  final List<Map<String, String>> data = [
    {
      'id': 'ID-1',
      'nama': 'Nama 1',
      'alamat': 'Alamat 1',
      'tanggalMulai': '2024-07-01',
      'tanggalBerakhir': '2024-07-31',
    },
    {
      'id': 'ID-2',
      'nama': 'Nama 2',
      'alamat': 'Alamat 2',
      'tanggalMulai': '2024-07-01',
      'tanggalBerakhir': '2024-07-31',
    },
    {
      'id': 'ID-3',
      'nama': 'Nama 3',
      'alamat': 'Alamat 3',
      'tanggalMulai': '2024-07-01',
      'tanggalBerakhir': '2024-07-31',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data Petugas'),
      ),
      body: ListView.builder(
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0, // Slight elevation to make the card stand out
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0), // Rounded corners
              ),
              child: ListTile(
                leading: Icon(Icons.person),
                title: Text(data[index]['id']!),
                subtitle: Text(data[index]['nama']!),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailScreen(data: data[index]),
                    ),
                  );
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
