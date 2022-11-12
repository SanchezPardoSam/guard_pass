// ignore: file_names
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

// ignore: camel_case_types
enum LogoIcons {
  google(Icon(Ionicons.logo_google)),
  facebook(Icon(Ionicons.logo_facebook)),
  twitter(Icon(Ionicons.logo_twitter)),
  instagram(Icon(Ionicons.logo_instagram)),
  discord(Icon(Ionicons.logo_discord)),
  linkedin(Icon(Ionicons.logo_linkedin));

  final Icon icono;
  const LogoIcons(this.icono);
}
