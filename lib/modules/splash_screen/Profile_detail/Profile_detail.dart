import 'package:flutter/material.dart';
import 'package:pertemuan_v/models/user.dart';

class profileDetail extends StatefulWidget {
  const profileDetail({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<profileDetail> createState() => _profileDetailState();
}

class _profileDetailState extends State<profileDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          "profile Detail screen",
        ),
      ),
    );
  }
}
