import 'dart:io';

import 'package:favorite_places/models/place.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UserPlacesNotifier extends StateNotifier<List<Place>> {
  UserPlacesNotifier() : super([]);

  void addPlace(String title, File image, PlaceLocation location) {
    state = [Place(title: title, image: image, location: location), ...state];
  }
}

final userPlacesProvider = StateNotifierProvider<UserPlacesNotifier, List<Place>>(
  (ref) => UserPlacesNotifier(),
);