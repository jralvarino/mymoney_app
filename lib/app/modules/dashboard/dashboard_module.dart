import 'package:flutter_modular/flutter_modular.dart';
import 'package:mymoney_app/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:mymoney_app/app/modules/dashboard/pages/dashboard_page.dart';
import 'package:mymoney_app/app/modules/dashboard/services/dashboard_service.dart';

class DashboardModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => DashboardService()),
        Bind(
          (i) => DashboardController(
            dashboardService: Modular.get<DashboardService>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(Modular.initialRoute, child: (_, args) => DashboardPage()),
      ];
}
