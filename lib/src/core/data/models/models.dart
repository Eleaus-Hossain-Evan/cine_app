import 'package:flutter/material.dart';

class Movie {
  final String name;
  final String image;
  final String screenPreview;
  final String description;
  final String type;
  final int hours;
  final String director;
  final int stars;
  final List<String> actors;
  final List<MovieDate> dates;
  final List<List<Seat>> seats;
  Movie({
    required this.name,
    required this.image,
    required this.screenPreview,
    required this.description,
    required this.type,
    required this.hours,
    required this.director,
    required this.stars,
    required this.actors,
    required this.dates,
    required this.seats,
  });
}

class MovieDate {
  final int day;
  final String month;
  final String hour;
  MovieDate({
    required this.day,
    required this.month,
    required this.hour,
  });
}

class Seat {
  final bool isHidden;
  final bool isOccupied;
  bool isSelected;
  Seat({
    required this.isHidden,
    required this.isOccupied,
    this.isSelected = false,
  });
}

class SeatType {
  final String name;
  final Color color;
  SeatType({
    required this.name,
    required this.color,
  });
}
