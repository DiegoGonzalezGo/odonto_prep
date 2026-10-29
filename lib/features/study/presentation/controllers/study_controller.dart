import 'package:flutter/foundation.dart';

import '../../data/models/study_module.dart';
import '../../data/models/study_topic.dart';
import '../../data/repositories/study_repository.dart';

class StudyController extends ChangeNotifier {
  StudyController(this._repository);

  final StudyRepository _repository;

  List<StudyModule> modules = const [];
  List<StudyTopic> topics = const [];
  bool isLoading = false;
  String? errorMessage;

  Future<void> loadCatalog() async {
    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      final catalog = await _repository.loadCatalog();
      modules = catalog.$1;
      topics = catalog.$2;
    } catch (error) {
      errorMessage = 'No se pudo cargar el temario local.';
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  List<StudyTopic> topicsFor(String moduleId) {
    return topics.where((topic) => topic.moduleId == moduleId).toList();
  }
}
