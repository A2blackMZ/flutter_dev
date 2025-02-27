import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Musique"),
        backgroundColor: const Color(0xFF104590),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Logique de recherche ici
            },
          ),
          IconButton(
            icon: const Icon(Icons.account_circle),
            onPressed: () {
              // Logique de profil utilisateur ici
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Artistes en vedette",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildFeaturedArtists(),
              const SizedBox(height: 20),
              const Text(
                "Chansons populaires",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              _buildPopularSongs(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Accueil"),
          BottomNavigationBarItem(icon: Icon(Icons.library_music), label: "Bibliothèque"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Paramètres"),
        ],
        currentIndex: 0,
        onTap: (index) {
          // Logique de navigation ici
        },
      ),
    );
  }

  Widget _buildFeaturedArtists() {
    return SizedBox(
      height: 100,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: List.generate(5, (index) {
          return Container(
            width: 80,
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.grey[300],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.grey[400],
                  child: const Icon(Icons.person, size: 30, color: Colors.white),
                ),
                const SizedBox(height: 5),
                //const Text(
                  //"Artiste ${index + 1}",
                  //style: TextStyle(fontSize: 12),
                  //textAlign: TextAlign.center,
                //),
              ],
            ),
          );
        }),
      ),
    );
  }

  Widget _buildPopularSongs() {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 10,
      itemBuilder: (context, index) {
        return ListTile(
          leading: const Icon(Icons.music_note, color: Color(0xFF104590)),
          title: Text("Chanson ${index + 1}"),
          //subtitle: const Text("Artiste ${index + 1}"),
          trailing: const Icon(Icons.play_arrow, color: Color(0xFF104590)),
          onTap: () {
            // Logique pour jouer la chanson ici
          },
        );
      },
    );
  }
}
