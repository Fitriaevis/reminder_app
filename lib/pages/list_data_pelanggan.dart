import 'package:flutter/material.dart';
import '../models/data_pelanggan_model.dart';
import '../services/data_service.dart';
import 'detail_screen.dart';

class ListDataPelanggan extends StatefulWidget {
  @override
  _ListDataPelangganState createState() => _ListDataPelangganState();
}

class _ListDataPelangganState extends State<ListDataPelanggan> {
  late Future<List<DataPelanggan>> futureData;

  @override
  void initState() {
    super.initState();
    futureData = fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Data Pelanggan'),
      ),
      body: FutureBuilder<List<DataPelanggan>>(
        future: futureData,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                var data = snapshot.data![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 4.0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: ListTile(
                      leading: Icon(Icons.person),
                      title: Text(data.noAgendaPesta),
                      subtitle: Text(data.nama),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailScreen(data: data),
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
