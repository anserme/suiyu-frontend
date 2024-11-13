import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final expenseManageProvider = StateNotifierProvider<ExpenseManageNotifier, bool>((ref) {
  return ExpenseManageNotifier(false);
});

class ExpenseManageNotifier extends StateNotifier<bool> {
  ExpenseManageNotifier(super.state);

   // 默认语言

  void setExpenseManage(bool isAddManage) {
    state = isAddManage;
  }
}