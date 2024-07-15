// ignore_for_file: avoid_print

import 'package:project_one/controllers/form_controlar.dart';
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
                    )
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
