import 'package:flutter/material.dart';
import 'package:mymoney_app/app/shared/enums/resume-type-enum.dart';
import 'package:mymoney_app/app/shared/themes/fonts.dart';

class DashboardValueCardWidget extends StatelessWidget {
  final String value;
  final ResumeType type;
  late String description;
  late Color color;
  late IconData icon;

  DashboardValueCardWidget({
    required this.value,
    required this.type,
  }) {
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        elevation: 2,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
        child: Container(
          padding: EdgeInsets.all(7),
          constraints: BoxConstraints(minWidth: 94, maxWidth: 94),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                description,
                style: TextStyle(
                  fontSize: 12,
                  letterSpacing: 0.15,
                  fontWeight: FontWeight.normal,
                  fontFamily: Fonts.nunitoRegular,
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: Icon(
                    icon,
                    size: 30,
                    color: color,
                  ),
                ),
              ),
              Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 0),
                  child: Text(
                    value,
                    style: TextStyle(
                      fontSize: 11,
                      letterSpacing: 0.15,
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.nunitoBold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  init() {
    switch (type) {
      case ResumeType.RECEITAS:
        description = "Receitas";
        color = Colors.blue;
        icon = Icons.attach_money;
        break;
      case ResumeType.DESPESAS:
        description = "Despesas";
        color = Colors.red;
        icon = Icons.money_off;
        break;
      case ResumeType.BALANCE:
        description = "Balanço";
        color = Colors.green;
        icon = Icons.account_balance_wallet;
        break;
      case ResumeType.SALDO:
        description = "Investimento";
        color = Colors.orange;
        icon = Icons.savings;
        break;
    }
  }
}
