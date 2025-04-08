// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import 'package:lunarestate/Config/spacing_ext.dart';
import 'package:lunarestate/Pages/Survery/survey_questions.dart';

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
    return Column(
      children: [
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: AutoSizeText(
                  widget.title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                  maxLines: 2,
                  presetFontSizes: [14, 12, 10, 9],
                ),
              ),
              Row(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.box1,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Checkbox(
                        value: widget.y,
                        onChanged: widget.onChange1,
                        activeColor: Colors.amber,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        widget.box2,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                      Checkbox(
                        value: widget.n,
                        onChanged: widget.onChange2,
                        activeColor: Colors.amber,
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
        10.height,
        Divider(
          thickness: 0.5,
          color: Color(0xff424448),
        ),
      ],
    ).addPadding(vertical: 10);
  }
}

// ignore: must_be_immutable// ignore: must_be_immutable
class ChoiceTileNewV extends StatefulWidget {
  String title;
  List<SurveryAnswer> surveryAnswer;
  String index;
  Color? bgColor;
  void Function(SurveryAnswer)? onChange;

  ChoiceTileNewV({
    Key? key,
    required this.title,
    required this.surveryAnswer,
    required this.index,
    this.bgColor,
    required this.onChange,
  }) : super(key: key);

  @override
  State<ChoiceTileNewV> createState() => _ChoiceTileNewVState();
}

class _ChoiceTileNewVState extends State<ChoiceTileNewV> {
  // Variable to hold the currently selected answer index
  int? _selectedIndex;

  void _toggleCheckbox(int index) {
    setState(() {
      // Update the selected index
      _selectedIndex = index;

      // Call the onChange callback if provided with the selected answer
      if (widget.onChange != null) {
        widget.onChange!(widget.surveryAnswer[index]);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
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
            4.height,
            AutoSizeText(
              widget.title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
              maxLines: 2,
              presetFontSizes: [14, 12, 10, 9],
            ),
            Expanded(
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(widget.surveryAnswer.length, (index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        width: 100, // Set a fixed width for each option
                        padding: EdgeInsets.symmetric(
                            horizontal: 8), // Padding around each item

                        child: Center(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Checkbox(
                                value: _selectedIndex ==
                                    index, // Check if this index is selected
                                onChanged: (value) {
                                  _toggleCheckbox(index);
                                },
                                activeColor: Colors.amber,
                              ),
                              AutoSizeText(
                                widget.surveryAnswer[index].answer,
                                maxLines: 3,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ).addPadding(horizontal: 5),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          ],
        ).addPadding(horizontal: 10),
      ),
    ).addPadding(vertical: 10);
  }
}
