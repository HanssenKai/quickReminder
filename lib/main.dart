import 'package:flutter/material.dart'; 
import 'dart:async';
void main() => runApp(MyApp()); 

class MyApp extends StatelessWidget { 
	 // This widget is the root of your application.    
	 @override 
	 Widget build(BuildContext context) {
			return MaterialApp(
				 title: 'Hello World Demo Application', 
				 theme: ThemeData( primarySwatch: Colors.blue,), 
				 home: MyHomePage(title: 'Home page'), 
			); 
	 }
}
class MyHomePage extends StatelessWidget {
	MyHomePage({Key key, this.title}) : super(key: key); 
	final String title; 
	 
	 // user defined function 
	void _showDialog(BuildContext context) { 
		// flutter defined function 
		showDialog( 
			 context: context, builder: (BuildContext context) { 
					// return object of type Dialog 
					return AlertDialog(
						 title: new Text("Message"), 
						 content: new Text("Hello World"),   
						 actions: <Widget>[
								new FlatButton(
									 child: new Text("Close"), 
									 onPressed: () {   
											Navigator.of(context).pop();  
									 }, 
								), 
						 ],
					);
			 },
		);
	}

 Future<DateTime> _showDatePicker(BuildContext context) async {
		DateTime _date = DateTime.now();
		
		final DateTime picked = await showDatePicker(
		context: context,
		initialDate: _date,
		firstDate: DateTime(2020),
		lastDate: DateTime(2025),
		);
		if (picked != null && picked != _date) {
			print('date selected: ${_date.toString()}');
		}
		return picked;
 }

	Future<TimeOfDay> _selectTime(BuildContext context) async {
	 final TimeOfDay picked = await showTimePicker(
		 context: context,
		 initialTime: TimeOfDay(hour: 0, minute: 0),
	 );
	 return picked;
	}

	Future<List<Map<int, int>>> _selectReminders(BuildContext context) async {
		bool checkedValue;
		CheckboxListTile(
			title: Text("Reminders before"),
			value: checkedValue,
			onChanged: (newValue) {
				setState(()) {
					checkedValue = newValue;
				}
			},
		)
	}

	

 @override 
 Widget build(BuildContext context) {
		return Scaffold(
			 appBar: AppBar(title: Text(this.title),),
			 body: Center(
					child: GestureDetector( 
						 onTap: () {
								// _showDialog(context);
								_showDatePicker(context).then((DateTime date) {
									if (date != null) {
										print(date);
										_selectTime(context).then((TimeOfDay time) {
											if(time != null) {
												print(time);
											}
										});
									}
								});
								
								// _showTimePicker(context);
						 },
					child: Text( 'Add calendar', )
					)
			 ),
		);
 }
}

