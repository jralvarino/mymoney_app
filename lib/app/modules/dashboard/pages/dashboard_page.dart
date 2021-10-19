import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mymoney_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mymoney_app/app/modules/dashboard/widgets/transaction_widget.dart';
import 'package:mymoney_app/app/shared/enums/resume-type-enum.dart';
import 'package:mymoney_app/app/shared/themes/fonts.dart';
import 'package:mymoney_app/app/shared/widgets/dashboard_value_card_widget.dart';
import 'package:mymoney_app/app/shared/widgets/month_picker_widget.dart';

class DashboardPage extends StatefulWidget {
  final String title;

  DashboardPage({this.title = 'Flutter Base App'});

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState
    extends ModularState<DashboardPage, DashboardController> {
  int selectedIndex =
      1; //to handle which item is currently selected in the bottom app bar

  @override
  void initState() {
    super.initState();
    controller.getLeads(7);
    selectedIndex = 1;
  }

  void updateTabSelection(int index, String buttonText) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        if (controller.isLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
        return Scaffold(
          appBar: AppBar(
            // leading: Text("Saldo: R\$ 12.349,00"),
            // leadingWidth: 200,
            brightness: Brightness.light,
            elevation: 2,
            toolbarHeight: 80,
            centerTitle: true,
            title: Column(
              children: [
                Text(
                  "Saldo da conta",
                  style: TextStyle(
                    fontSize: 12,
                    // fontWeight: FontWeight.bold,
                    fontFamily: Fonts.nunitoBold,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0),
                  child: Text(
                    "R\$ 9.256,00",
                    style: TextStyle(
                      fontSize: 25,
                      letterSpacing: 0.25,
                      fontWeight: FontWeight.bold,
                      fontFamily: Fonts.nunitoExtraBold,
                    ),
                  ),
                ),
              ],
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(bottom: 50),
                child: IconButton(
                  icon: Icon(
                    Icons.filter_alt_outlined,
                    //darken the icon if it is selected or else give it a different color
                    // color: selectedIndex == 1 ? Colors.blue : Colors.grey.shade400,
                  ),
                  // onPressed: () => controller.openHelpDialog(context),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent, onPressed: () {},
                ),
              ),
            ],
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          floatingActionButton:
              FloatingActionButton(child: Icon(Icons.add), onPressed: () {}),
          bottomNavigationBar: BottomAppBar(
            shape: CircularNotchedRectangle(),

            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  InkWell(
                    onTap: () {
                      updateTabSelection(1, "Home");
                    },
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.home,
                          //darken the icon if it is selected or else give it a different color
                          color: selectedIndex == 1
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            color: selectedIndex == 1
                                ? Colors.blue
                                : Colors.grey.shade400,
                            fontFamily: Fonts.nunitoRegular,
                          ),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.receipt_long,
                          color: selectedIndex == 0
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        Text("Transações",
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                              fontFamily: Fonts.nunitoRegular,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50.0,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.settings,
                          color: selectedIndex == 0
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        Text("Settings",
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                              fontFamily: Fonts.nunitoRegular,
                            )),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Icon(
                          Icons.more_horiz,
                          color: selectedIndex == 0
                              ? Colors.blue
                              : Colors.grey.shade400,
                        ),
                        Text("Mais",
                            style: TextStyle(
                              color: selectedIndex == 0
                                  ? Colors.blue
                                  : Colors.grey.shade400,
                              fontFamily: Fonts.nunitoRegular,
                            )),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // color: Colors.blueGrey,
          ),
          body: RefreshIndicator(
            onRefresh: () {
              return controller.getLeads(7);
            },
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DashboardValueCardWidget(
                        value: controller.dashboard?.value.valorReceitas,
                        type: ResumeType.RECEITAS,
                      ),
                      DashboardValueCardWidget(
                          value: controller.dashboard?.value.valorDespesas,
                          type: ResumeType.DESPESAS),
                      DashboardValueCardWidget(
                          value: controller.dashboard?.value.valorBalanco,
                          type: ResumeType.BALANCE),
                      DashboardValueCardWidget(
                          value: controller.dashboard?.value.valorBalanco,
                          type: ResumeType.SALDO),
                    ],
                  ),
                  MonthPickerWidget(
                    onRefresh: controller.getLeads,
                  ),
                  /*  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 13, left: 3),
                    child: Text(
                      "Receitas/Despesas",
                      style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.normal, letterSpacing: 0.5),
                    ),
                  ),*/
                  Divider(
                    height: 2.0,
                    color: Colors.grey,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemBuilder: (context, position) {
                        return TransactionWidget(
                            transaction: controller
                                .dashboard?.value.transacoes[position]);
                      },
                      itemCount: controller.dashboard?.value.transacoes.length,
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
