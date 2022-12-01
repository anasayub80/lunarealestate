import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

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
