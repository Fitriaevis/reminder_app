import 'package:flutter/material.dart';
import 'package:suplis_app/models/data_pelanggan_model.dart';

class DetailScreen extends StatelessWidget {
  final DataPelanggan data;

  DetailScreen({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail Data Pelanggan'),
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
                      title: Text('No Agenda Pesta'),
                      subtitle: Text(data.noAgendaPesta),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.person),
                      title: Text('Nama'),
                      subtitle: Text(data.nama),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.home),
                      title: Text('Alamat'),
                      subtitle: Text(data.alamat),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.bolt),
                      title: Text('Daya'),
                      subtitle: Text(data.daya),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(Icons.date_range),
                      title: Text('Tanggal Selesai'),
                      subtitle: Text(data.tglSelesai),
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
