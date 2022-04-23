// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'YoUser.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class YoUserCollectionReference
    implements YoUserQuery, FirestoreCollectionReference<YoUserQuerySnapshot> {
  factory YoUserCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$YoUserCollectionReference;

  static YoUser fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return _$YoUserFromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    YoUser value,
    SetOptions? options,
  ) {
    return _$YoUserToJson(value);
  }

  @override
  YoUserDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<YoUserDocumentReference> add(YoUser value);
}

class _$YoUserCollectionReference extends _$YoUserQuery
    implements YoUserCollectionReference {
  factory _$YoUserCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$YoUserCollectionReference._(
      firestore.collection('yo_users').withConverter(
            fromFirestore: YoUserCollectionReference.fromFirestore,
            toFirestore: YoUserCollectionReference.toFirestore,
          ),
    );
  }

  _$YoUserCollectionReference._(
    CollectionReference<YoUser> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<YoUser> get reference =>
      super.reference as CollectionReference<YoUser>;

  @override
  YoUserDocumentReference doc([String? id]) {
    return YoUserDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<YoUserDocumentReference> add(YoUser value) {
    return reference.add(value).then((ref) => YoUserDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$YoUserCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class YoUserDocumentReference
    extends FirestoreDocumentReference<YoUserDocumentSnapshot> {
  factory YoUserDocumentReference(DocumentReference<YoUser> reference) =
      _$YoUserDocumentReference;

  DocumentReference<YoUser> get reference;

  /// A reference to the [YoUserCollectionReference] containing this document.
  YoUserCollectionReference get parent {
    return _$YoUserCollectionReference(reference.firestore);
  }

  @override
  Stream<YoUserDocumentSnapshot> snapshots();

  @override
  Future<YoUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    int age,
    String email,
  });

  Future<void> set(YoUser value);
}

class _$YoUserDocumentReference
    extends FirestoreDocumentReference<YoUserDocumentSnapshot>
    implements YoUserDocumentReference {
  _$YoUserDocumentReference(this.reference);

  @override
  final DocumentReference<YoUser> reference;

  /// A reference to the [YoUserCollectionReference] containing this document.
  YoUserCollectionReference get parent {
    return _$YoUserCollectionReference(reference.firestore);
  }

  @override
  Stream<YoUserDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return YoUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<YoUserDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return YoUserDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? name = _sentinel,
    Object? age = _sentinel,
    Object? email = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (age != _sentinel) "age": age as int,
      if (email != _sentinel) "email": email as String,
    };

    return reference.update(json);
  }

  Future<void> set(YoUser value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is YoUserDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class YoUserDocumentSnapshot extends FirestoreDocumentSnapshot {
  YoUserDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<YoUser> snapshot;

  @override
  YoUserDocumentReference get reference {
    return YoUserDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final YoUser? data;
}

abstract class YoUserQuery implements QueryReference<YoUserQuerySnapshot> {
  @override
  YoUserQuery limit(int limit);

  @override
  YoUserQuery limitToLast(int limit);

  YoUserQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  YoUserQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  });
  YoUserQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });

  YoUserQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  });

  YoUserQuery orderByAge({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  });

  YoUserQuery orderByEmail({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  });
}

class _$YoUserQuery extends QueryReference<YoUserQuerySnapshot>
    implements YoUserQuery {
  _$YoUserQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<YoUser> reference;

  YoUserQuerySnapshot _decodeSnapshot(
    QuerySnapshot<YoUser> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return YoUserQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<YoUserDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: YoUserDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return YoUserQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<YoUserQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<YoUserQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  YoUserQuery limit(int limit) {
    return _$YoUserQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  YoUserQuery limitToLast(int limit) {
    return _$YoUserQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  YoUserQuery whereName({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$YoUserQuery(
      reference.where(
        'name',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  YoUserQuery whereAge({
    int? isEqualTo,
    int? isNotEqualTo,
    int? isLessThan,
    int? isLessThanOrEqualTo,
    int? isGreaterThan,
    int? isGreaterThanOrEqualTo,
    bool? isNull,
    List<int>? whereIn,
    List<int>? whereNotIn,
  }) {
    return _$YoUserQuery(
      reference.where(
        'age',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  YoUserQuery whereEmail({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$YoUserQuery(
      reference.where(
        'email',
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  YoUserQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('name', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$YoUserQuery(query, _collection);
  }

  YoUserQuery orderByAge({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('age', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$YoUserQuery(query, _collection);
  }

  YoUserQuery orderByEmail({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('email', descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$YoUserQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$YoUserQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class YoUserQuerySnapshot
    extends FirestoreQuerySnapshot<YoUserQueryDocumentSnapshot> {
  YoUserQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<YoUser> snapshot;

  @override
  final List<YoUserQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<YoUserDocumentSnapshot>> docChanges;
}

class YoUserQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements YoUserDocumentSnapshot {
  YoUserQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<YoUser> snapshot;

  @override
  YoUserDocumentReference get reference {
    return YoUserDocumentReference(snapshot.reference);
  }

  @override
  final YoUser data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoUser _$YoUserFromJson(Map<String, dynamic> json) => YoUser(
      name: json['name'] as String,
      age: json['age'] as int,
      email: json['email'] as String,
    );

Map<String, dynamic> _$YoUserToJson(YoUser instance) => <String, dynamic>{
      'name': instance.name,
      'age': instance.age,
      'email': instance.email,
    };
