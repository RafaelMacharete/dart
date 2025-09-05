import 'dart:io';

class Account{
  String ownersName;
  double initialBalance;
  double? investment;

  Account({required this.ownersName, required this.initialBalance, this.investment});
}

class CurrentAccount extends Account{
  double? overdraftLimit;

  CurrentAccount({
    required String ownersName, 
    required double initialBalance, 
    double? investment, 
    this.overdraftLimit
  }) : super(ownersName: ownersName, initialBalance: initialBalance, investment: investment);
}

class SavingsAccount extends Account{
  double yieldRate;

  SavingsAccount({
    required String ownersName, 
    required double initialBalance, 
    double? investment, 
    required this.yieldRate
  }) : super(ownersName: ownersName, initialBalance: initialBalance, investment: investment);

  double updateBalance(){
    // Update the balance based on the yield rate
    initialBalance += initialBalance * yieldRate;
    return initialBalance;
  }
}

void main(){
  CurrentAccount currentAccount = CurrentAccount(ownersName: 'Leafar', initialBalance: 1500.0, overdraftLimit: 500.0);
  SavingsAccount savingsAccount = SavingsAccount(ownersName: 'Rafael', initialBalance: 2000.0, yieldRate: 0.05);

  print('Current Account Owner: ${currentAccount.ownersName}, Balance: \$${currentAccount.initialBalance}, Overdraft Limit: \$${currentAccount.overdraftLimit}');
  
  print('Savings Account Owner: ${savingsAccount.ownersName}, Initial Balance: \$${savingsAccount.initialBalance}');
  double updatedBalance = savingsAccount.updateBalance();
  print('Updated Savings Account Balance after applying yield rate of ${savingsAccount.yieldRate * 100}%: \$${updatedBalance}');
}