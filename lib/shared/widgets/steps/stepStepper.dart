import 'package:flutter/material.dart';
import 'package:touki/models/travelStep.dart';
import 'package:intl/intl.dart';

class StepStepper extends StatefulWidget {
  final List<TravelStep> steps;

  StepStepper({Key key, this.steps}) : super(key: key);

  @override
  _StepStepperState createState() => _StepStepperState();
}

class _StepStepperState extends State<StepStepper> {
  int _currentStep = 0;
  bool _complete = false;

  DateFormat f = new DateFormat('dd MMM yyyy');

  List<Step> getSteps() {
    List<Step> stepsElmt = [];
    widget.steps.forEach((element) {
      stepsElmt.add(Step(
        state: StepState.indexed,
        title: new Text(element.city + ', ' + element.country),
        content: new Container(
            child: Text('From ' +
                f.format(element.startDate).toString() +
                ' to ' +
                f.format(element.endDate).toString())),
        isActive: _currentStep >= 0,
      ));
    });
    return stepsElmt;
  }

  void next() {
    _currentStep + 1 != widget.steps.length
        ? goTo(_currentStep + 1)
        : setState(() => _complete = true);
  }

  void cancel() {
    if (_currentStep > 0) {
      goTo(_currentStep - 1);
    }
  }

  void goTo(int step) {
    setState(() => _currentStep = step);
  }

  @override
  Widget build(BuildContext context) {
    return Stepper(
      physics: ClampingScrollPhysics(),
      type: StepperType.vertical,
      currentStep: _currentStep,
      steps: getSteps(),
      onStepContinue: next,
      onStepTapped: (step) => goTo(step),
      onStepCancel: cancel,
      controlsBuilder: (BuildContext context,
          {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
        return Row(
          children: <Widget>[
            TextButton(onPressed: onStepCancel, child: Text('Previous')),
            ElevatedButton(onPressed: onStepContinue, child: Text('Next')),
          ],
        );
      },
    );
  }
}
