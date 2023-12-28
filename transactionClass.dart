import 'accountClass.dart';
import 'rollBackInterfaceClass.dart';

abstract class Transaction {
  int transactionId = 0;
  double execute(Account account);
}

class BalanceInquiry extends Transaction {
  String currencyType = '';

  BalanceInquiry({this.currencyType = 'eg'});

  double currencyConverter(String currencyType) {
    if (currencyType == 'dollar') {
      return 0.064;
    } else if (currencyType == 'euoro') {
      return 0.029207164;
    } else
      return 1.0;
  }

  @override
  double execute(Account account) {
    return account.balance * currencyConverter(currencyType);
  }
}

class withDraw extends Transaction implements RollBack {
  double amount = 0.0;

  withDraw(this.amount);

  @override
  double execute(Account account) {
    account.balance = account.balance - (this.amount).toInt();
    return (account.balance + 0.0);
  }

  @override
  double cancelTransaction(Account account) {
   account.balance = account.balance + (this.amount).toInt();
    return (account.balance + 0.0);
  }
}

class deposite extends Transaction implements RollBack {
  double amount = 0.0;

  deposite(this.amount);

  @override
  double execute(Account account) {
    account.balance = account.balance + this.amount.toInt();
    return (account.balance + 0.0);
  }

  @override
  double cancelTransaction(Account account) {
    account.balance = account.balance - (this.amount).toInt();
    return (account.balance + 0.0);
  }
}

/*void main(List<String> args) {
  Account account = Account();
  account.balance = 100;

  BalanceInquiry balance = BalanceInquiry();
  //balance.currencyType = 'euoro';
  //print(balance.execute(account));

  withDraw withdrawMoney = withDraw(10);
  //print(withdrawMoney.execute(account));
  //print(withdrawMoney.cancelTransaction(account));

  deposite depositeMoney = deposite(10);
  print('before adding money');
  print(account.balance);
  print(depositeMoney.execute(account));
  print('after adding money');
  print(account.balance);
  print(depositeMoney.cancelTransaction(account));
  print('after cancel trans');
  print(account.balance);
}*/
