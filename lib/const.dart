import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

const kMessages = 'messages';
const kCreatedAt = 'createdAt';
FirebaseFirestore fireStore = FirebaseFirestore.instance;
CollectionReference messages = fireStore.collection(kMessages);
TextEditingController controller = TextEditingController();
