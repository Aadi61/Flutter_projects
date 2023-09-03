import "package:flutter/material.dart";

class Course{
  double grade=0;
  double credit=-1;
}

class dropdownButton extends StatefulWidget {
  final Course course;
  final Function(double) onCreditChanged;
  final Function(double) onGradeChanged;

  const dropdownButton({
    required this.course,
    required this.onCreditChanged,
    required this.onGradeChanged,
  });

  @override
  State<dropdownButton> createState() => _dropdownButtonState();
}

class _dropdownButtonState extends State<dropdownButton> {
    double _dropDownvalue=0, gradeVal=-1;
  void _OnChanged(double? value) {
    setState(() {
      _dropDownvalue=value!;
    });
  }
  void _GChanged(double? value) {
    setState(() {
      gradeVal=value!;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          DropdownButton(items: const [DropdownMenuItem<double>(child: Text("Select Credits"), value:0),DropdownMenuItem<double>( child: Text("1"), value:1),DropdownMenuItem<double>(child: Text("1.5"), value:1.5), DropdownMenuItem<double>(child: Text("2"),value: 2), DropdownMenuItem<double>( child: Text("3"), value:3), DropdownMenuItem<double>( child: Text("4"), value:4)],value: _dropDownvalue, onChanged: _OnChanged,),
          DropdownButton(items: const [DropdownMenuItem<double>(child: Text("Select Grade"), value:-1.0),DropdownMenuItem<double>(child: Text("S"), value:10),DropdownMenuItem<double>(child: Text("A"), value:9), DropdownMenuItem<double>(child: Text("B"),value: 8), DropdownMenuItem<double>(child: Text("C"),value: 7), DropdownMenuItem<double>(child: Text("D"),value: 6), DropdownMenuItem<double>(child: Text("E"),value: 5), DropdownMenuItem<double>(child: Text("F/N"),value: 0) ],value: gradeVal, onChanged: _GChanged,),
        
        
        ],
      ),
    );
  }
}