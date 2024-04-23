import 'package:project_one/packages.dart';

class FormPage extends StatefulWidget {
  const FormPage({super.key});

  @override
  State<FormPage> createState() => FormPageState();
}

class FormPageState extends State<FormPage> {
  String? _gender;
  DateTime? _birthday;
  RangeValues? _costRange;
  int? _tripDuration;
  String? _tripType;
  final GlobalKey<FormState> _formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          children: [
            // Gender Dropdown
            DropdownButtonFormField<String>(
              value: _gender,
              hint: const Text('Select Gender'),
              items: ['Male', 'Female', 'Non-binary', 'Prefer not to say']
                  .map((gender) => DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                  .toList(),
              onChanged: (gender) => setState(() => _gender = gender),
              validator: (value) =>
                  value == null ? 'Please select your gender' : null,
            ),

            // Birthday Date Picker
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Birthday',
                icon: Icon(Icons.calendar_today),
              ),
              readOnly: true,
              onTap: () async {
                final pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
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

            // Cost Range Slider
            const Text('Cost Range :'),
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

            // Trip Duration Dropdown
            DropdownButtonFormField<int>(
              value: _tripDuration,
              hint: const Text('Select Trip Duration (days)'),
              items: [for (int i = 1; i <= 30; i++) i]
                  .map((duration) => DropdownMenuItem<int>(
                        value: duration,
                        child: Text('$duration days'),
                      ))
                  .toList(),
              onChanged: (duration) => setState(() => _tripDuration = duration),
              validator: (value) =>
                  value == null ? 'Please select trip duration' : null,
            ),

            // Trip Type Text Field
            TextFormField(
              decoration: const InputDecoration(
                labelText: 'Trip Type (optional)',
              ),
              onChanged: (value) => setState(() => _tripType = value),
            ),

            // Submit Button
            ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  // Form submitted, process data
                  print('Gender: $_gender');
                  print('Birthday: $_birthday');
                  print(
                      'Cost Range: \$${_costRange!.start.round()} - \$${_costRange!.end.round()}');
                  print('Trip Duration: $_tripDuration days');
                  print('Trip Type: $_tripType');
                }
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}
