import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rupix_app/providers/business_provider.dart';
import 'package:rupix_app/Pages/Profile/profile.dart';
import 'package:rupix_app/models/business_account.dart';

class OpenBusiness extends StatefulWidget {
  final String? accName;
  final String? country;
  final String? city;
  final String? companyType;

  final BusinessAcc? account;
  final int? index;

  const OpenBusiness({
    super.key,
    this.accName,
    this.country,
    this.city,
    this.companyType,
    this.account,
    this.index,
  });

  @override
  State<OpenBusiness> createState() => _OpenBusinessState();
}

class _OpenBusinessState extends State<OpenBusiness> {
  late TextEditingController accNameController;
  late TextEditingController countryController;
  late TextEditingController cityController;
  late TextEditingController companyController;

  @override
  void initState() {
    super.initState();
    accNameController = TextEditingController(text: widget.accName);
    countryController = TextEditingController(text: widget.country);
    cityController = TextEditingController(text: widget.city);
    companyController = TextEditingController(text: widget.companyType);
  }

  void saveChanges() {
    final save = {
      'accName': accNameController.text,
      'country': countryController.text,
      'city': cityController.text,
      'companyType': companyController.text,
    };
    Navigator.pop(context, save);

    final newAcc = BusinessAcc(
      title: accNameController.text, 
      lead: Icons.business_center_outlined,
    );

    context.read<BusinessProvider>().addAccount(newAcc);

    // BusinessAcc new_acc = BusinessAcc(title: accNameController.text, lead: Icons.business_center_outlined);    
    // addToList(new_acc);
  }

  // void addToList(new_acc) {
  //   setState(() {
  //     businessAcc.insert(0, new_acc);      
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.black,
        title: const Text("Create Account"),
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
              controller: accNameController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.business_center_outlined),
                hintText: 'Account name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: countryController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.map_outlined),
                hintText: 'Country',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: cityController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.location_on_outlined),
                hintText: 'City',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24),
                ),
              ),
            ),
            const SizedBox(height: 22),
            TextField(
              controller: companyController,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.business_rounded),
                hintText: 'Company type',
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
