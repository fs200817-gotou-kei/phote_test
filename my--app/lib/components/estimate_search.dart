import 'package:flutter/material.dart';
import 'package:my_app/components/app_header.dart';
import 'package:my_app/services/estimate_service.dart';

import 'estimate_result.dart';

class EstimateSearch extends StatefulWidget {
  const EstimateSearch({super.key});

  @override
  State<EstimateSearch> createState() => _EstimateSearchState();
}

class _EstimateSearchState extends State<EstimateSearch> {
  var estimates;

  @override
  void initState() {
    setEstimates();
  }

  void setEstimates() async {
    EstimateService estimateService = EstimateService();
    var a = await estimateService.getAllEstimates();
    setState(() {
      estimates = a;
    });
  }

  @override
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const AppHeader(),
        body: Column(
          children: [
            Form(
              key: formKey,
              child: Column(
                children: [
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/create');
                      },
                      child: const Text('次の画面へ'),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        print("ERRO");
                        return 'Please enter some text';
                      }
                      return null;
                    },
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Enter a search term',
                    ),
                  ),
                  TextFormField(
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Enter a search term'),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {}
                      },
                      child: estimates != null
                          ? Text(estimates[0]['status'])
                          : Text('BUtton'))
                ],
              ),
            ),
            EstimateResult(estimates, key: UniqueKey())
          ],
        ));
  }
}
