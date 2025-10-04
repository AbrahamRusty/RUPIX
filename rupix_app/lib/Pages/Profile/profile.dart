import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rupix_app/Pages/Login/login.dart';
import 'package:rupix_app/Pages/WalletHomePage.dart';
import 'package:rupix_app/providers/business_provider.dart';
import 'package:rupix_app/Pages/Profile/edit_profile.dart';
import 'package:rupix_app/Pages/Profile/open_business.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  String profilePicture = 'assets/img/profile.jpg';
  String profileName = 'Name';
  String email = 'abc@gmail.com';
  String phone = '08123456789';
  String address = 'Surabaya';

  String accName = '';
  String country = '';
  String city = '';
  String companyType = '';

  void toPersonalDetails() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PersonalDetails(
          profileName: profileName,
          profilePicture: profilePicture,
          email: email,
          phone: phone,
          address: address,
        ),
      ),
    );

    if (result != null) {
      setState(() {
        profileName = result['profileName'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final accounts = context.watch<BusinessProvider>().accounts;
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("Profile"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => WalletHomePage()),
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              // decoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [Color(0xFF9D50BB), Color(0xFF6E48AA)],
              //   ),
              // ),
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(top: 120),
                  // ),
                  // SizedBox(height: 120),
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage(profilePicture),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    profileName,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Other Accounts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 3,
                    ),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return ListTile(
                        title: Text(account.title),
                        leading: Icon(account.lead),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          if (accounts[index] ==
                              accounts[accounts.length - 1]) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => OpenBusiness(
                                  accName: accName,
                                  country: country,
                                  city: city,
                                  companyType: companyType,
                                ),
                              ),
                            );
                          } // else {
                          // final updated_acc = Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (_) => EditBusiness(
                          //       account: account,
                          //       index: index,
                          //     ),
                          //   ),
                          // );

                          //   if (updated_acc != null) {
                          //     provider.updateAccount(index, updated_acc);
                          //   }
                          // }
                        },
                      );
                    },
                  ),
                  const Text(
                    "General",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 3,
                    ),
                  ),
                  ListView(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    children: [
                      ListTile(
                        title: const Text("Personal details"),
                        leading: const Icon(Icons.person_outline_rounded),
                        trailing: const Icon(Icons.chevron_right_rounded),
                        onTap: () {
                          toPersonalDetails();
                        },
                      ),
                      ListTile(
                        title: Text("Help"),
                        leading: Icon(Icons.question_mark_rounded),
                        trailing: Icon(Icons.chevron_right_rounded),
                      ),
                      ListTile(
                        title: Text(
                          "Log out",
                          style: TextStyle(color: Colors.red),
                        ),
                        leading: Icon(Icons.logout_rounded, color: Colors.red),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginPage(),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
