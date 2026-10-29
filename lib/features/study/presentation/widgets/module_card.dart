import 'package:flutter/material.dart';

import '../../data/models/study_module.dart';
import '../../data/models/study_topic.dart';

class ModuleCard extends StatelessWidget {
  const ModuleCard({required this.module, required this.topics, super.key});

  final StudyModule module;
  final List<StudyTopic> topics;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${module.order}. ${module.title}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 4),
            Text(module.description),
            const SizedBox(height: 12),
            for (final topic in topics) ...[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 4),
                child: Row(
                  children: [
                    const Icon(Icons.circle_outlined, size: 18),
                    const SizedBox(width: 8),
                    Expanded(child: Text(topic.title)),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
