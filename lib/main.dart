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
  int chest_pain = 0;
  int exercise_induced_angina = 0;
  int fasting_blood_sugar = 0;
  int restecg = 0;
  int slope = 0;
  int ca = 0;
  int thal = 0;
  String _final_answer = " ";

  //int sugar=0;
  int cholesterol = 0;
  int glucose = 0;

  void initState() {
    super.initState();
    gender = 0;
    cholesterol = 0;
    chest_pain = 0;
    fasting_blood_sugar = 0;
    restecg = 0;
    //exang = 0;
    //sugar = 0;
    exercise_induced_angina = 0;
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

  setSelectedChest_Pain(int val) {
    setState(() {
      chest_pain = val;
      _array[2] = chest_pain;
      print(_array.toString());
      //print(_array);
    });
  }

  setSelectedFasting_blood_sugar(int val) {
    setState(() {
      fasting_blood_sugar = val;
      _array[5] = fasting_blood_sugar;
      print(_array.toString());
    });
  }

  setSelectedRestECG(int val) {
    setState(() {
      restecg = val;
      _array[6] = restecg;
      print(_array.toString());
    });
  }

  setSelectedSlope(int val) {
    setState(() {
      slope = val;
      _array[10] = slope;
      print(_array.toString());
    });
  }

  setSelectedca(int val) {
    setState(() {
      ca = val;
      _array[11] = ca;
      print(_array.toString());
    });
  }

  setSelectedThal(int val) {
    setState(() {
      thal = val;
      _array[12] = thal;
      print(_array.toString());
    });
  }

  setSelectedExerciseInducedAngina(int val) {
    setState(() {
      exercise_induced_angina = val;
      _array[8] = exercise_induced_angina;
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
  TextEditingController STdepressionControlled = TextEditingController();
  TextEditingController Rest_BP_Controlled = TextEditingController();
  TextEditingController Cholesterol_Controlled = TextEditingController();
  TextEditingController MaxHeartRate_Controlled = TextEditingController();

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
                  Text(
                    "Chest Pain?",
                    style: textStyle,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 3,
                    groupValue: chest_pain,
                    onChanged: (val) {
                      setSelectedChest_Pain(val);
                      _array[2] = val;
                    },
                  ),
                  Text("typical angina (3)"),
                  Radio(
                    value: 1,
                    groupValue: chest_pain,
                    onChanged: (val) {
                      setSelectedChest_Pain(val);
                      _array[2] = val;
                    },
                  ),
                  Text("atypical angina (1)"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(
                children: <Widget>[
                  Radio(
                    value: 2,
                    groupValue: chest_pain,
                    onChanged: (val) {
                      setSelectedChest_Pain(val);
                      _array[2] = val;
                    },
                  ),
                  Text("non-anginal pain (2)"),
                  Radio(
                    value: 0,
                    groupValue: chest_pain,
                    onChanged: (val) {
                      setSelectedChest_Pain(val);
                      _array[2] = val;
                    },
                  ),
                  Text("asymptomatic (0)"),
                ],
              ),
            ),

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
                      controller: Rest_BP_Controlled,
                      decoration: InputDecoration(
                          labelText: "Resting blood pressure",
                          hintText: "Enter Resting blood pressure",
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
                      controller: Cholesterol_Controlled,
                      decoration: InputDecoration(
                          labelText: "Cholesterol",
                          hintText: "Cholesterol",
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
                    Text("Fasting Blood Sugar", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: fasting_blood_sugar,
                      onChanged: (val) {
                        setState(() {
                          setSelectedFasting_blood_sugar(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Yes (1)"),
                    Radio(
                      value: 0,
                      groupValue: fasting_blood_sugar,
                      onChanged: (val) {
                        setState(() {
                          setSelectedFasting_blood_sugar(val);
                          _submit();
                        });
                      },
                    ),
                    Text("No (0)"),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(children: <Widget>[
                Flexible(
                    child: Text("Resting Electrocardiography Results",
                        style: textStyle)),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: restecg,
                      onChanged: (val) {
                        setState(() {
                          setSelectedRestECG(val);
                          _submit();
                        });
                      },
                    ),
                    Flexible(
                      child: Text(
                          "showing probable or definite left ventricular hypertrophy by Estes’ criteria (0)"),
                    ),
                  ],
                )),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: restecg,
                      onChanged: (val) {
                        setState(() {
                          setSelectedRestECG(val);
                          _submit();
                        });
                      },
                    ),
                    Text("normal (1)"),
                    Radio(
                      value: 2,
                      groupValue: restecg,
                      onChanged: (val) {
                        setState(() {
                          setSelectedRestECG(val);
                          _submit();
                        });
                      },
                    ),
                    Text("having ST-T wave abnormality (2)"),
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
                      controller: MaxHeartRate_Controlled,
                      decoration: InputDecoration(
                          labelText: "Max Heart Rate",
                          hintText: "Max Heart Rate",
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
                    Text("Exercise Induced Angina", style: textStyle),
                    Radio(
                      value: 1,
                      groupValue: exercise_induced_angina,
                      onChanged: (val) {
                        setState(() {
                          setSelectedExerciseInducedAngina(val);
                          _submit();
                        });
                      },
                    ),
                    Text("Yes (1)"),
                    Radio(
                      value: 0,
                      groupValue: exercise_induced_angina,
                      onChanged: (val) {
                        setState(() {
                          setSelectedExerciseInducedAngina(val);
                          _submit();
                        });
                      },
                    ),
                    Text("No (0)"),
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
                      controller: STdepressionControlled,
                      decoration: InputDecoration(
                          labelText: "ST depression",
                          hintText: "Enter ST depression",
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0))),
                    )),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(children: <Widget>[
                Text("Slope of the peak exercise ST segment", style: textStyle),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: slope,
                      onChanged: (val) {
                        setState(() {
                          setSelectedSlope(val);
                          _submit();
                        });
                      },
                    ),
                    Text("0"),
                    Radio(
                      value: 1,
                      groupValue: slope,
                      onChanged: (val) {
                        setState(() {
                          setSelectedSlope(val);
                          _submit();
                        });
                      },
                    ),
                    Text("1"),
                    Radio(
                      value: 2,
                      groupValue: slope,
                      onChanged: (val) {
                        setState(() {
                          setSelectedSlope(val);
                          _submit();
                        });
                      },
                    ),
                    Text("2"),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(children: <Widget>[
                Text("Number of major vessels (0-3)", style: textStyle),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 0,
                      groupValue: ca,
                      onChanged: (val) {
                        setState(() {
                          setSelectedca(val);
                          _submit();
                        });
                      },
                    ),
                    Text("0"),
                    Radio(
                      value: 1,
                      groupValue: ca,
                      onChanged: (val) {
                        setState(() {
                          setSelectedca(val);
                          _submit();
                        });
                      },
                    ),
                    Text("1"),
                    Radio(
                      value: 2,
                      groupValue: ca,
                      onChanged: (val) {
                        setState(() {
                          setSelectedca(val);
                          _submit();
                        });
                      },
                    ),
                    Text("2"),
                    Radio(
                      value: 3,
                      groupValue: ca,
                      onChanged: (val) {
                        setState(() {
                          setSelectedca(val);
                          _submit();
                        });
                      },
                    ),
                    Text("3"),
                  ],
                )),
            Padding(
              padding: EdgeInsets.only(
                  top: _minimumPadding, bottom: _minimumPadding),
              child: Row(children: <Widget>[
                Text("Thalassemia", style: textStyle),
              ]),
            ),
            Padding(
                padding: EdgeInsets.only(
                    top: _minimumPadding, bottom: _minimumPadding),
                child: Row(
                  children: <Widget>[
                    Radio(
                      value: 1,
                      groupValue: thal,
                      onChanged: (val) {
                        setState(() {
                          setSelectedThal(val);
                          _submit();
                        });
                      },
                    ),
                    Text("fixed defect (1)"),
                    Radio(
                      value: 2,
                      groupValue: thal,
                      onChanged: (val) {
                        setState(() {
                          setSelectedThal(val);
                          _submit();
                        });
                      },
                    ),
                    Flexible(child: Text("normal blood flow (2)")),
                    Radio(
                      value: 3,
                      groupValue: ca,
                      onChanged: (val) {
                        setState(() {
                          setSelectedThal(val);
                          _submit();
                        });
                      },
                    ),
                    Flexible(
                      child: Text("reversible defect (3)"),
                    )
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
                            print(_array.toString());
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
                        child: Text(
                          "Reset",
                          textScaleFactor: 1,
                        ),
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
    double STdepression = double.parse(STdepressionControlled.text);
    _array[9] = STdepression;
    int Rest_BP = int.parse(Rest_BP_Controlled.text);
    _array[3] = Rest_BP;
    int Cholesterol = int.parse(Cholesterol_Controlled.text);
    _array[4] = Cholesterol;
    int MaxHeartRate = int.parse(MaxHeartRate_Controlled.text);
    _array[7] = MaxHeartRate;
  }

  Future<String> predictHeartRisk(var body) async {
    var client = new http.Client();
    var uri =
        Uri.parse('https://heart-disease-be-project.herokuapp.com/predict/');

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
    STdepressionControlled.text = " ";
    Cholesterol_Controlled.text = " ";
    MaxHeartRate_Controlled.text = " ";
    Rest_BP_Controlled.text = " ";
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
    exercise_induced_angina = 0;
    ca = 0;
    thal = 0;
    slope = 0;
    fasting_blood_sugar = 0;
    restecg = 0;
    cholesterol = 0;
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
    ];
  }
}
