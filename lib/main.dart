import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final userNameTEC = TextEditingController();
  final userObjectiveTEC = TextEditingController();
  final userPhoneNumberTEC = TextEditingController();
  final userAgeTEC = TextEditingController();
  List<String> gender = ['Male', 'Female', 'Other'];
  String? selectedGender = 'Male';
  String? selectedEducation = '';

  String strInterestReading = 'Reading Books';
  bool? interestReading = false;

  String strInterestPlayingCricket = 'Playing Cricket';
  bool? interestPlayingCricket = false;

  String strInterestCycling = 'Cycling';
  bool? interestCycling = false;

  String strInterestGaming = 'Gaming';
  bool? interestGaming = false;

  List<String> selectedInterests = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.menu),
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 10,
                  bottom: 10,
                ),
                child: Text(
                  'Create Profile',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              //name
              InputFieldBox(
                widget: TextField(
                  controller: userNameTEC,
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(r'[A-Z]'),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Full Name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  maxLength: 30,
                ),
              ),

              //objective
              InputFieldBox(
                widget: TextField(
                  controller: userObjectiveTEC,
                  decoration: InputDecoration(
                    labelText: 'Objective',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  maxLines: 3,
                  maxLength: 100,
                ),
              ),

              //phone number
              InputFieldBox(
                widget: TextField(
                  controller: userPhoneNumberTEC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // FilteringTextInputFormatter.allow(r'[A-Z]'),
                  ],
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Mobile Number',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  maxLength: 10,
                ),
              ),

              //Gender
              InputFieldBox(
                widget: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'Select Gender:',
                      style:
                          TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
                    ),
                    DropdownButton(
                        value: selectedGender,
                        items: gender
                            .map(
                              (genderType) => DropdownMenuItem(
                                child: Text(genderType),
                                value: genderType,
                              ),
                            )
                            .toList(),
                        onChanged: (value) {
                          selectedGender = value;
                          setState(() {});
                        }),
                  ],
                ),
              ),

              //age
              InputFieldBox(
                widget: TextField(
                  controller: userAgeTEC,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    // FilteringTextInputFormatter.allow(r'[A-Z]'),
                  ],
                  textInputAction: TextInputAction.search,
                  decoration: InputDecoration(
                    labelText: 'Age in Years',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                ),
              ),

//highest education
              InputFieldBox(
                widget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Select highets education:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Ph. D.',
                            groupValue: selectedEducation,
                            onChanged: (value) {
                              selectedEducation = value;
                              setState(() {});
                            }),
                        Text(
                          'Ph. D.',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Master',
                            groupValue: selectedEducation,
                            onChanged: (value) {
                              selectedEducation = value;
                              setState(() {});
                            }),
                        Text(
                          'Master',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Radio(
                            value: 'Bachelor',
                            groupValue: selectedEducation,
                            onChanged: (value) {
                              selectedEducation = value;
                              setState(() {});
                            }),
                        Text(
                          'Bachelor',
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

//Interests
              InputFieldBox(
                widget: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'Interest:',
                            style: TextStyle(
                                fontSize: 17, fontWeight: FontWeight.w600),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: interestReading,
                            onChanged: (value) {
                              interestReading = value;
                              if (interestReading!) {
                                selectedInterests.add(strInterestReading);
                              } else {
                                selectedInterests.removeWhere(
                                    (element) => element == strInterestReading);
                              }
                              setState(() {});
                            }),
                        Text(
                          strInterestReading,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: interestPlayingCricket,
                            onChanged: (value) {
                              interestPlayingCricket = value;
                              if (interestPlayingCricket!) {
                                selectedInterests
                                    .add(strInterestPlayingCricket);
                              } else {
                                selectedInterests.removeWhere((element) =>
                                    element == strInterestPlayingCricket);
                              }
                              setState(() {});
                            }),
                        Text(
                          strInterestPlayingCricket,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: interestCycling,
                            onChanged: (value) {
                              interestCycling = value;
                              if (interestCycling!) {
                                selectedInterests.add(strInterestCycling);
                              } else {
                                selectedInterests.removeWhere(
                                    (element) => element == strInterestCycling);
                              }
                              setState(() {});
                            }),
                        Text(
                          strInterestCycling,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: interestGaming,
                            onChanged: (value) {
                              interestGaming = value;
                              if (interestGaming!) {
                                selectedInterests.add(strInterestGaming);
                              } else {
                                selectedInterests.removeWhere(
                                    (element) => element == strInterestGaming);
                              }
                              setState(() {});
                            }),
                        Text(
                          strInterestGaming,
                          style: TextStyle(fontSize: 17),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              //create button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InputFieldBox(
                    widget: ElevatedButton.icon(
                      onPressed: () {
                        resetData();
                        setState(() {});
                      },
                      icon: Icon(Icons.close),
                      label: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Clear',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                  InputFieldBox(
                    widget: ElevatedButton.icon(
                      onPressed: () {
                        debugPrint('Name:${userNameTEC.text}');
                        debugPrint('Objective:${userObjectiveTEC.text}');
                        debugPrint('Phone No:${userPhoneNumberTEC.text}');
                        debugPrint('Gender:$selectedGender');
                        debugPrint('Age:${userAgeTEC.text}');
                        debugPrint('Education:$selectedEducation');
                      },
                      icon: Icon(Icons.add),
                      label: Padding(
                        padding: const EdgeInsets.all(10),
                        child: Text(
                          'Create',
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetData() {
    userNameTEC.clear();
    userObjectiveTEC.clear();
    userPhoneNumberTEC.clear();
    userAgeTEC.clear();
    selectedGender = 'Male';
    selectedEducation = '';
    selectedInterests = [];
    interestReading = false;
    interestPlayingCricket = false;
    interestCycling = false;
    interestGaming = false;
  }
}

class InputFieldBox extends StatelessWidget {
  final Widget widget;

  const InputFieldBox({super.key, required this.widget});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 6),
      child: widget,
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
