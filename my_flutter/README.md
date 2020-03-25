# my_flutter

希望可以坚持自己的原则,使用自己iOS的编码风格,而不是别dart的风格牵着走

没有找到fluttre命令:
command not found: flutter
执行下面句子试试
source $HOME/.bash_profile

获取Flutter的包
flutter packages get

字典转模型的注意事项:
Dart没有Swift中那样的Codable协议或者像Java中的反射
一般是通过json_serializable框架进行脚本化的编写
会生成与模型文件名.dart对应的模型文件名.g.dart文件
而且如果之前有生成过其他模型的.g.dart文件,build_runner可能会报错
需要找到更好的解决方案,大致思路知道了

State<StatefulWidget>的生命周期

'''
class XXXState extends State<XXX> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("initState");
    context.runtimeType;
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("didChangeDependencies");
  }
  
  @override
  void didUpdateWidget(MyApp oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("didUpdateWidget");
  }


  @override
  Widget build(BuildContext context) {
    print("build");
    return ...
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print("dispose");
  }

  @override
  void reassemble() {
    // TODO: implement reassemble
    super.reassemble();
    print("reassemble");
  }

}

'''
打Release模式下的包
flutter run --release

flutter build apk //构建Android Release包
flutter build ios //构建iOS Release包

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.dev/).
