import 'package:cloud_firestore/cloud_firestore.dart';

class Event {
  static const String collectionName = 'Events';
  String id;
  bool isFavorite;
  String image;
  String title;
  String description;
  String eventName;
  DateTime dateTime;
  String time;
  Event({
    this.id = '',
    this.isFavorite = false,
    required this.image,
    required this.dateTime,
    required this.description,
    required this.eventName,
    required this.time,
    required this.title,
  });
  Event.FromFireStore(Map<String, dynamic> data)
    : this(
        id: data['id'],
        title: data['title'],
        description: data['description'],
        image: data['image'],
        isFavorite: data['isFavorite'],
        eventName: data['eventName'],
        time: data['time'],
        dateTime: DateTime.fromMillisecondsSinceEpoch(data['dateTime']),
      );
  Map<String, dynamic> ToFirestore() {
    return {
      'id': id,
      'title': title,
      'image': image,
      'dateTime': dateTime.millisecondsSinceEpoch,
      'description': description,
      'eventName': eventName,
      'time': time,
      'isFavorite': isFavorite,
    };
  }
}
