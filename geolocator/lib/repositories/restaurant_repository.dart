import 'package:flutter/material.dart';
import 'package:geolocator_app/models/restaurant.dart';

class RestaurantRepository extends ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: 'Restaurante Recanto do Sabor',
      address:
          'Setor C, R. Dr. Artur Couto, nº 12 - 1º Andar - Mussurunga I, Salvador - BA, 41490-374',
      image:
          'https://streetviewpixels-pa.googleapis.com/v1/thumbnail?panoid=K9kDSaf2Z1mKHcvbhsXPfQ&cb_client=search.gws-prod.gps&w=408&h=240&yaw=190.15508&pitch=0&thumbfov=100',
      latitude: -12.916661010051914,
      longitude: -38.36316789900323,
    ),
    Restaurant(
      name: 'Churrascaria e Pizzaria Boi Na Brasa',
      address:
          'R. Prof. Plínio Garcez de Sena, 42 - Mussurunga I, Salvador - BA, 41480-225',
      image:
          'https://lh5.googleusercontent.com/p/AF1QipNVeMAnLpJGUsa3djWDgKyrNANaEFi6UKKYvg7o=w427-h240-k-no',
      latitude: -12.918393827427119,
      longitude: -38.36377772883607,
    ),
    Restaurant(
        name: 'Sorvetes Real do Solar Mussurunga',
        address:
            'R. Nelson Antonio Daiha, 1900 - Mussurunga I, Salvador - BA, 41490-550',
        image:
            'https://lh5.googleusercontent.com/p/AF1QipMx8Rbn5GGzoWVbNl6JDfmXMhPorCv8hcOpfAdf=w408-h306-k-no',
        latitude: -12.91722260892277,
        longitude: -38.36555871562198),
  ];
  List<Restaurant> get restaurants => _restaurants;
}
