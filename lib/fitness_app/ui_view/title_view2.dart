import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/eb.dart';
import 'package:bruno/bruno.dart';
import 'package:best_flutter_ui_templates/fitness_app/models/subject_data.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/eb.dart';

class TitleView2 extends StatefulWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TitleView2(
      {Key? key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  State<TitleView2> createState() => _TitleView2State();
}

class _TitleView2State extends State<TitleView2> {
  String hintText = "数学";
  String selectsubject = "";
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: widget.animationController!,
      builder: (BuildContext context, Widget? child) {
        return FadeTransition(
          opacity: widget.animation!,
          child: new Transform(
            transform: new Matrix4.translationValues(
                0.0, 30 * (1.0 - widget.animation!.value), 0.0),
            child:GestureDetector(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.only(left: 24, right: 24),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: Text(
                          widget.titleTxt,
                          textAlign: TextAlign.left,
                          style: TextStyle(
                            fontFamily: FitnessAppTheme.fontName,
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            letterSpacing: 0.5,
                            color: FitnessAppTheme.lightText,
                          ),
                        ),
                      ),
                      InkWell(
                        highlightColor: Colors.transparent,
                        borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Row(
                            children: <Widget>[
                              Text(
                                widget.subTxt,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: FitnessAppTheme.fontName,
                                  fontWeight: FontWeight.normal,
                                  fontSize: 16,
                                  letterSpacing: 0.5,
                                  color: FitnessAppTheme.nearlyDarkBlue,
                                ),
                              ),
                              SizedBox(
                                height: 38,
                                width: 26,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: FitnessAppTheme.darkText,
                                  size: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              onTap: (){
                showDialog(
          context: context,
          builder: (_) => StatefulBuilder(
                builder: (context, state) {
                  return BrnSingleSelectDialog(
                      isClose: true,
                      title: '请选择专业',
                      conditions: SubjectData.subjectdata,
                      checkedItem: SubjectData.subjectdata[selectedIndex],
                      submitText: '确定',
                      isCustomFollowScroll: true,
                      onItemClick: (BuildContext context, int index) {
                        hintText = SubjectData.subjectdata[index];
                        selectedIndex = index;
                        state(() {});
                      },
                      onSubmitClick: (data) {
                        eventBus.fire(new SubjectChangeEvent(hintText));
                      });
                },
              ));
              },
            ),
          ),
        );
      },
    );
  }
}
