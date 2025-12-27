import 'package:flutter/material.dart';

class ResourceModel {
  final String title;
  final String link;
  final String type; // 'Video' or 'Article'

  ResourceModel({required this.title, required this.link, required this.type});
}
