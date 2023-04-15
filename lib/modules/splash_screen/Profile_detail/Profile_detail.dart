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
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          const SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                Text("profil detail"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
