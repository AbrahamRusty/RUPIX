import 'package:flutter/material.dart';
import 'package:rupix_app/models/business_account.dart';

class BusinessProvider extends ChangeNotifier {
  final List<BusinessAcc> _accounts = [
    BusinessAcc(
      title: "Open another business account",
      lead: Icons.add_circle_outline_rounded,
  ),
  ];

  List<BusinessAcc> get accounts => _accounts;

  void addAccount(BusinessAcc account) {
    _accounts.insert(0, account);
    notifyListeners();
  }

  void updateAccount(int index, BusinessAcc updatedAcc) {
    _accounts[index] = updatedAcc;
    notifyListeners();
  }
}
