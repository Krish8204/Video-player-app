import 'package:flutter/material.dart';
import 'video_player_screen.dart'; // Import your video player screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StreamFlix',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(color: Colors.transparent, elevation: 0),
      ),
      home: const VideoListScreen(),
    );
  }
}

class VideoListScreen extends StatelessWidget {
  const VideoListScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> videos = [
      {
        'title': 'China Tower',
        'duration': '00:08',
        'asset': 'assets/video1.mp4',
        'thumbnail': 'assets/video1_thumb.jpg',
        'isNew': false
      },
      {
        'title': 'Turtle',
        'duration': '00:25',
        'asset': 'assets/video2.mp4',
        'thumbnail': 'assets/video2_thumb.jpg',
        'isNew': true
      },
      {
        'title': 'IMG_1467',
        'duration': '00:20',
        'asset': 'assets/video3.mp4',
        'thumbnail': 'assets/video3_thumb.jpg',
        'isNew': true
      },
      
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("StreamFlix")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Three items per row
            crossAxisSpacing: 8.0,
            mainAxisSpacing: 8.0,
            childAspectRatio: 1.5, // Adjust for a compact look
          ),
          itemCount: videos.length,
          itemBuilder: (context, index) {
            final Map<String, dynamic> video = videos[index];

            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => VideoPlayerScreen(
                      videoAsset: video['asset'] as String, // Explicit cast
                    ),
                  ),
                );
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: AspectRatio(
                      aspectRatio: 16 / 9, // Maintain a cinematic ratio
                      child: Image.asset(
                        video['thumbnail'] as String, // Explicit cast
                        fit: BoxFit.cover,
                        width: double.infinity,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          video['title'] as String, // Explicit cast
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      if (video['isNew'] as bool) // Explicit cast
                        const Text(
                          " NEW",
                          style: TextStyle(
                            color: Colors.orange,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        ),
                    ],
                  ),
                  Text(
                    video['duration'] as String, // Explicit cast
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
