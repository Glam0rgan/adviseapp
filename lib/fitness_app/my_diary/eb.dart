import 'package:event_bus/event_bus.dart';

EventBus eventBus = EventBus();

class ScoreChangeEvent{
  int ?score;
  ScoreChangeEvent(int score){
    this.score=score;
  }
}

class SubjectChangeEvent{
  late String subject;
  SubjectChangeEvent(String subject){
    this.subject=subject;
  }
}