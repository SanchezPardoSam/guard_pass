import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class SocialMediaContainer extends StatefulWidget {
  const SocialMediaContainer({super.key});

  @override
  State<SocialMediaContainer> createState() => _SocialMediaContainerState();
}

class _SocialMediaContainerState extends State<SocialMediaContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 20,),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(
            child: InkWell(
              onTap: () {},
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Ionicons.logo_google,
                  size: 50,
                  color: Color(0xFFFF0000),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ClipOval(
            child: InkWell(
              onTap: () {},
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Ionicons.logo_facebook,
                  size: 50,
                  color: Color(0XFF0E58DF),
                ),
              ),
            ),
          ),
          const SizedBox(width: 20,),
          ClipOval(
            child: InkWell(
              onTap: () {},
              child: const SizedBox(
                width: 56,
                height: 56,
                child: Icon(
                  Ionicons.logo_twitter,
                  size: 50,
                  color: Color(0xFF699BF7),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
