import 'accountClass.dart';
import 'transactionClass.dart';
import 'dart:io';

void displayMenu() {
  print('Press 1 to enter account details');
  print('Press 2 to deposit');
  print('Press 3 to withdraw');
  print('Press 4 to show current balance');
  print('Press 5 to cancel last transaction');
  print('Press 6 to exit');
  print('//////////////////////////');
}
void main(List<String> args) {
  Account account = Account();
  int lastTransactionId = 0;
  double amount = 0.0;

  while (true) {
    displayMenu();
    print('enter your choice');
    String choice = stdin.readLineSync()!;
    if (choice == '1') {
      print('Enter name:');
      String name = stdin.readLineSync()!;
      print('Enter account number:');
      String accNumber = stdin.readLineSync()!;

      print('Enter balance:');
      String balance = stdin.readLineSync()!;

      account.OwnerName = name;
      account.accountNum = int.parse(accNumber);
      account.balance = int.parse(balance);
      print('Account details updated: ${account.balance}');
    } else if (choice == '2') {
      print('Enter deposit amount:');
      String depositAmount = stdin.readLineSync()!;
      deposite depositeMoney = deposite(double.parse(depositAmount));
      amount = double.parse(depositAmount);
      print(
          'Deposit successful. New balance: ${depositeMoney.execute(account)}');
    } else if (choice == '3') {
      print('Enter withDraw amount:');
      String withDrawAmount = stdin.readLineSync()!;
      if (int.parse(withDrawAmount) > account.balance) {
        print('balance out of range try again later');
      } else {
        withDraw withDrawMoney = withDraw(double.parse(withDrawAmount));
        amount = double.parse(withDrawAmount);
        print(
            'withDraw successful. New balance: ${withDrawMoney.execute(account)}');
      }
    } else if (choice == '4') {
      BalanceInquiry balance = BalanceInquiry();

      //balance.currencyType = 'euoro';
      //print(balance.execute(account));
      print("choose number of currency to display your balance in:  1.euoro 2.usd 3.eg");
      String currencyType = stdin.readLineSync()!;
      if (currencyType == '1') {
        balance.currencyType = 'euoro';
        print(
            'Current balance in ${balance.currencyType}: ${balance.execute(account)}');
      } else if (currencyType == '2') {
        balance.currencyType = 'dollar';
        print(
            'Current balance in ${balance.currencyType}: ${balance.execute(account)}');
      } else {
        print(
            'Current balance in ${balance.currencyType}: ${balance.execute(account)}');
      }
    } else if (choice == '5') {
      if (lastTransactionId == 2) {
        deposite depositeMoney = deposite(amount);
        print(
            'rollback deposit successful. New balance: ${depositeMoney.cancelTransaction(account)}');
      } else if (lastTransactionId == 3) {
        // If the last transaction was a withdraw (choice 3)
        withDraw withDrawMoney = withDraw(amount);
        print(
            'rollback withdraw trans successful. New balance: ${withDrawMoney.cancelTransaction(account)}');
      } else {
        print('No transaction to cancel.');
      }
    } else if (choice == '6') {
      print('Exiting...');
      break;
    } else {
      print('Invalid choice. Please enter a valid option.');
    }

    lastTransactionId = int.parse(choice);
    print('lastTransaction id $lastTransactionId');
    print('//////////////////////////');
  }
}
