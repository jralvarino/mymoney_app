// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$DashboardController on _DashboardControllerBase, Store {
  final _$dashboardAtom = Atom(name: '_DashboardControllerBase.dashboard');

  @override
  Observable<dynamic>? get dashboard {
    _$dashboardAtom.reportRead();
    return super.dashboard;
  }

  @override
  set dashboard(Observable<dynamic>? value) {
    _$dashboardAtom.reportWrite(value, super.dashboard, () {
      super.dashboard = value;
    });
  }

  final _$isLoadingAtom = Atom(name: '_DashboardControllerBase.isLoading');

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  final _$getLeadsAsyncAction =
      AsyncAction('_DashboardControllerBase.getLeads');

  @override
  Future<void> getLeads(int month) {
    return _$getLeadsAsyncAction.run(() => super.getLeads(month));
  }

  @override
  String toString() {
    return '''
dashboard: ${dashboard},
isLoading: ${isLoading}
    ''';
  }
}
