import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'job_model.dart';

Future<List<Job>> fetchJobsApi() async {
  final jobsListAPIUrl = 'https://mock-json-service.glitch.me/';
  final response = await http.get(jobsListAPIUrl);

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((job) => new Job.fromJson(job)).toList();
  } else {
    throw Exception('Failed to load jobs from API');
  }
}
