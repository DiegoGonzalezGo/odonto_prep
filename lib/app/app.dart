import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../features/study/data/repositories/study_repository.dart';
import '../features/study/data/sources/local_study_source.dart';
import '../features/study/presentation/controllers/study_controller.dart';
import '../features/study/presentation/screens/catalog_screen.dart';
import 'router.dart';
import 'theme/app_theme.dart';

class OdontoPrepApp extends StatelessWidget {
  const OdontoPrepApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) =>
          StudyController(StudyRepository(LocalStudySource()))..loadCatalog(),
      child: MaterialApp(
        title: 'OdontoPrep UJAT',
        theme: AppTheme.light,
        onGenerateRoute: AppRouter.onGenerateRoute,
        home: const CatalogScreen(),
      ),
    );
  }
}
