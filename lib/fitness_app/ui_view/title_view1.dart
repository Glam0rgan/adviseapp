import 'package:best_flutter_ui_templates/fitness_app/fitness_app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:best_flutter_ui_templates/fitness_app/my_diary/eb.dart';
class TitleView1 extends StatefulWidget {
  final String titleTxt;
  final String subTxt;
  final AnimationController? animationController;
  final Animation<double>? animation;

  const TitleView1(
      {Key? key,
      this.titleTxt: "",
      this.subTxt: "",
      this.animationController,
      this.animation})
      : super(key: key);

  @override
  State<TitleView1> createState() => _TitleView1State();
}

class _TitleView1State extends State<TitleView1> {
  int fscore=0;
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
                    builder: (context) {
                      return AlertDialog(
                        title: Text('请输入分数'),
                        backgroundColor: Color(0xFFEDF0F2),
                        content: Container(
                          height: 100,
                          child: Column(
                            children: <Widget>[
                              TextField(
                                decoration: InputDecoration(
                                    filled: true,
                                    fillColor: Colors.grey.shade50),
                                onChanged: (myscore) {
                                  fscore = int.parse(myscore);
                                },
                              ),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: Text(
                                    '取消',
                                    style: TextStyle(color: Colors.grey),
                                    ),
                            onPressed: () {
                              Navigator.pop(context, "取消");
                            }),
                          TextButton(
                            child: Text(
                                    '确定',
                                    style: TextStyle(color: Colors.blue),
                                    ),
                            onPressed: () {
                              eventBus.fire(new ScoreChangeEvent(fscore));
                              Navigator.pop(context, "确定");
                            },
                          ),
                          ],
                      );
                    });
              },
            ),
          ),
        );
      },
    );
  }
}
