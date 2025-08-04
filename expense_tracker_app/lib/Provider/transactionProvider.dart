import 'package:flutter/material.dart';

class TransactionProvider extends ChangeNotifier {
  int _totalIncome = 0;
  int _totalExpense = 0;
  int _remainingBal = 0;
  List<Map<String, dynamic>> _mData = [];

  getallData() => _mData;
  getTotalIncome() => _totalIncome;
  getTotalExpense() => _totalExpense;
  getremainingBal() => _remainingBal;

  updateremainingBal() {
    _remainingBal = _totalIncome - _totalExpense;
  }

  addIncome(String title, int amnt) {
    _mData.add({'title': title, 'Amount': amnt, 'type': 'Income'});
    _totalIncome += amnt;
    updateremainingBal();
    notifyListeners();
  }

  addExpense(String title, int amnt) {
    _mData.add({'title': title, 'Amount': amnt, 'type': 'Expense'});
    _totalExpense += amnt;
    updateremainingBal();
    notifyListeners();
  }
}
