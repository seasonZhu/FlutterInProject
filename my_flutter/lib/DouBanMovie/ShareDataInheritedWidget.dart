import 'package:flutter/material.dart';

class ShareDataInheritedWidget extends InheritedWidget {
  final String currentCity ;

  ShareDataInheritedWidget(this.currentCity,{Widget child}):super(child:child);

  //定义一个便捷方法，方便子树中的 Widget 获取 ShareDataInheritedWidget 实例
  static ShareDataInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType(aspect:ShareDataInheritedWidget);
  }

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) {
    /* 
    updateShouldNotify() 方法是，当全局数据发生变化，InheritedWidget 发生重建，
    判断需不需要通知依赖 InheritedWidget数据的子 Widget，返回 true 是通知，返回 false 是不通知
     */
    return (oldWidget as ShareDataInheritedWidget).currentCity != currentCity;
  }

}