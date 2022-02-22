import 'package:flutter/material.dart';
import 'package:validus_coin/model/profile.dart';
import 'package:validus_coin/services/profile_service.dart';
import 'package:validus_coin/utils/validators.dart';
import 'package:validus_coin/widgets/profile_textform_field.dart';
import 'package:validus_coin/widgets/profile_tile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  Profile profile = Profile();

  @override
  void initState() {
    super.initState();
    getProfileData();
  }

  Future<void> getProfileData() async {
    Map<String, dynamic> json = await ProfileService().getProfileData() as Map<String, dynamic>;
    profile = Profile.fromJson(json);
    _nameController.text = profile.name ?? '';
    _emailController.text = profile.email ?? '';
    _addressController.text = profile.address ?? '';

    setState(() {});
  }

  Future<void> updateProfileData({required String key, required String data}) async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> json = await ProfileService().updateProfile(key: key, data: data) as Map<String, dynamic>;
      profile = Profile.fromJson(json);
      Navigator.of(context).pop();
      setState(() {});
    }
  }

  Future<dynamic> bottomSheet({
    required String title,
    required Function onPressed,
    required TextFormField textFormField,
    String? description,
  }) {
    return showModalBottomSheet(
      backgroundColor: const Color(0XFF171734),
      context: context,
      builder: (BuildContext _) {
        return FractionallySizedBox(
          heightFactor: 0.9,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  Expanded(
                    child: Column(children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () => Navigator.of(context).pop(),
                              icon: const Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                          Text(
                            title,
                            style: const TextStyle(color: Colors.white, fontSize: 18),
                          ),
                          const SizedBox(width: 50)
                        ],
                      ),
                      const SizedBox(height: 50),
                      if (description != null)
                        Text(
                          description,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                        ),
                      if (description != null) const SizedBox(height: 15),
                      textFormField
                    ]),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 60,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0XFFFFB802),
                      ),
                      onPressed: () => onPressed(),
                      child: const Text(
                        'Save',
                        style: TextStyle(color: Colors.black, fontSize: 20),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      },
      isScrollControlled: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: Card(
          margin: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              profileTile(
                  title: 'Name',
                  subTitle: profile.name ?? '',
                  onPressed: () => bottomSheet(
                      title: 'Edit name',
                      textFormField: profileTextFormField(label: 'Name', controller: _nameController, validator: (value) => validateString(value!, 'Please Enter Name')),
                      onPressed: () => updateProfileData(key: 'name', data: _nameController.text))),
              profileTile(
                  title: 'Email',
                  subTitle: profile.email ?? '',
                  onPressed: () => bottomSheet(
                      title: 'Edit email',
                      description: 'We\'ll send you an email to confirm you new email address',
                      textFormField: profileTextFormField(label: 'Email', controller: _emailController, validator: (value) => validateEmail(value)),
                      onPressed: () => updateProfileData(key: 'email', data: _emailController.text))),
              profileTile(
                title: 'Address',
                subTitle: profile.address ?? '',
                onPressed: () => bottomSheet(
                    title: 'Edit address',
                    textFormField:
                        profileTextFormField(label: 'Address', controller: _addressController, validator: (value) => validateString(value, 'Please Enter Address')),
                    onPressed: () => updateProfileData(key: 'address', data: _addressController.text)),
              ),
            ],
          ),
        ));
  }
}
