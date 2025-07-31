import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/model/event.dart';

class FirebaseUtils {
  static getEventsCollection() {
    return FirebaseFirestore.instance // عشان اخد منه نسخه 
        .collection(Event.collectionName)
        .withConverter<Event>(                       
          // نوع الحاجه الي انا بخذنها
          fromFirestore: (snapshot, options) =>
              Event.FromFireStore(snapshot.data()!),
          toFirestore: (Event, options) => Event.ToFirestore(),
        );
  }

  static Future <void> addEventToFirebase(Event event) {
    var eventsCollection = getEventsCollection(); // collection
    DocumentReference<Event> docRef = eventsCollection.doc(); //document   DocumentReference هو كائن يُستخدم للوصول إلى مستند معين داخل مجموعة، ويتيح لك القيام بعمليات مثل القراءة أو الكتابة أو التحديث على هذا المستند.                   
    event.id = docRef.id; // auto id
     return docRef.set(event);
  }
}
