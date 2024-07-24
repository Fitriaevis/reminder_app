import 'package:flutter/material.dart';

class ListNotifikasi extends StatelessWidget {
  final List<Map<String, String>> notifications = [
    {
      'title': 'Notifikasi 1',
      'detail': 'Detail notifikasi 1',
    },
    {
      'title': 'Notifikasi 2',
      'detail': 'Detail notifikasi 2',
    },
    {
      'title': 'Notifikasi 3',
      'detail': 'Detail notifikasi 3',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List Notifikasi'),
      ),
      body: ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: ListTile(
                leading: Icon(Icons.notifications),
                title: Text(notifications[index]['title']!),
                subtitle: Text(notifications[index]['detail']!),
              ),
            ),
          );
        },
      ),
    );
  }
}
