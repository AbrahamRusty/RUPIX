import 'package:flutter/material.dart';
import 'package:rupix_app/Pages/Profile/profile.dart';

class PersonalDetails extends StatefulWidget {
  final String profileName;
  final String email;
  final String phone;
  final String address;
  final String profilePicture;

  const PersonalDetails({
    super.key,
    required this.profileName,
    required this.email,
    required this.phone,
    required this.address,
    required this.profilePicture,
  });

  @override
  State<PersonalDetails> createState() => _PersonalDetailsState();
}

class _PersonalDetailsState extends State<PersonalDetails> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController phoneController;
  late TextEditingController addressController;
  // TextEditingController pictureController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.profileName);
    emailController = TextEditingController(text: widget.email);
    phoneController = TextEditingController(text: widget.phone);
    addressController = TextEditingController(text: widget.address);
    // pictureController = 
  }

  void saveChanges() {
    final save = {
      'profileName': nameController.text,
      'email': emailController.text,
      'phone': phoneController.text,
      'address': addressController.text,
    };
    Navigator.pop(context, save);
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("Personal Details"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left_rounded),
          onPressed: () {
            Navigator.push(
              context, 
              MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
      ),  
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Personal',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w300,
                height: 2,
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.person_outline_rounded),
                hintText: 'Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined),
                hintText: 'Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.phone_outlined),
                hintText: 'Phone Number',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: addressController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.map_outlined),
                hintText: 'Address',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 32),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: saveChanges, 
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Save'),
                  ),
                ),
              ],
            )
          ],
        ),)
    );
  }
}
