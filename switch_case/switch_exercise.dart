import 'dart:io';

void main(){
    print("Enter driver's name: ");
    String? driversName = stdin.readLineSync();
    print("Enter driver's speed (km/h): ");
    int? driversSpeed = int.parse(stdin.readLineSync()!);
    double penaltyValue;

    if (driversSpeed <= 60) {
        print('No infraction!');
        penaltyValue = 0;
    } else if(driversSpeed <= 80) {
        print('Minor infraction!');
        penaltyValue = 50.0;
    } else if(driversSpeed < 100){
        print('Medium infraction!');
        penaltyValue = 150.0;
    } else{
        print('Serious infraction!');
        penaltyValue = 200.0;
    }


    print("\n\nChoose the payment method: ");
    print("[1] - Pay in cash\n[2] - Pay in 2 installments (interest free)\n[3] - Pay in 3 installments (with 10% interest)");
    int? paymentMethod = int.parse(stdin.readLineSync()!);
    String eachInstallmentsValue;

    switch (paymentMethod) {
      case 1:
        print('The total value is: $penaltyValue');
        break;
      case 2:
        eachInstallmentsValue = (penaltyValue / 2).toStringAsFixed(2);
        print('The total value is: $penaltyValue and will be paid in 2x');
        print('Each installments value: $eachInstallmentsValue');
        break;
      case 3:
        eachInstallmentsValue = ((penaltyValue / 3) * 1.10).toStringAsFixed(2);
        print('The total value is: $penaltyValue and will be paid in 3x');
        print('Each installments value: $eachInstallmentsValue');
        break;
      default:
        print('Insert a valid value!');
    }
}