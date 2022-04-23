import 'package:json_annotation/json_annotation.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
// This doesn't exist yet...! See "Next Steps"
part 'YoUser.g.dart';

@JsonSerializable(explicitToJson: true)
class YoUser {
  YoUser({
    required this.name,
    required this.age,
    required this.email,
  });

  final String name;
  final int age;
  final String email;
}

@Collection<YoUser>('yo_users')
final usersRef = YoUserCollectionReference();
