import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class MediaGalleryPage extends StatefulWidget {
  const MediaGalleryPage({super.key});

  @override
  State<MediaGalleryPage> createState() => _MediaGalleryPageState();
}

class _MediaGalleryPageState extends State<MediaGalleryPage> {
  // ✅ Local images
  final localImages = [
    'assets/images/cat1.jpg',
    'assets/images/cat2.jpg',
    'assets/images/cat3.jpg',
    'assets/images/cat4.jpg',
  ];

  // ✅ Network images (from API)
  List<String> networkImages = [];
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchCatImages();
  }

  Future<void> fetchCatImages() async {
    try {
      final url = Uri.parse('https://api.thecatapi.com/v1/images/search?limit=8');
      // API key is optional for basic usage
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final List data = jsonDecode(response.body);
        setState(() {
          networkImages = data.map<String>((e) => e['url'] as String).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          isLoading = false;
        });
        if (kDebugMode) {
          print('Failed to load cat images from API: ${response.statusCode}');
        }
      }
    } catch (e) {
      setState(() {
        isLoading = false;
      });
      if (kDebugMode) {
        print('Error fetching cat images: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Media Gallery'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 10),
            const Text(
              'Local Cats',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Local Circular Image Grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: localImages.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.teal,
                      width: 4,
                    ),
                    image: DecorationImage(
                      image: AssetImage(localImages[index]),
                      fit: BoxFit.cover,
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 30),
            const Divider(thickness: 1),
            const SizedBox(height: 10),
            const Text(
              'Network Cats (from The Cat API)',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Network Circular Image Grid
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : networkImages.isEmpty
                    ? const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text(
                            'Unable to load network images.\nShowing local images above.',
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ),
                      )
                    : GridView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: networkImages.length,
                    itemBuilder: (context, index) {
                      return ClipOval(
                        child: Image.network(
                          networkImages[index],
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              const Icon(Icons.error,
                                  size: 50, color: Colors.red),
                        ),
                      );
                    },
                  ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
