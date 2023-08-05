import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:untitled6/api/api_auth_controller.dart';
import 'package:untitled6/api/users_api_controller.dart';
import 'package:untitled6/models/api_response.dart';
import 'package:untitled6/models/user.dart';
import 'package:untitled6/prefe/shared_pref_controller.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Users',
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.bold,
            fontSize: 19,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () async => await _logout(context),
            icon: Icon(Icons.logout),
          ),
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/images_screen'),
            icon: Icon(Icons.image_outlined),
          ),
        ],
      ),
      body: FutureBuilder<List<User>>(
        future: UsersApiController().getUsers(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 40,
                    backgroundImage: NetworkImage(snapshot.data![index].image),
                  ),
                  title: Text(snapshot.data![index].firstName),
                  subtitle: Text(snapshot.data![index].email),
                );
              },
            );
          } else {
            return Center(
              child: Text(
                'NO DATA',
                style: GoogleFonts.poppins(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  Future<void> _logout(BuildContext context) async {
    ApiResponse apiResponse = await ApiAuthController().logout();
    if (apiResponse.success) {
      SharedPrefController().clear();
      Navigator.pushReplacementNamed(context, '/login_screen');
    }
  }
}
