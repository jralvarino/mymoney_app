import 'package:mobx/mobx.dart';
import 'package:mymoney_app/app/modules/dashboard/services/dashboard_service.dart';

part 'dashboard_controller.g.dart';

class DashboardController = _DashboardControllerBase with _$DashboardController;

abstract class _DashboardControllerBase with Store {
  final DashboardService dashboardService;

  _DashboardControllerBase({required this.dashboardService});

  @observable
  Observable? dashboard;

  @observable
  bool isLoading = true;

  @action
  Future<void> getLeads(int month) async {
    var result = await dashboardService.getAllByMonth(month);
    this.dashboard = Observable(result);
    isLoading = false;
  }
}
