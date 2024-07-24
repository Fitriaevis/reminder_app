import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Map<String, String> data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data Petugas'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('images/profile.jpg'),
              ),
            ),
            SizedBox(height: 16),
            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: Icon(Icons.badge),
                      title: Text('ID'),
                      subtitle: Text(data['id']!),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Nama'),
                      subtitle: Text(data['nama']!),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Alamat'),
                      subtitle: Text(data['alamat']!),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('Tanggal Mulai'),
                      subtitle: Text(data['tanggalMulai']!),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('Tanggal Berakhir'),
                      subtitle: Text(data['tanggalBerakhir']!),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
