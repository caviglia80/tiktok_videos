import 'package:flutter/material.dart';
import 'package:tiktok_videos/domain/entities/video_post.dart';
import 'package:tiktok_videos/domain/repositories/video_posts_repository.dart';
// import 'package:tiktok_videos/infraestructure/models/local_video_model.dart';
// import 'package:tiktok_videos/shared/data/local_video_posts.dart';

class DiscoverProvider extends ChangeNotifier {
  bool initialLoading = true;
  List<VideoPost> videos = [];
  final VideoPostRepository videoRepository;

  DiscoverProvider({required this.videoRepository});

  Future<void> loadNextPage() async {
    // await Future.delayed(const Duration(seconds: 2));

    // final List<VideoPost> newVideos = videoPosts
    //     .map((video) => LocalVideoModel.fromJson(video).toVideoPostEntity())
    //     .toList();

    final newVideos = await videoRepository.getTrendingVideosByPage(1);

    videos.addAll(newVideos);
    initialLoading = false;
    notifyListeners();
  }
}
