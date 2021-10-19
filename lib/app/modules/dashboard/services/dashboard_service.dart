import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';

import 'package:mymoney_app/app/modules/dashboard/model/dashboard_model.dart';

class DashboardService {
  Future<DashboardModel> getAllByMonth(int month) async {
    final response = await http.get(
      Uri.parse(
          "http://MacBook-Air-de-Alvarino.local:8080/dashboard/all-by-filter?year=2021&month=$month"),
      headers: {
        "Content-Type": "application/json",
      },
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load server data');
    }

    return DashboardModel.fromJson(
        json.decode(utf8.decode(response.bodyBytes)));
  }
}
