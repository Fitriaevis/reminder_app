import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/data_pelanggan_model.dart';

Future<List<DataPelanggan>> fetchData() async {
  final response =
      await http.get(Uri.parse('https://jbst.plngresik.net/json/reminder.php'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => DataPelanggan.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load data');
  }
}
