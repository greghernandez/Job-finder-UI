import 'package:job_finder/models/company.dart';

class Job {
  String location;
  String role;
  Company company;
  bool isFavorite;

  Job({required this.role, required this.location, required this.company, required this.isFavorite});
}