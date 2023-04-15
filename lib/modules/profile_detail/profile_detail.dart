import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pertemuan_v/models/user.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({
    super.key,
    required this.user,
  });
  final User user;

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool isVisibilityPassword = false;

  @override
  void initState() {
    if (widget.user.name != null) {
      _nameController.text = widget.user.name;
    }
    super.initState();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.blue.withAlpha(100),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Icon(
                      Icons.chevron_left_rounded,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "Profile Detail",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Container(
                    width: 200,
                    margin: EdgeInsets.symmetric(vertical: 20),
                    child: AspectRatio(
                      aspectRatio: 1 / 1,
                      child: Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(widget.user.profilePhoto),
                                fit: BoxFit.cover),
                            borderRadius:
                                BorderRadius.all(Radius.circular(100))),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _nameController,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Nama"),
                        hintText: "kelompok",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Nama wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !isVisibilityPassword,
                      decoration: InputDecoration(
                        isDense: true,
                        label: const Text("Password"),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isVisibilityPassword = !isVisibilityPassword;
                            });
                          },
                          icon: Icon(
                            isVisibilityPassword == false
                                ? Icons.visibility
                                : Icons.visibility_off_rounded,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == "" || value == null) {
                          return "Password wajib diisi";
                        }
                        return null;
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              if (_formKey.currentState!.validate()) {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.green,
                    content: Column(
                      children: [
                        Text(
                          "SUKSES",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Anda telah berhasil mengubah data diri anda",
                        )
                      ],
                    ),
                  ),
                );
              }
              ;
            },
            child: Container(
              margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
              padding: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.blue, borderRadius: BorderRadius.circular(16)),
              child: const Center(
                child: Text(
                  "SIMPAN",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
