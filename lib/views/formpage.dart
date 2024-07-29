// ignore_for_file: avoid_print

import 'package:project_one/packages.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  String? _gender;
  DateTime? _birthday = DateTime.now();
  RangeValues? _costRange;
  RangeValues? _tripDuration;
  String? _tripType;

  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: context.width / 12),
          child: SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.only(top: 100, bottom: 100),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "first name"),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Expanded(
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Required Field!";
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)),
                            labelText: "last name"),
                      ),
                    ),
                    // Gender Dropdown
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                      value: _gender,
                      hint: const Text('Select Gender'),
                      items: ['Male', 'Female', 'Prefer not to say']
                          .map((gender) => DropdownMenuItem<String>(
                                value: gender,
                                child: Text(gender),
                              ))
                          .toList(),
                      onChanged: (gender) => setState(() {
                        _gender = gender;
                      }),
                      validator: (value) =>
                          value == null ? 'Please select your gender' : null,
                    ),
                    const SizedBox(height: 20),
                    // Trip Type DropDownList
                    ElevatedButton(
                        onPressed: () {
                          Dropdownlist("Trip Type", types, context);
                        },
                        child: const Text("TripType")),
                    const SizedBox(height: 20),
                    // Destination discription DropDownList
                    ElevatedButton(
                        onPressed: () {
                          Dropdownlist("env", categories, context);
                        },
                        child: const Text("Environment")),
                    const SizedBox(height: 20),

                    // Birthday Date Picker
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20)),
                        labelText: 'Birthday',
                        icon: const Icon(
                            Icons.calendar_today), // birthday field icon
                      ),
                      readOnly: true,
                      onTap: () async {
                        final pickedDate = await showDatePicker(
                          context: context,
                          initialDate: _birthday,
                          firstDate: DateTime(1900, 1, 1),
                          lastDate: DateTime.now(),
                        );
                        if (pickedDate != null) {
                          setState(() => _birthday = pickedDate);
                        }
                      },
                      validator: (value) =>
                          value == null ? 'Please select your birthday' : null,
                    ),
                    const SizedBox(height: 20),
                    // Cost Range Slider
                    const Text('Cost Range:'),
                    RangeSlider(
                      values: _costRange ?? const RangeValues(0, 1000),
                      min: 0,
                      max: 1000,
                      divisions: 10,
                      labels: _costRange != null
                          ? RangeLabels('${_costRange!.start.round()}',
                              '${_costRange!.end.round()}')
                          : null,
                      onChanged: (range) => setState(() => _costRange = range),
                    ),
                    const SizedBox(height: 20),
                    // Trip Duration Dropdown
                    const Text('Trip Duration :'),
                    RangeSlider(
                      values: _tripDuration ?? const RangeValues(1, 4),
                      min: 1,
                      max: 4,
                      divisions: 3,
                      labels: _tripDuration != null
                          ? RangeLabels(
                              _tripDuration!.start.round() == 1
                                  ? '${_tripDuration!.start.round()} day'
                                  : '${_tripDuration!.start.round()} days',
                              '${_tripDuration!.end.round() == 4 ? "Up to 3 days" : _tripDuration!.end.round()}')
                          : null,
                      onChanged: (range) =>
                          setState(() => _tripDuration = range),
                    ),
                    const SizedBox(height: 20),
                    // Submit Button
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Form submitted, process data
                          print('Gender: $_gender');
                          print('Birthday: $_birthday');
                          print(
                              'Cost Range: \$${_costRange!.start.round()} - \$${_costRange!.end.round()}');
                          print(
                              'Trip Duration: ${_tripDuration!.start.round()} - ${_tripDuration!.end.round()}');
                          print('Trip Type: $_tripType');
                          Get.offAll(() => const HomePage());
                        }
                      },
                      child: const Text('Submit'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

final List<SelectedListItem> types = [
  SelectedListItem(name: "Adventural"),
  SelectedListItem(name: "Entertainment"),
  SelectedListItem(name: "Photograpy"),
  SelectedListItem(name: "Historical"),
  SelectedListItem(name: "Traditional"),
];

final List<SelectedListItem> categories = [
  SelectedListItem(name: "Beach"),
  SelectedListItem(name: "Mountains"),
  SelectedListItem(name: "Jungles"),
  SelectedListItem(name: "Town"),
  SelectedListItem(name: "Desert"),
];
