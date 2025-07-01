import 'dart:ui';

class HeaderItem {
  final String name;
  final VoidCallback ontap;
  final bool isbutton;
  HeaderItem({required this.name, required this.ontap, this.isbutton = false});
}
