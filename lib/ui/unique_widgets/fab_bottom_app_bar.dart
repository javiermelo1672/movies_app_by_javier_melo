import 'package:flutter/material.dart';

class FABBottomAppBarItem {
  FABBottomAppBarItem(
      {required this.text,
      required this.icon,
      required this.onButtonSelected,
      required this.isSelected});
  IconData icon;
  Function(int) onButtonSelected;
  bool isSelected;
  String? text;
}

class FABBottomAppBar extends StatefulWidget {
  FABBottomAppBar({
    Key? key,
    this.items,
    this.centerItemText,
    this.height = 60.0,
    this.iconSize = 35.0,
    this.backgroundColor,
    this.color,
    this.selectedColor,
    this.notchedShape,
    this.onTabSelected,
  }) : super(key: key) {
    assert(items!.length == 2 || items!.length == 4);
  }
  final List<FABBottomAppBarItem>? items;
  final String? centerItemText;
  final double? height;
  final double? iconSize;
  final Color? backgroundColor;
  final Color? color;
  final Color? selectedColor;
  final NotchedShape? notchedShape;
  final ValueChanged<int>? onTabSelected;

  @override
  State<StatefulWidget> createState() => FABBottomAppBarState();
}

class FABBottomAppBarState extends State<FABBottomAppBar> {
  @override
  Widget build(BuildContext context) {
    List<Widget> items = List.generate(widget.items!.length, (int index) {
      return _buildTabItem(
        item: widget.items![index],
        index: index,
      );
    });

    return BottomAppBar(
      shape: widget.notchedShape,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items,
      ),
      color: widget.backgroundColor,
    );
  }

  Widget _buildTabItem({FABBottomAppBarItem? item, int? index}) {
    Color? color = item!.isSelected ? widget.selectedColor : widget.color;
    return Expanded(
      child: SizedBox(
        height: widget.height,
        child: Material(
          type: MaterialType.transparency,
          child: InkWell(
            onTap: () {
              item.onButtonSelected(index!);
            },
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                    padding: const EdgeInsets.all(0),
                    width: 40,
                    height: 35,
                    child: IconButton(
                        icon: Icon(
                          item.icon,
                          color: color,
                          size: 25,
                        ),
                        onPressed: null,
                        color: color)),
                item.isSelected
                    ? Center(
                        child: Text(
                          item.text ?? "",
                          style: TextStyle(color: color, fontSize: 12),
                        ),
                      )
                    : const SizedBox(
                        height: 15,
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
