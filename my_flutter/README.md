# my_flutter

A new flutter module project.
希望可以坚持自己的原则,使用自己iOS的编码风格,而不是别dart的风格牵着走.

```
command not found: flutter

// 执行下面句子试试
source $HOME/.bash_profile
```

获取Flutter的包
```
flutter packages get
```

State<StatefulWidget>的生命周期
```
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
```

## Getting Started

For help getting started with Flutter, view our online
[documentation](https://flutter.dev/).
