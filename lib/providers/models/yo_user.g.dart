// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'yo_user.dart';

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

  late final ConversationCollectionReference conversations =
      _$ConversationCollectionReference(
    reference,
  );

  @override
  Stream<YoUserDocumentSnapshot> snapshots();

  @override
  Future<YoUserDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String name,
    String email,
    String? photoUrl,
    String phoneNumber,
    String uid,
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

  late final ConversationCollectionReference conversations =
      _$ConversationCollectionReference(
    reference,
  );

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
    Object? email = _sentinel,
    Object? photoUrl = _sentinel,
    Object? phoneNumber = _sentinel,
    Object? uid = _sentinel,
  }) async {
    final json = {
      if (name != _sentinel) "name": name as String,
      if (email != _sentinel) "email": email as String,
      if (photoUrl != _sentinel) "photoUrl": photoUrl as String?,
      if (phoneNumber != _sentinel) "phoneNumber": phoneNumber as String,
      if (uid != _sentinel) "uid": uid as String,
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
  YoUserQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  YoUserQuery wherePhoneNumber({
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
  YoUserQuery whereUid({
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

  YoUserQuery orderByPhotoUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    YoUserDocumentSnapshot? startAtDocument,
    YoUserDocumentSnapshot? endAtDocument,
    YoUserDocumentSnapshot? endBeforeDocument,
    YoUserDocumentSnapshot? startAfterDocument,
  });

  YoUserQuery orderByPhoneNumber({
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

  YoUserQuery orderByUid({
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

  YoUserQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$YoUserQuery(
      reference.where(
        'photoUrl',
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

  YoUserQuery wherePhoneNumber({
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
        'phoneNumber',
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

  YoUserQuery whereUid({
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
        'uid',
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

  YoUserQuery orderByPhotoUrl({
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
    var query = reference.orderBy('photoUrl', descending: descending);

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

  YoUserQuery orderByPhoneNumber({
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
    var query = reference.orderBy('phoneNumber', descending: descending);

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

  YoUserQuery orderByUid({
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
    var query = reference.orderBy('uid', descending: descending);

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

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class ConversationCollectionReference
    implements
        ConversationQuery,
        FirestoreCollectionReference<ConversationQuerySnapshot> {
  factory ConversationCollectionReference(
    DocumentReference<YoUser> parent,
  ) = _$ConversationCollectionReference;

  static Conversation fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Conversation.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Conversation value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [YoUserDocumentReference] if this is a subcollection.
  YoUserDocumentReference get parent;

  @override
  ConversationDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<ConversationDocumentReference> add(Conversation value);
}

class _$ConversationCollectionReference extends _$ConversationQuery
    implements ConversationCollectionReference {
  factory _$ConversationCollectionReference(
    DocumentReference<YoUser> parent,
  ) {
    return _$ConversationCollectionReference._(
      YoUserDocumentReference(parent),
      parent.collection('conversations').withConverter(
            fromFirestore: ConversationCollectionReference.fromFirestore,
            toFirestore: ConversationCollectionReference.toFirestore,
          ),
    );
  }

  _$ConversationCollectionReference._(
    this.parent,
    CollectionReference<Conversation> reference,
  ) : super(reference, reference);

  @override
  final YoUserDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Conversation> get reference =>
      super.reference as CollectionReference<Conversation>;

  @override
  ConversationDocumentReference doc([String? id]) {
    return ConversationDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<ConversationDocumentReference> add(Conversation value) {
    return reference
        .add(value)
        .then((ref) => ConversationDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$ConversationCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class ConversationDocumentReference
    extends FirestoreDocumentReference<ConversationDocumentSnapshot> {
  factory ConversationDocumentReference(
          DocumentReference<Conversation> reference) =
      _$ConversationDocumentReference;

  DocumentReference<Conversation> get reference;

  /// A reference to the [ConversationCollectionReference] containing this document.
  ConversationCollectionReference get parent {
    return _$ConversationCollectionReference(
      reference.parent.parent!.withConverter<YoUser>(
        fromFirestore: YoUserCollectionReference.fromFirestore,
        toFirestore: YoUserCollectionReference.toFirestore,
      ),
    );
  }

  late final MessageCollectionReference messages = _$MessageCollectionReference(
    reference,
  );

  @override
  Stream<ConversationDocumentSnapshot> snapshots();

  @override
  Future<ConversationDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String id,
    String name,
    String? phoneNumber,
    String? photoUrl,
    String lastMessage,
    int unreadCount,
    String displayName,
  });

  Future<void> set(Conversation value);
}

class _$ConversationDocumentReference
    extends FirestoreDocumentReference<ConversationDocumentSnapshot>
    implements ConversationDocumentReference {
  _$ConversationDocumentReference(this.reference);

  @override
  final DocumentReference<Conversation> reference;

  /// A reference to the [ConversationCollectionReference] containing this document.
  ConversationCollectionReference get parent {
    return _$ConversationCollectionReference(
      reference.parent.parent!.withConverter<YoUser>(
        fromFirestore: YoUserCollectionReference.fromFirestore,
        toFirestore: YoUserCollectionReference.toFirestore,
      ),
    );
  }

  late final MessageCollectionReference messages = _$MessageCollectionReference(
    reference,
  );

  @override
  Stream<ConversationDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return ConversationDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<ConversationDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return ConversationDocumentSnapshot._(
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
    Object? id = _sentinel,
    Object? name = _sentinel,
    Object? phoneNumber = _sentinel,
    Object? photoUrl = _sentinel,
    Object? lastMessage = _sentinel,
    Object? unreadCount = _sentinel,
    Object? displayName = _sentinel,
  }) async {
    final json = {
      if (id != _sentinel) "id": id as String,
      if (name != _sentinel) "name": name as String,
      if (phoneNumber != _sentinel) "phoneNumber": phoneNumber as String?,
      if (photoUrl != _sentinel) "photoUrl": photoUrl as String?,
      if (lastMessage != _sentinel) "lastMessage": lastMessage as String,
      if (unreadCount != _sentinel) "unreadCount": unreadCount as int,
      if (displayName != _sentinel) "displayName": displayName as String,
    };

    return reference.update(json);
  }

  Future<void> set(Conversation value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is ConversationDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class ConversationDocumentSnapshot extends FirestoreDocumentSnapshot {
  ConversationDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Conversation> snapshot;

  @override
  ConversationDocumentReference get reference {
    return ConversationDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Conversation? data;
}

abstract class ConversationQuery
    implements QueryReference<ConversationQuerySnapshot> {
  @override
  ConversationQuery limit(int limit);

  @override
  ConversationQuery limitToLast(int limit);

  ConversationQuery whereId({
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
  ConversationQuery whereName({
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
  ConversationQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ConversationQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  ConversationQuery whereLastMessage({
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
  ConversationQuery whereUnreadCount({
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
  ConversationQuery whereDisplayName({
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

  ConversationQuery orderById({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByPhoneNumber({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByPhotoUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByLastMessage({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByUnreadCount({
    bool descending = false,
    int startAt,
    int startAfter,
    int endAt,
    int endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });

  ConversationQuery orderByDisplayName({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  });
}

class _$ConversationQuery extends QueryReference<ConversationQuerySnapshot>
    implements ConversationQuery {
  _$ConversationQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Conversation> reference;

  ConversationQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Conversation> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return ConversationQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<ConversationDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: ConversationDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return ConversationQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<ConversationQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<ConversationQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  ConversationQuery limit(int limit) {
    return _$ConversationQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  ConversationQuery limitToLast(int limit) {
    return _$ConversationQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  ConversationQuery whereId({
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
    return _$ConversationQuery(
      reference.where(
        'id',
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

  ConversationQuery whereName({
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
    return _$ConversationQuery(
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

  ConversationQuery wherePhoneNumber({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ConversationQuery(
      reference.where(
        'phoneNumber',
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

  ConversationQuery wherePhotoUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$ConversationQuery(
      reference.where(
        'photoUrl',
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

  ConversationQuery whereLastMessage({
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
    return _$ConversationQuery(
      reference.where(
        'lastMessage',
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

  ConversationQuery whereUnreadCount({
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
    return _$ConversationQuery(
      reference.where(
        'unreadCount',
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

  ConversationQuery whereDisplayName({
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
    return _$ConversationQuery(
      reference.where(
        'displayName',
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

  ConversationQuery orderById({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('id', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByPhoneNumber({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('phoneNumber', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByPhotoUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('photoUrl', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByLastMessage({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('lastMessage', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByUnreadCount({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('unreadCount', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  ConversationQuery orderByDisplayName({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    ConversationDocumentSnapshot? startAtDocument,
    ConversationDocumentSnapshot? endAtDocument,
    ConversationDocumentSnapshot? endBeforeDocument,
    ConversationDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('displayName', descending: descending);

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

    return _$ConversationQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$ConversationQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class ConversationQuerySnapshot
    extends FirestoreQuerySnapshot<ConversationQueryDocumentSnapshot> {
  ConversationQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Conversation> snapshot;

  @override
  final List<ConversationQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<ConversationDocumentSnapshot>> docChanges;
}

class ConversationQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements ConversationDocumentSnapshot {
  ConversationQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Conversation> snapshot;

  @override
  ConversationDocumentReference get reference {
    return ConversationDocumentReference(snapshot.reference);
  }

  @override
  final Conversation data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class MessageCollectionReference
    implements
        MessageQuery,
        FirestoreCollectionReference<MessageQuerySnapshot> {
  factory MessageCollectionReference(
    DocumentReference<Conversation> parent,
  ) = _$MessageCollectionReference;

  static Message fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Message.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Message value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  /// A reference to the containing [ConversationDocumentReference] if this is a subcollection.
  ConversationDocumentReference get parent;

  @override
  MessageDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<MessageDocumentReference> add(Message value);
}

class _$MessageCollectionReference extends _$MessageQuery
    implements MessageCollectionReference {
  factory _$MessageCollectionReference(
    DocumentReference<Conversation> parent,
  ) {
    return _$MessageCollectionReference._(
      ConversationDocumentReference(parent),
      parent.collection('messages').withConverter(
            fromFirestore: MessageCollectionReference.fromFirestore,
            toFirestore: MessageCollectionReference.toFirestore,
          ),
    );
  }

  _$MessageCollectionReference._(
    this.parent,
    CollectionReference<Message> reference,
  ) : super(reference, reference);

  @override
  final ConversationDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<Message> get reference =>
      super.reference as CollectionReference<Message>;

  @override
  MessageDocumentReference doc([String? id]) {
    return MessageDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<MessageDocumentReference> add(Message value) {
    return reference.add(value).then((ref) => MessageDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class MessageDocumentReference
    extends FirestoreDocumentReference<MessageDocumentSnapshot> {
  factory MessageDocumentReference(DocumentReference<Message> reference) =
      _$MessageDocumentReference;

  DocumentReference<Message> get reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(
      reference.parent.parent!.withConverter<Conversation>(
        fromFirestore: ConversationCollectionReference.fromFirestore,
        toFirestore: ConversationCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots();

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    String text,
  });

  Future<void> set(Message value);
}

class _$MessageDocumentReference
    extends FirestoreDocumentReference<MessageDocumentSnapshot>
    implements MessageDocumentReference {
  _$MessageDocumentReference(this.reference);

  @override
  final DocumentReference<Message> reference;

  /// A reference to the [MessageCollectionReference] containing this document.
  MessageCollectionReference get parent {
    return _$MessageCollectionReference(
      reference.parent.parent!.withConverter<Conversation>(
        fromFirestore: ConversationCollectionReference.fromFirestore,
        toFirestore: ConversationCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<MessageDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return MessageDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<MessageDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return MessageDocumentSnapshot._(
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
    Object? text = _sentinel,
  }) async {
    final json = {
      if (text != _sentinel) "text": text as String,
    };

    return reference.update(json);
  }

  Future<void> set(Message value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is MessageDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class MessageDocumentSnapshot extends FirestoreDocumentSnapshot {
  MessageDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Message> snapshot;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Message? data;
}

abstract class MessageQuery implements QueryReference<MessageQuerySnapshot> {
  @override
  MessageQuery limit(int limit);

  @override
  MessageQuery limitToLast(int limit);

  MessageQuery whereText({
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

  MessageQuery orderByText({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  });
}

class _$MessageQuery extends QueryReference<MessageQuerySnapshot>
    implements MessageQuery {
  _$MessageQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Message> reference;

  MessageQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Message> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return MessageQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<MessageDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: MessageDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return MessageQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<MessageQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<MessageQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  MessageQuery limit(int limit) {
    return _$MessageQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  MessageQuery limitToLast(int limit) {
    return _$MessageQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  MessageQuery whereText({
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
    return _$MessageQuery(
      reference.where(
        'text',
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

  MessageQuery orderByText({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    MessageDocumentSnapshot? startAtDocument,
    MessageDocumentSnapshot? endAtDocument,
    MessageDocumentSnapshot? endBeforeDocument,
    MessageDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy('text', descending: descending);

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

    return _$MessageQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$MessageQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class MessageQuerySnapshot
    extends FirestoreQuerySnapshot<MessageQueryDocumentSnapshot> {
  MessageQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Message> snapshot;

  @override
  final List<MessageQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<MessageDocumentSnapshot>> docChanges;
}

class MessageQueryDocumentSnapshot extends FirestoreQueryDocumentSnapshot
    implements MessageDocumentSnapshot {
  MessageQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Message> snapshot;

  @override
  MessageDocumentReference get reference {
    return MessageDocumentReference(snapshot.reference);
  }

  @override
  final Message data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

YoUser _$YoUserFromJson(Map<String, dynamic> json) => YoUser(
      name: json['name'] as String,
      email: json['email'] as String,
      photoUrl: json['photoUrl'] as String?,
      uid: json['uid'] as String,
      phoneNumber: json['phoneNumber'] as String,
    );

Map<String, dynamic> _$YoUserToJson(YoUser instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'photoUrl': instance.photoUrl,
      'phoneNumber': instance.phoneNumber,
      'uid': instance.uid,
    };
