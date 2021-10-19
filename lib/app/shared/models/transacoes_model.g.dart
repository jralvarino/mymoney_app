// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transacoes_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransacoesModel _$TransacoesModelFromJson(Map<String, dynamic> json) {
  return TransacoesModel(
    json['description'] as String,
    json['id'] as int,
    TransacoesModel._numberToString(json['value'] as num),
    json['installments'] as String,
    json['paid'] as bool,
    _$enumDecode(_$TransactionTypeEnumMap, json['type']),
    DateTime.parse(json['dueDate'] as String),
    json['account'] as String,
    json['subCategory'] as String,
    json['responsible'] as String,
  );
}

Map<String, dynamic> _$TransacoesModelToJson(TransacoesModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'description': instance.description,
      'value': instance.value,
      'installments': instance.installments,
      'paid': instance.paid,
      'type': _$TransactionTypeEnumMap[instance.type],
      'dueDate': instance.dueDate.toIso8601String(),
      'account': instance.account,
      'subCategory': instance.subCategory,
      'responsible': instance.responsible,
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

const _$TransactionTypeEnumMap = {
  TransactionType.RECEITA: 'RECEITA',
  TransactionType.DESPESA: 'DESPESA',
};
