import 'package:flutter/material.dart';

class LifeGroupsModel {
  String name;
  String location;
  String phone;
  IconData icon;
  LifeGroupsModel({
    required this.name,
    required this.location,
    required this.phone,
    required this.icon,
  });
}

List<LifeGroupsModel> lifeGroups = [
  LifeGroupsModel(
    name: "Tranformation",
    location: "Bunga",
    phone: "+256774805301",
    icon: Icons.album_outlined,
  ),
  LifeGroupsModel(
    name: "Big House",
    location: "Monyonyo",
    phone: "+256774805301",
    icon: Icons.ac_unit_rounded,
  ),
  LifeGroupsModel(
    name: "Money Matters",
    location: "Kasango",
    phone: "+256774805301",
    icon: Icons.monetization_on_rounded,
  ),
];
