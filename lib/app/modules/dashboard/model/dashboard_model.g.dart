// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dashboard_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DashboardModel _$DashboardModelFromJson(Map json) {
  return DashboardModel(
    DashboardModel._numberToString(json['valorReceitas'] as num),
    DashboardModel._numberToString(json['valorDespesas'] as num),
    DashboardModel._numberToString(json['valorBalanco'] as num),
    DashboardModel._numberToString(json['valorSaldo'] as num),
    (json['transacoes'] as List<dynamic>?)
        ?.map((e) =>
            TransacoesModel.fromJson(Map<String, dynamic>.from(e as Map)))
        .toList(),
  );
}

Map<String, dynamic> _$DashboardModelToJson(DashboardModel instance) =>
    <String, dynamic>{
      'valorReceitas': instance.valorReceitas,
      'valorDespesas': instance.valorDespesas,
      'valorBalanco': instance.valorBalanco,
      'valorSaldo': instance.valorSaldo,
      'transacoes': instance.transacoes?.map((e) => e.toJson()).toList(),
    };
