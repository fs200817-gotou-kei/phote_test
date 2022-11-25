import 'dart:convert';
import 'dart:typed_data';

class WorkSite {
  int? id;
  String? name;
  String? subName;
  String? type;
  String? staffName;
  String? photo;
  String? address;
  String? status;

  // DateTime? startAt;
  // DateTime? endAt;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  String? startAt;
  String? endAt;
  String? createdAt;
  String? updatedAt;

  WorkSite(
      this.id,
      this.name,
      this.subName,
      this.photo,
      this.type,
      this.staffName,
      this.address,
      this.status,
      this.startAt,
      this.endAt,
      this.createdAt,
      this.updatedAt);

  factory WorkSite.fromJson(Map<String, dynamic> map) {
    final worksite = WorkSite(
      map["id"],
      map["name"],
      map['photo'],
      map["subName"],
      map["type"],
      map["staffName"],
      map["address"],
      map["status"],
      map["startAt"],
      map["endAt"],
      map["createdAt"],
      map["updatedAt"],
    );
    return worksite;
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "photo": photo,
      "suName": subName,
      "type": type,
      "staffName": staffName,
      "address": address,
      "status": status,
      "startAt": startAt,
      "endAt": endAt,
      "createdAt": createdAt,
      "updatedAt": updatedAt
    };
  }

  @override
  String toString() {
    return 'WorkSite(id: $id, name: $name,subName: $subName,photo: $photo, type: $type, staffName: $staffName, address: $address, status: $status, startAt: $startAt, endAt: $endAt,createdAt: $createdAt, updatedAt: $updatedAt}';
  }
}

List<WorkSite> worksiteFromJsom(String jsonData) {
  final data = json.decode(jsonData);
  // toDateTime(data);
  return List<WorkSite>.from(data.map((item) => WorkSite.fromJson(item)));
}

// void toDateTime(data) {
//   int i = 0;
//   data.forEach((item) {
//     print("OK");
//     print(i);
//     data[i]["startAt"] = DateTime.parse(item["startAt"]);
//     data[i]["endAt"] = DateTime.parse(item["endAt"]);
//     data[i]["createdAt"] = DateTime.parse(item["createdAt"]);
//     data[i]["updatedAt"] = DateTime.parse(item["updatedAt"]);
//     i++;
//   });
// }

String worksiteToJson(WorkSite data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
