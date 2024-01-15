// home_screen.dart
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
// ignore: depend_on_referenced_packages

class HomeApp extends StatelessWidget {
  const HomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> storyProfileImages = [
    'asset/mensky.jpg',
    'asset/keychain.jpg',
    'asset/lightinsta.jpg',
    'asset/dubai.jpg',
    'asset/fire.jpg',
    'asset/peacock.jpg',
    'asset/lightinsta.jpg',
    'asset/mensky.jpg',
    'asset/dubai.jpg',
    'asset/flower.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset(
          'asset/insta.png',
          height: 50,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.favorite),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.chat),
            onPressed: () {
              // Handle actions
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Stories
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: storyProfileImages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Color(0xFFE040FB), // Start color
                            Color(0xFF9C27B0), // End color
                          ],
                        ),
                      ),
                      child: ClipOval(
                        child: Container(
                          padding: const EdgeInsets.all(
                              2.0), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors
                                  .transparent, // Set the border color to transparent
                              width: 2.0, // Adjust the width as needed
                            ),
                            gradient: const LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color.fromARGB(255, 42, 211, 16), // Start color
                                Color.fromARGB(255, 195, 229, 6), // End color
                              ],
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage:
                                AssetImage(storyProfileImages[index]),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            // Posts
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 10,
              itemBuilder: (context, index) {
                return const PostWidget(
                  assetImage: 'asset/mendark.jpg',
                  profileImage: 'asset/mensky.jpg',
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.videocam),
            label: 'reel',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: 0,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        onTap: (index) {
          // Handle navigation based on the selected index
        },
      ),
    );
  }
}

// Post Widget
class PostWidget extends StatelessWidget {
  final String assetImage;
  final String profileImage;

  const PostWidget(
      {super.key, required this.assetImage, required this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // User info
        ListTile(
          leading: CircleAvatar(
            radius: 10,
            backgroundImage: AssetImage(profileImage), // Placeholder color
            // You can load user profile images here
          ),
          title: const Text('thamjid rahiman'),
        ),

        // Post image from asset
        Image.asset(
          assetImage,
          height: 350,
          fit: BoxFit.cover,
        ),

        // Like, comment, and share buttons
        const Padding(
          padding: EdgeInsets.all(1.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.favorite_border),
                  SizedBox(width: 4.0),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.chat_bubble_outline),
                  SizedBox(width: 4.0),
                ],
              ),
              Row(
                children: [
                  Icon(Icons.near_me),
                  SizedBox(width: 4.0),
                ],
              ),
            ],
          ),
        ),

        // Caption and view all comments
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'my life is like a ballon #trending #friendship #srk #vijay #keralablasters #beauty ',
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 4.0),
              GestureDetector(
                onTap: () {
                  // Handle view all comments
                },
                child: const Text(
                  'View all 25 comments',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
