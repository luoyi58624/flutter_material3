import 'package:flutter/material.dart';

/// mowork接口响应模型
class MoworkResponseModel<T> {
  late String rcode; // 响应状态码，0为成功，注意：所有非0的状态码都将进入catch
  late String msg; // 响应的消息
  T? data; // 响应的数据

  static MoworkResponseModel<T> fromJson<T>(dynamic json) =>
      MoworkResponseModel()
        ..rcode = json['rcode'] as String
        ..msg = json['msg'] as String
        ..data = json['data'] as T?;
}

/// 导航模型
class NavModel {
  const NavModel(this.title, this.icon, this.page);

  final String title;
  final IconData icon;
  final Widget page;
}

/// 包含label-value结构的简单数据模型
class LabelModel {
  final String label;
  final String value;

  const LabelModel(this.label, this.value);
}
