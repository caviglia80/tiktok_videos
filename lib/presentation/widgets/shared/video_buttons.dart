import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:tiktok_videos/config/helpers/human_formats.dart';
import 'package:tiktok_videos/domain/entities/video_post.dart';

class VideoButtons extends StatelessWidget {
  const VideoButtons({super.key, required this.video});

  final VideoPost video;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        BounceInDown(
            delay: const Duration(microseconds: 50),
            child: _CustomIconButtom(
                value: video.likes,
                iconColor: Colors.red,
                iconData: Icons.favorite)),
        const SizedBox(height: 20),

        BounceInDown(
            delay: const Duration(microseconds: 50),
            child: _CustomIconButtom(
                value: video.likes, iconData: Icons.remove_red_eye_outlined)),
        const SizedBox(height: 20),
        
        BounceInDown(
            delay: const Duration(microseconds: 50),
            child: const _CustomIconButtom(
                value: 0, iconData: Icons.play_arrow_outlined)),
      ],
    );
  }
}

class _CustomIconButtom extends StatelessWidget {
  final int value;
  final IconData iconData;
  final Color? color;

  const _CustomIconButtom(
      {required this.value, required this.iconData, iconColor})
      : color = iconColor ?? Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              iconData,
              color: color,
              size: 30,
            )),
        Text(HumanFormats.humanReadbleNumber(value.toDouble())),
      ],
    );
  }
}
