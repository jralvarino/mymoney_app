import 'package:json_annotation/json_annotation.dart';
import 'package:mymoney_app/app/shared/enums/transaction-type-enum.dart';
import 'package:mymoney_app/app/shared/utils/currency_mask.dart';

part 'transacoes_model.g.dart';

@JsonSerializable()
class TransacoesModel {
  final int id;
  final String description;
  @JsonKey(fromJson: _numberToString)
  final String value;
  final String installments;
  final bool paid;
  final TransactionType type;
  final DateTime dueDate;
  final String account;
  final String subCategory;
  final String responsible;

  TransacoesModel(
      this.description,
      this.id,
      this.value,
      this.installments,
      this.paid,
      this.type,
      this.dueDate,
      this.account,
      this.subCategory,
      this.responsible);

  factory TransacoesModel.fromJson(Map<String, dynamic> json) {
    return _$TransacoesModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$TransacoesModelToJson(this);

  static String _numberToString(num json) {
    return CurrencyInputFormatter.formatValue(json.toString());
  }

  bool isRecurrent() {
    return this.installments == "-";
  }
}
