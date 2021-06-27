import 'package:nyt/Model/results_model.dart';

class Nty {
  String? status;
  String? copyright;
  String? section;
  String? lastUpdated;
  int? numResults;
  List<Results>? results;

  Nty(
      {this.status,
      this.copyright,
      this.section,
      this.lastUpdated,
      this.numResults,
      this.results});

  Nty.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    copyright = json['copyright'];
    section = json['section'];
    lastUpdated = json['last_updated'];
    numResults = json['num_results'];
    if (json['results'] != null) {
      // ignore: deprecated_member_use
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['copyright'] = this.copyright;
    data['section'] = this.section;
    data['last_updated'] = this.lastUpdated;
    data['num_results'] = this.numResults;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
