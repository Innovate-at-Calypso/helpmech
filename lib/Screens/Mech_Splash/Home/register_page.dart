import 'package:flutter/material.dart';
import 'package:helpmech/Services/Provider/mech_provider.dart';
import 'package:helpmech/Services/shop_services.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _location = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _shopName = TextEditingController();
  final TextEditingController _ownerName = TextEditingController();
  final TextEditingController _phoneNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text('Register Your Shop'),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: _location,
                      decoration: InputDecoration(
                        labelText: 'Location Details',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: _pincode,
                      decoration: InputDecoration(
                        labelText: 'Enter Your Pincode',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: _shopName,
                      decoration: InputDecoration(
                        labelText: 'Shop Name',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: _ownerName,
                      decoration: InputDecoration(
                        labelText: 'Enter Shop Owner Name',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: TextFormField(
                      controller: _phoneNumber,
                      decoration: InputDecoration(
                        labelText: 'Phone Number',
                        labelStyle: TextStyle(
                            color: Theme.of(context).colorScheme.secondary),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context).colorScheme.secondary),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondary
                                  .withOpacity(0.5)),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      ShopServices.shopRegister(
                          location: _location.text,
                          pincode: _pincode.text,
                          shopName: _shopName.text,
                          ownerName: _ownerName.text,
                          phoneNumber: _phoneNumber.text,
                          token:
                              Provider.of<MechProvider>(context, listen: false)
                                  .mechUser
                                  .token,
                          context: context);
                    },
                    child: Text("Register My Shop"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
