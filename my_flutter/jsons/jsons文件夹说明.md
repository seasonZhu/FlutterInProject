
# 本文件夹一定要创建在根目录下,保存样例json,便于json_model脚本一键转模型

然后运行下面的命令:
flutter packages pub run json_model

doubanDetails这个文件中使用了key-value的映射
原始数据的key为"1"(String类型), value为0(int)
如果直接使用json_model跑脚本会出问题
这里使用了下面的方式
"@JsonKey(name: '1') int": "one"
name: "1"映射为"one"字符串,其对应的是int类型,这样看就清晰多了吧

另外,Dart的json转模型真的是很辛苦的,因为它只能分析单层Map,如果有嵌套只能将json一层层拆分,再来做解析