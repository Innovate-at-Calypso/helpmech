import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:helpmech/Services/location_services.dart';

class MechanicsSearch extends StatefulWidget {
  const MechanicsSearch({Key? key}) : super(key: key);

  @override
  State<MechanicsSearch> createState() => _MechanicsSearchState();
}

class _MechanicsSearchState extends State<MechanicsSearch> {
  TextEditingController _searchController = TextEditingController();
  String _searchQuery = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: TextField(
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Enter your Current Address',
            border: InputBorder.none,
          ),
          onChanged: (query) {
            setState(() {
              _searchQuery = query;
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.mic),
            onPressed: () {
              Fluttertoast.showToast(msg: "This feature is not available");
            },
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Center(
            child: ElevatedButton(
              onPressed: () async {
                String? location = await LocationServices.determinePosition();
                if (location != null) {
                  setState(() {
                    _searchController.text = location;
                    _searchQuery = location;
                  });
                } else {
                  Fluttertoast.showToast(msg: "Unable to determine location");
                }
              },
              child: Text("Use My Current Location"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Search results for: $_searchQuery',
              style: TextStyle(fontSize: 16),
            ),
          ),
          // Add the search results here
        ],
      ),
    );
  }
}
