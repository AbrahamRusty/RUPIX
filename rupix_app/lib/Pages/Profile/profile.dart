
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
      backgroundColor: Colors.black,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 250.0,
            backgroundColor: Colors.black,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              title: Text(
                profileName,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          const Color.fromARGB(255, 65, 100, 252).withOpacity(0.8),
                          const Color(0xFFB86EFF).withOpacity(0.8),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 80,
                    left: 0,
                    right: 0,
                    child: Center(
                      child: CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 58,
                          backgroundImage: AssetImage(profilePicture),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            leading: IconButton(
              icon: const Icon(Icons.chevron_left_rounded, color: Colors.white),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const WalletHomePage()),
                );
              },
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 20),
                  _buildSectionTitle("Other Accounts"),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const ClampingScrollPhysics(),
                    itemCount: accounts.length,
                    itemBuilder: (context, index) {
                      final account = accounts[index];
                      return _buildProfileMenuItem(
                        icon: account.lead,
                        title: account.title,
                        onTap: () {
                          if (accounts[index] == accounts[accounts.length - 1]) {
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
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 30),
                  _buildSectionTitle("General"),
                  _buildProfileMenuItem(
                    icon: Icons.person_outline_rounded,
                    title: "Personal details",
                    onTap: toPersonalDetails,
                  ),
                  _buildProfileMenuItem(
                    icon: Icons.help_outline_rounded,
                    title: "Help",
                    onTap: () {},
                  ),
                  const SizedBox(height: 20),
                  _buildProfileMenuItem(
                    icon: Icons.logout_rounded,
                    title: "Log out",
                    isLogout: true,
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage()),
                        (route) => false,
                      );
                    },
                  ),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isLogout = false,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      decoration: BoxDecoration(
        color: Colors.grey[900]?.withOpacity(0.5),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.grey[800]!),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: isLogout ? Colors.redAccent : const Color(0xFFB86EFF),
                  size: 28,
                ),
                const SizedBox(width: 20),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                    color: isLogout ? Colors.redAccent : Colors.white,
                  ),
                ),
                const Spacer(),
                if (!isLogout)
                  const Icon(
                    Icons.chevron_right_rounded,
                    color: Colors.grey,
                    size: 28,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
