import 'dart:convert';

import 'package:flutter/services.dart';

class LocalStudySource {
  Future<List<Map<String, dynamic>>> loadModules() async {
    return _loadList('assets/data/modules.json');
  }

  Future<List<Map<String, dynamic>>> loadTopics() async {
    return _loadList('assets/data/topics.json');
  }

  Future<List<Map<String, dynamic>>> _loadList(String path) async {
    final jsonString = await rootBundle.loadString(path);
    final decoded = json.decode(jsonString) as List<dynamic>;
    return decoded.cast<Map<String, dynamic>>();
  }
}
