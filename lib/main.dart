import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
// import 'package:nava/core/providers/current_user_notifier.dart';
// import 'package:nava/core/theme/theme.dart';
// import 'package:nava/features/auth/ViewModel/auth_viewmodel.dart';
// import 'package:nava/features/auth/view/pages/SignupPage.dart';
import 'package:nava/features/home/pages/home_page.dart';
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.defaultDirectory = dir.path;
  final container = ProviderContainer();
  // await container.read(authViewModelProvider.notifier).initSharedPreferences();
  runApp(
    UncontrolledProviderScope(
      container: container,
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final currentUser = ref.watch(currentUserNotifierProvider);

    return const MaterialApp(
      title: 'music_app',
      // theme: AppTheme.darkThemeMode,
      home: HomePage(),
    );
  }
}
