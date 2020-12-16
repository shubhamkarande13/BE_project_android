import 'dart:convert';
import 'dart:io';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:dart_json_mapper/dart_json_mapper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Heart Disease Diagnosis",
    home: SIForm(),
    theme: ThemeData(
        primaryColor: Colors.indigo, accentColor: Colors.indigoAccent),
  ));
}

List<dynamic> _array = [
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
  0,
];

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    print(_array.toString());
    return _SIFormState();
  }
}

class _SIFormState extends State<SIForm> {
  final _minimumPadding = 5.0;

  // var _ca = ['1 ', '2', '3'];
  // String _currentCA;
  //
  // // ignore: non_constant_identifier_names
  // var _chest_pain = [
  //   'typical angina',
  //   'atypical angina',
  //   'non-angina pain',
  //   'asmptomatic'
  // ];
  // String _currentChestPain;
  //
  // var _slope = ['flat', 'down sloping'];
  // String currentSlop;
  //
  // var _thal = ['normal', 'fixed defect', 'reversible defect'];
  // String _currentThal;

  // int selectedRadio;
  int gender = 0;

  //int set = 0;
  //int set2 = 0;
  //int exang;
  int physical_activity = 0;
  int smoke = 0;
  int alcohol = 0;
  String _final_answer = " ";

  //int sugar=0;
  int cholesterol = 0;
  int glucose = 0;

  void initState() {
    super.initState();
    gender = 0;
    cholesterol = 0;
    smoke = 0;
    alcohol = 0;
    //exang = 0;
    //sugar = 0;
    physical_activity = 0;
    glucose = 0;
  }

  setSelectedGender(int val) {
    setState(() {
      gender = val;
      _array[1] = gender;
      print(_array.toString());
      //print(_array);
    });
  }

  setSelectedSmoke(int val) {
    setState(() {
      smoke = val;
      _array[6] = smoke;
      print(_array.toString());
    });
  }

  setSelectedAlcohol(int val) {
    setState(() {
      alcohol = val;
      _array[7] = alcohol;
      print(_array.toString());
    });
  }

  setSelectedPhysicalActivity(int val) {
    setState(() {
      physical_activity = val;
      _array[8] = physical_activity;
      print(_array.toString());
    });
  }

  setSelectedCholesterol(int val) {
    setState(() {
      cholesterol = val;
      if (cholesterol == 1) {
        _array[9] = 1;
        _array[10] = 0;
        _array[11] = 0;
      } else if (cholesterol == 2) {
        _array[9] = 0;
        _array[10] = 1;
        _array[11] = 0;
      } else if (cholesterol == 3) {
        _array[9] = 0;
        _array[10] = 0;
        _array[11] = 1;
      }
      print(_array.toString());
    });
  }

  setSelectedGlucose(int val) {
    setState(() {
      glucose = val;
      if (glucose == 1) {
        _array[12] = 1;
        _array[13] = 0;
        _array[14] = 0;
      } else if (glucose == 2) {
        _array[12] = 0;
        _array[13] = 1;
        _array[14] = 0;
      } else if (glucose == 3) {
        _array[12] = 0;
        _array[13] = 0;
        _array[14] = 1;
      }
      print(_array.toString());
    });
  }

  //
  // setSelectedexang(int xang) {
  //   setState(() {
  //     exang = xang;
  //   });
  // }

  // setSelectedsugar(int gar) {
  //   setState(() {
  //     sugar = gar;
  //   });
  // }

  String displayResult = "Your Result";
  TextEditingController ageControlled = TextEditingController();

  //TextEditingController thalachControlled = TextEditingController();
  //TextEditingController bpControlled = TextEditingController();
  //TextEditingController oldControlled = TextEditingController();
  TextEditingController HeightControlled = TextEditingController();
  TextEditingController WeightControlled = TextEditingController();
  TextEditingController BP_High_Controlled = TextEditingController();
  TextEditingController BP_Low_Controlled = TextEditingController();

  Widget build(BuildContext context) {
    TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    // title:Text("");

    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Heart Disease Diagnosis"),
      ),
      body: Container(
        margin: EdgeInsets.all(_minimumPadding * 2),
        child: ListView(
          children: <Widget>[
            //Image
            getImageAsset(),
            //textField
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      //style: textStyle,
                      controller: ageControlled,
                      decoration: InputDecoration(
                          labelText: "Age",
                          hintText: "Enter age",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text(
                      "Gender",
                      style: textStyle,
                    ),
                    Radio(
                      value: 1,
                      groupValue: gender,
                      onChanged: (val) {
                        setSelectedGender(val);
                        _array[1] = val;
                      },
                    ),
                    Text("Male"),
                    Radio(
                      value: 0,
                      groupValue: gender,
                      onChanged: (val) {
                        setSelectedGender(val);
                        _array[1] = val;
                      },
                    ),
                    Text("Female"),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      //style: textStyle,
                      controller: HeightControlled,
                      decoration: InputDecoration(
                          labelText: "Height",
                          hintText: "Enter Height",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      //style: textStyle,
                      controller: WeightControlled,
                      decoration: InputDecoration(
                          labelText: "Weight",
                          hintText: "Enter Weight",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      //style: textStyle,
                      controller: BP_High_Controlled,
                      decoration: InputDecoration(
                          labelText: "Systolic blood pressure",
                          hintText: "Enter Systolic blood pressure (High)",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    //Container(child: Text('Diastolic blood pressure')),
                    Expanded(
                        child: TextField(
                      keyboardType: TextInputType.number,
                      //style: textStyle,
                      controller: BP_Low_Controlled,
                      decoration: InputDecoration(
                          labelText: "Diastolic blood pressure",
                          hintText: "Enter Diastolic blood pressure (Low)",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Do you Smoke?", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: smoke,
                      onChanged: (val) {
                        setState(() {
                          setSelectedSmoke(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Yes"),
                    Radio(
                      value: 0,
                      groupValue: smoke,
                      onChanged: (val) {
                        setState(() {
                          setSelectedSmoke(val);
                          _submit();
                        });
                      },
                    ),
                    Text("No"),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Do you consume Alcohol?", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: alcohol,
                      onChanged: (val) {
                        setState(() {
                          setSelectedAlcohol(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Yes"),
                    Radio(
                      value: 0,
                      groupValue: alcohol,
                      onChanged: (val) {
                        setState(() {
                          setSelectedAlcohol(val);
                          _submit();
                        });
                      },
                    ),
                    Text("No"),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Are you physically active?", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: physical_activity,
                      onChanged: (val) {
                        setState(() {
                          setSelectedPhysicalActivity(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Yes"),
                    Radio(
                      value: 0,
                      groupValue: physical_activity,
                      onChanged: (val) {
                        setState(() {
                          setSelectedPhysicalActivity(val);
                          _submit();
                        });
                      },
                    ),
                    Text("No"),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Cholesterol", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: cholesterol,
                      onChanged: (val) {
                        setSelectedCholesterol(val);
                        _submit();
                      },
                    ),
                    Text("Normal"),
                    Radio(
                      value: 2,
                      groupValue: cholesterol,
                      onChanged: (val) {
                        setSelectedCholesterol(val);
                      },
                    ),
                    Text("High"),
                    Radio(
                      value: 3,
                      groupValue: cholesterol,
                      onChanged: (val) {
                        setState(() {
                          setSelectedCholesterol(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Very High"),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Text("Glucose", style: textStyle),
                    Radio(
                        value: 1,
                        groupValue: glucose,
                        onChanged: (val) {
                          setState(() {
                            setSelectedGlucose(val);
                            _submit();
                          });
                        }),
                    Text("Normal"),
                    Radio(
                      value: 2,
                      groupValue: glucose,
                      onChanged: (val) {
                        setState(() {
                          setSelectedGlucose(val);
                          _submit();
                        });
                      },
                    ),
                    Text("High"),
                    Radio(
                      value: 3,
                      groupValue: glucose,
                      onChanged: (val) {
                        setState(() {
                          setSelectedGlucose(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Very High"),
                  ],
                )),

            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        color: Colors.cyanAccent,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("Diagnosis", textScaleFactor: 1),
                        onPressed: () {
                          setState(() {
                            var array2 = [_array];
                            //String array2 = jsonEncode(_array);
                            //print(array2);
                            void run(array2) async {
                              Future<String> futureString =
                                  (predictHeartRisk(array2));
                              _final_answer = await futureString;
                              print("final ans: ");
                              print(_final_answer);
                              if (_final_answer == '0') {
                                print("not serious");
                                displayResult = "Not at risk";
                              } else if (_final_answer == "1") {
                                print("serious");
                                displayResult = "At SERIOUS RISK!";
                              }
                            }

                            run(array2);
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.tealAccent,
                        textColor: Theme.of(context).primaryColorDark,
                        child: Text("Reset",textScaleFactor: 1,),
                        onPressed: () {
                          setState(() {
                            _reset();
                          });
                        },
                      ),
                    ),
                    Container(
                      width: _minimumPadding * 5,
                    ),
                    // Expanded(
                    //   child: RaisedButton(
                    //       color: Colors.orange,
                    //       textColor: Theme
                    //           .of(context)
                    //           .primaryColorDark,
                    //       child: Text("Submit", textScaleFactor: 1),
                    //       onPressed: () {
                    //         _submit();
                    //         //print(_array.toString());
                    //       }),
                    // ),
                  ],
                )),
            Padding(
              padding: EdgeInsets.all(_minimumPadding * 2),
              child: Text(
                displayResult,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/hospital.jpeg');
    Image image = Image(
      image: assetImage,
      width: 150.0,
      height: 150.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(_minimumPadding * 3),
    );
  }

  void _submit() {
    int age = int.parse(ageControlled.text);
    _array[0] = age;
    int height = int.parse(HeightControlled.text);
    _array[2] = height;
    int weight = int.parse(WeightControlled.text);
    _array[3] = weight;
    int BP_High = int.parse(BP_High_Controlled.text);
    _array[4] = BP_High;
    int BP_Low = int.parse(BP_Low_Controlled.text);
    _array[5] = BP_Low;
  }

  Future<String> predictHeartRisk(var body) async {
    var client = new http.Client();
    var uri =
        Uri.parse('https://college-project-hai-re.herokuapp.com/predict/');

    Map<String, String> headers = {"Content-type": "application/json"};
    String jsonString = jsonEncode(body);
    //print(jsonString);
    try {
      var resp = await client.post(uri, headers: headers, body: jsonString);
      //print(json.decode(resp.body));
      //var resp=await http.get(Uri.parse("http://192.168.1.101:5000"));
      if (resp.statusCode == 200) {
        print("DATA FETCHED SUCCESSFULLY");
        var result = json.decode(resp.body);
        print(result[1]);
        return (result[1].toString());
      }
    } catch (e) {
      print("EXCEPTION OCCURRED: $e");
      return null;
    }

    return null;
  }

  String _diagnosisReturns() {
    // int age = int.parse(ageControlled.text);
    // _array[0] = age;
    // int height = int.parse(HeightControlled.text);
    // _array[2] = height;
    // int weight = int.parse(WeightControlled.text);
    // _array[3] = weight;
    // int BP_High = int.parse(BP_High_Controlled.text);
    // _array[4] = BP_High;
    // int BP_Low = int.parse(BP_Low_Controlled.text);
    // _array[5] = BP_Low;
    //int thalach = int.parse(thalachControlled.text);
    //int bp = int.parse(bpControlled.text);
    //int cholestrol = int.parse(cholestrolControlled.text);
    //double oldpeak = double.parse(oldControlled.text);
    //String ca = _currentCA;
    //String thal = _currentThal;
    //String cp = _currentChestPain;
    // String slope=currentSlop;
  }

  void _reset() {
    ageControlled.text = " ";
    HeightControlled.text = " ";
    WeightControlled.text = " ";
    BP_Low_Controlled.text = " ";
    BP_High_Controlled.text = " ";
    //thalachControlled.text = " ";
    //.text = " ";
    //cholestrolControlled.text = " ";
    //oldControlled.text = " ";
    //currentSlop = null;
    //_currentCA = null;
    //_currentThal = null;
    //_currentChestPain = null;
    //displayResult = " ";
    gender = 0;
    //exang = 0;
    // sugar = 0;
    physical_activity = 0;
    smoke = 0;
    alcohol = 0;
    cholesterol = 0;
    glucose = 0;
    _array = [
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
    ];
  }
}
