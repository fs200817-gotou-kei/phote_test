import 'dart:convert';
import 'dart:typed_data';

class WorkSite {
  int? id;
  ByteData? photo;

  WorkSite(
    this.id,
    this.photo,
  );

  factory WorkSite.fromJson(Map<String, dynamic> map) {
    final worksite = WorkSite(
      map['id'],
      map['photo'],
    );
    return worksite;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "photo": photo,
    };
  }

  @override
  String toString() {
    return 'WorkSite(id: $id}';
  }
}

List<WorkSite> worksiteFromJsom(String jsonData) {
  final data = json.decode(jsonData);
  return List<WorkSite>.from(data.map((item) => WorkSite.fromJson(item)));
}

String worksiteToJson(WorkSite data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
