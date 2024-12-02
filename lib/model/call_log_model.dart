import 'dart:convert';

class CallLogModel {
  final String? name;
  final String number;
  final String type;
  final int duration;
  final String? recordingPath;

  CallLogModel({
    this.name,
    required this.number,
    required this.type,
    required this.duration,
    this.recordingPath,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'number': number,
      'type': type,
      'duration': duration,
      'recordingPath': recordingPath,
    };
  }

  factory CallLogModel.fromMap(Map<String, dynamic> map) {
    return CallLogModel(
      name: map['name'],
      number: map['number'],
      type: map['type'],
      duration: map['duration'],
      recordingPath: map['recordingPath'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CallLogModel.fromJson(String source) => 
      CallLogModel.fromMap(json.decode(source));
}
