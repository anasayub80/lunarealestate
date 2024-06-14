import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:lunarestate/Config/spacing_ext.dart';

// ignore: must_be_immutable
class ChoiceTile extends StatefulWidget {
  bool y;
  bool n;
  String title;
  String index;
  String box1;
  Color? bgColor;
  String box2;
  void Function(bool?)? onChange1;
  void Function(bool?)? onChange2;
  ChoiceTile({
    super.key,
    required this.y,
    required this.n,
    required this.index,
    this.bgColor,
    required this.title,
    required this.box1,
    required this.box2,
    required this.onChange1,
    required this.onChange2,
  });

  @override
  State<ChoiceTile> createState() => _ChoiceTileState();
}

class _ChoiceTileState extends State<ChoiceTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(3),
      color: widget.bgColor ?? Colors.black,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ListTile(
            title: Text("${widget.index}. ${widget.title}"),
            subtitle: Row(
              children: [
                Expanded(
                  child: CheckboxListTile(
                      title: AutoSizeText(
                        widget.box1,
                        maxLines: 1,
                        presetFontSizes: [14, 12, 10, 9],
                      ),
                      activeColor: Colors.amber,
                      value: widget.y,
                      contentPadding: EdgeInsets.symmetric(horizontal: 1),
                      onChanged: widget.onChange1),
                ),
                Expanded(
                  child: CheckboxListTile(
                      title: AutoSizeText(
                        widget.box2,
                        maxLines: 1,
                        presetFontSizes: [14, 12, 10, 9],
                      ),
                      value: widget.n,
                      activeColor: Colors.amber,
                      onChanged: widget.onChange2),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class ChoiceTileNew extends StatefulWidget {
  bool y;
  bool n;
  String title;
  String index;
  String box1;
  Color? bgColor;
  String box2;
  void Function(bool?)? onChange1;
  void Function(bool?)? onChange2;
  ChoiceTileNew({
    super.key,
    required this.y,
    required this.n,
    required this.index,
    this.bgColor,
    required this.title,
    required this.box1,
    required this.box2,
    required this.onChange1,
    required this.onChange2,
  });

  @override
  State<ChoiceTileNew> createState() => _ChoiceTileNewState();
}

class _ChoiceTileNewState extends State<ChoiceTileNew> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Color(0xFF22252A),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          width: 1,
          color: Color(0xFF494748),
        ),
      ),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AutoSizeText(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              maxLines: 2,
              presetFontSizes: [14, 12, 10, 9],
            ),
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: widget.y,
                      onChanged: widget.onChange1,
                      activeColor: Colors.amber,
                    ),
                    Text(
                      widget.box1,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: widget.n,
                      onChanged: widget.onChange2,
                      activeColor: Colors.amber,
                    ),
                    Text(
                      widget.box2,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
            ),
          ],
        ).addPadding(horizontal: 10),
      ),
    ).addPadding(vertical: 10);
  }
}
