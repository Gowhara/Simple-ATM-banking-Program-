class Account {
  int accountNum = 0, balance = 0;
  String OwnerName = '';

  Account._instance();

  static Account? _account;
  factory Account() {
    if (_account == null) {
      _account = Account._instance();
    }
    return _account!;
  }
}

/*void main(List<String> args) {
  Account acccount = Account();
  acccount.OwnerName = 'salma';
  acccount.accountNum = 10101010;
  acccount.balance = 1000;

  print(acccount.OwnerName);
  //Account acc2 = Account();
  //print(acc2.OwnerName);
}*/
