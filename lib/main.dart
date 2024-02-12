import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tiktok_videos/config/theme/app_theme.dart';
import 'package:tiktok_videos/infraestructure/datasources/local_video_datasource_impl.dart';
import 'package:tiktok_videos/infraestructure/repositories/video_posts_repository_impl.dart';
import 'package:tiktok_videos/presentation/Screens/discover/discover_screen.dart';
import 'package:tiktok_videos/presentation/providers/discover_provider.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final videoPostRepository = VideoPostsRepositoryImpl(videosDatasource: LocalVideoDatasource());

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            lazy: false, create: (_) => DiscoverProvider(videoRepository: videoPostRepository)..loadNextPage()),
      ],
      child: MaterialApp(
          title: 'tiktok_videos',
          debugShowCheckedModeBanner: false,
          theme: AppTheme().getTheme(),
          home: const DiscoverScreen()),
    );
  }
}
