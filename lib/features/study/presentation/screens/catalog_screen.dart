import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../controllers/study_controller.dart';
import '../widgets/module_card.dart';

class CatalogScreen extends StatelessWidget {
  const CatalogScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('OdontoPrep UJAT')),
      body: Consumer<StudyController>(
        builder: (context, controller, _) {
          if (controller.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (controller.errorMessage != null) {
            return Center(child: Text(controller.errorMessage!));
          }

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              const Text(
                'Temario de estudio propuesto',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Contenido de apoyo personal; no constituye una guía oficial de la UJAT.',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              const SizedBox(height: 16),
              for (final module in controller.modules)
                ModuleCard(
                  module: module,
                  topics: controller.topicsFor(module.id),
                ),
            ],
          );
        },
      ),
    );
  }
}
