import 'package:favourite_places_app/models/place.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class PlacesDetailScreen extends StatelessWidget {
  const PlacesDetailScreen({super.key, required this.place});
  final Place place;

  String get locationImage {
    final lat = place.location.latitude;
    final lng = place.location.longitude;
    return 'https://maps.googleapis.com/maps/api/staticmap?center=$lat,$lng&zoom=16&size=600x300&maptype=roadmap&markers=color:red%7Clabel:A%7C$lat,$lng&key=${dotenv.env['API_KEY']}';
  }

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.title),
      ),
      body: Stack(
        children: [
          Image.file(
            place.image,
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Column(
              children: [
                CircleAvatar(
                  radius: 70,
                  backgroundImage: NetworkImage(locationImage),
                ),
                Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [Colors.transparent, Colors.black54],
                    ),
                  ),
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 16,
                  ),
                  child: Text(
                    place.location.address,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color:
                            Theme.of(context).colorScheme.onPrimaryContainer),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
