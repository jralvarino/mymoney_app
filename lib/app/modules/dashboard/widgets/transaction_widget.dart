import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mymoney_app/app/shared/enums/transaction-type-enum.dart';
import 'package:mymoney_app/app/shared/models/transacoes_model.dart';
import 'package:mymoney_app/app/shared/themes/fonts.dart';
import 'package:mymoney_app/app/shared/utils/app_colors.dart';
import 'package:mymoney_app/app/shared/utils/date.dart';

class TransactionWidget extends StatelessWidget {
  final TransacoesModel transaction;

  const TransactionWidget({
    required this.transaction,
  });

  @override
  Widget build(BuildContext context) {
    return Slidable(
      secondaryActions: [
        IconSlideAction(
            icon: Icons.clear,
            color: Colors.red,
            caption: 'Cancel',
            closeOnTap: false, //list will not close on tap
            onTap: () {
              print("More ${transaction.description} is Clicked");
            })
      ],
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(
                    bottom: 8.0, top: 8.0, left: 2, right: 3),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.check_circle,
                        size: 35.0,
                        color: transaction.paid
                            ? Colors.green
                            : AppColors.lightGray,
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    constraints: BoxConstraints(maxWidth: 255),
                    padding: EdgeInsets.only(top: 7, bottom: 4),
                    child: AutoSizeText(
                      transaction.description,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: Fonts.nunitoExtraBold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.category,
                          size: 10.0,
                          color: AppColors.lightGray,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            transaction.subCategory,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontFamily: Fonts.nunitoRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2),
                    child: Row(
                      children: [
                        Icon(
                          Icons.credit_card,
                          size: 10.0,
                          color: AppColors.lightGray,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            transaction.account,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontFamily: Fonts.nunitoRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Row(
                      children: [
                        Icon(
                          Icons.today,
                          size: 10.0,
                          color: AppColors.lightGray,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 2),
                          child: Text(
                            Date.parseDateWithoutTime(transaction.dueDate),
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Colors.grey,
                              fontFamily: Fonts.nunitoRegular,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Spacer(),
              Container(
                constraints: BoxConstraints(minWidth: 81, maxWidth: 81),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.bottomRight,
                      padding: EdgeInsets.only(right: 4),
                      child: Text(
                        transaction.value,
                        style: TextStyle(
                          fontSize: 13.0,
                          // fontWeight: FontWeight.normal,
                          color: transaction.type == TransactionType.RECEITA
                              ? Colors.blue
                              : Colors.red,
                          fontFamily: Fonts.nunitoExtraBold,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 10, right: 4),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Icon(
                            transaction.isRecurrent()
                                ? Icons.all_inclusive
                                : Icons.repeat,
                            size: transaction.isRecurrent() ? 15 : 10,
                            color: AppColors.lightGray,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: Text(
                              transaction.isRecurrent()
                                  ? ""
                                  : transaction.installments,
                              style: TextStyle(
                                fontSize: 12.0,
                                color: Colors.grey,
                                letterSpacing: 1.2,
                                fontFamily: Fonts.nunitoRegular,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Divider(
            height: 2.0,
            color: Colors.grey,
          )
        ],
      ),
      actionPane: SlidableDrawerActionPane(),
    );
  }
}
