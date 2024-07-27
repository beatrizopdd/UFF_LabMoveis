import 'package:flutter/material.dart';
import 'view/feed.dart';
import 'view/profile.dart';

void main() {
  runApp(
    MaterialApp(
      title: "Lista de Pacientes",
      home: const Feed(),
      routes: {
        "/profile": (context) => const Profile(),
      },
    )
  );
}