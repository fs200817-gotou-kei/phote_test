import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:test_app/api/api_service.dart';
import 'package:test_app/model/work_site.dart';
import 'package:test_app/ui/content_screen.dart';
import 'package:test_app/ui/home_screen.dart';

class FormScreen extends StatefulWidget {
  late WorkSite worksite;
  FormScreen(WorkSite this.worksite);

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _subNameController = TextEditingController();
  String _type = '';
  final _staffNameController = TextEditingController();
  final _addressController = TextEditingController();
  String _status = '';
  final _startDateController = TextEditingController();
  final _endDateController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  //スマホ late File _image = File("");
  late String _image = "";

  void handleSelectedDate() {
    setState(() {
      ;
    });
  }

  void _handleTypeRadio(String? e) => setState(() {
        _type = e!;
      });

  void _handleStatusRadio(String? e) => setState(() {
        _status = e!;
      });

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.worksite.name ?? "";
    _subNameController.text = widget.worksite.subName ?? "";
    _staffNameController.text = widget.worksite.staffName ?? "";
    _addressController.text = widget.worksite.address ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: formKey,
        child: Column(children: [
          Text("現場名"),
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return '入力してください';
              }
              return null;
            },
            decoration: InputDecoration(
              hintText: '現場名称を入力してください',
            ),
            controller: _nameController,
          ),
          Text("施工箇所"),
          TextFormField(
            decoration: InputDecoration(
              hintText: '施工箇所を入力してください',
            ),
            controller: _subNameController,
          ),
          Text("種別"),
          new RadioListTile(
              title: Text('1:新築'),
              activeColor: Colors.blue,
              value: "1",
              groupValue: _type,
              onChanged: _handleTypeRadio),
          new RadioListTile(
              title: Text('2:改築'),
              activeColor: Colors.blue,
              value: "2",
              groupValue: _type,
              onChanged: _handleTypeRadio),
          new RadioListTile(
              title: Text('3:その他'),
              activeColor: Colors.blue,
              value: "3",
              groupValue: _type,
              onChanged: _handleTypeRadio),
          Text("担当者名"),
          TextFormField(
            decoration: InputDecoration(
              hintText: '担当者名を入力してください',
            ),
            controller: _staffNameController,
          ),
          // TODO: 写真
          Text("現場写真"),
          _image == "" ? Text("写真が選択されていません") : Image.asset(_image),
          // スマホとかはImage.file(_image),
          FloatingActionButton(
            onPressed: () async {
              final picker = ImagePicker();
              final pickedFile =
                  await picker.getImage(source: ImageSource.camera);
              setState(() {
                if (pickedFile != null) {
                  _image = pickedFile.path;
                  //スマホ _image = File(pickedFile.path);
                }
              });
            },
            child: const Icon(Icons.add_a_photo),
          ),
          Text("住所"),
          TextFormField(
            decoration: InputDecoration(
              hintText: '住所を入力してください',
            ),
            controller: _addressController,
          ),
          Text("ステータス"),
          new RadioListTile(
              title: Text('1:未着手'),
              activeColor: Colors.blue,
              value: "1",
              groupValue: _status,
              onChanged: _handleStatusRadio),
          new RadioListTile(
              title: Text('2:進行中'),
              activeColor: Colors.blue,
              value: "2",
              groupValue: _status,
              onChanged: _handleStatusRadio),
          new RadioListTile(
              title: Text('3:保留'),
              activeColor: Colors.blue,
              value: "3",
              groupValue: _status,
              onChanged: _handleStatusRadio),
          new RadioListTile(
              title: Text('4:完了'),
              activeColor: Colors.blue,
              value: "4",
              groupValue: _status,
              onChanged: _handleStatusRadio),
          _datePicker("開始日(予定日)", _startDateController),
          _datePicker("終了日(予定日)", _endDateController),
          ElevatedButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                  ApiService apiService = ApiService();
                  widget.worksite.name = _nameController.text;
                  if (widget.worksite.id == null) {
                    apiService.createWorkSite(widget.worksite);
                    Navigator.pop(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  } else {
                    apiService.updateWorkSite(widget.worksite);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                ContentScreen(worksite: widget.worksite)));
                  }
                }
              },
              child: Text("保存"))
        ]),
      ),
    );
  }

  final _dateController = TextEditingController();

  Widget _datePicker(value, controller) {
    return TextField(
      controller: controller,
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.arrow_drop_down),
        prefixIcon: Icon(Icons.date_range),
        border: OutlineInputBorder(),
        labelText: value,
        hintText: value,
      ),
      onTap: () async {
        final DateTime? selectedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2000),
            lastDate: DateTime(2100),
            builder: ((context, child) {
              return Center(
                child: SizedBox(
                  width: 400.0,
                  height: 600.0,
                  child: child,
                ),
              );
            }));
        if (selectedDate != null) {
          setState(() {
            controller.text = selectedDate.toString();
          });
        }
      },
    );
  }
}
