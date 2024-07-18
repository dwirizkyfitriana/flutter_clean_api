import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_clean_api/config/theme/app_theme.dart';
import 'package:flutter_clean_api/features/daily_news/presentation/bloc/remote/remote_article_bloc.dart';
import 'package:flutter_clean_api/features/daily_news/presentation/pages/home/daily_news.dart';
import 'package:flutter_clean_api/injection_container.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RemoteArticleBloc>(
      create: (context) => sl()..add(const GetArticles()),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        home: const DailyNews(),
      ),
    );
  }
}
