import '../models/study_module.dart';
import '../models/study_topic.dart';
import '../sources/local_study_source.dart';

class StudyRepository {
  StudyRepository(this._source);

  final LocalStudySource _source;

  Future<(List<StudyModule>, List<StudyTopic>)> loadCatalog() async {
    final moduleJson = await _source.loadModules();
    final topicJson = await _source.loadTopics();

    final modules = moduleJson.map(StudyModule.fromJson).toList()
      ..sort((a, b) => a.order.compareTo(b.order));
    final topics = topicJson.map(StudyTopic.fromJson).toList()
      ..sort((a, b) => a.order.compareTo(b.order));

    final moduleIds = modules.map((module) => module.id).toSet();
    if (topics.any((topic) => !moduleIds.contains(topic.moduleId))) {
      throw const FormatException(
        'Existe un tema asociado a un módulo desconocido.',
      );
    }

    return (modules, topics);
  }
}
