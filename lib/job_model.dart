import 'dart:convert';

class Job {
  int id;
  String company;
  String description;
  String employmentType;
  String location;
  String position;
  List<dynamic> skillsRequired;

  Job({
    this.id,
    this.company,
    this.description,
    this.employmentType,
    this.location,
    this.position,
    this.skillsRequired,
  });

  factory Job.fromRawJson(String str) => Job.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Job.fromJson(Map<String, dynamic> json) => Job(
        company: json["company"],
        description: json["description"],
        employmentType: json["employmentType"],
        id: json["id"],
        location: json["location"],
        position: json["position"],
        skillsRequired: List<dynamic>.from(json["skillsRequired"].map((x) => x)),
      );

  Map<String, dynamic> toJson() => {
        "company": company,
        "description": description,
        "employmentType": employmentType,
        "id": id,
        "location": location,
        "position": position,
        "skillsRequired": List<dynamic>.from(skillsRequired.map((x) => x)),
      };
}
