# Animatable<T>
Flutter 1.26.0-1.0.pre ,Dart 2.12.0 (build 2.12.0-141.0.dev)<br>
简述：Animatable是一个抽象类，在给定的Animation<double>作为输入时，Animatable可以产生一个类型为T的值。
通常情况下，Animation的值在[0.0,1.0]之间，原则上，任何值都可以提供的。Animatable是Tween的父类。

|抽象函数|释义|
|---|---|
|animate(Animation<double> parent) → Animation<T>|把传入的Animation<double>处理后，返回一个新的Animation<double>|
|chain(Animatable<double> parent) → Animatable<T>|把传入的Animatable<double>处理后，返回一个新的Animatable<double>|
|evaluate(Animation<double> animation) → T|返回传入Animation<double>的当前值|
|transform(double t) → T|返回在t点的值|