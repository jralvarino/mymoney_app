import 'package:json_annotation/json_annotation.dart';
import 'package:mymoney_app/app/shared/models/transacoes_model.dart';
import 'package:mymoney_app/app/shared/utils/currency_mask.dart';

part 'dashboard_model.g.dart';

@JsonSerializable(explicitToJson: true, anyMap: true)
class DashboardModel {
  @JsonKey(fromJson: _numberToString)
  String valorReceitas;

  @JsonKey(fromJson: _numberToString)
  String valorDespesas;

  @JsonKey(fromJson: _numberToString)
  String valorBalanco;

  @JsonKey(fromJson: _numberToString)
  String valorSaldo;

  List<TransacoesModel>? transacoes;

  DashboardModel(this.valorReceitas, this.valorDespesas, this.valorBalanco,
      this.valorSaldo, this.transacoes);

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return _$DashboardModelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$DashboardModelToJson(this);

  static String _numberToString(num json) {
    return CurrencyInputFormatter.formatValue(json.toString());
  }
}
