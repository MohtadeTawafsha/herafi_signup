import 'package:flutter/material.dart';

import '../custome/custome_button.dart';

class RegisterCraftsman extends StatefulWidget {
  const RegisterCraftsman({Key? key}) : super(key: key);

  @override
  State<RegisterCraftsman> createState() => _RegisterCraftsmanState();
}

class _RegisterCraftsmanState extends State<RegisterCraftsman> {
  final _formKey = GlobalKey<FormState>();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _dobController = TextEditingController();
  final _addressController = TextEditingController();

  final List<String> _categories = ['السباكة', 'النجارة', 'الكهرباء', 'الطلاء', 'أخرى'];
  String? _selectedCategory;
  int _yearsOfExperience = 0; // Starting at 0 years

  void _incrementExperience() {
    setState(() {
      if (_yearsOfExperience < 60) {
        _yearsOfExperience++;
      }
    });
  }

  void _decrementExperience() {
    setState(() {
      if (_yearsOfExperience > 0) {
        _yearsOfExperience--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('تسجيل حساب الحرفي'),
          backgroundColor: Colors.blue,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: <Widget>[
                // First Name
                TextFormField(
                  controller: _firstNameController,
                  decoration: const InputDecoration(labelText: 'الاسم الأول'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الأول';
                    }
                    return null;
                  },
                ),

                // Last Name
                TextFormField(
                  controller: _lastNameController,
                  decoration: const InputDecoration(labelText: 'الاسم الأخير'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال الاسم الأخير';
                    }
                    return null;
                  },
                ),

                // Phone Number
                TextFormField(
                  controller: _phoneController,
                  decoration: const InputDecoration(labelText: 'رقم الهاتف'),
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال رقم الهاتف';
                    }
                    return null;
                  },
                ),

                // Date of Birth
                TextFormField(
                  controller: _dobController,
                  decoration: const InputDecoration(labelText: 'تاريخ الميلاد'),
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime(2100),
                    );
                    if (pickedDate != null) {
                      setState(() {
                        _dobController.text =
                        "${pickedDate.toLocal()}".split(' ')[0];
                      });
                    }
                  },
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال تاريخ الميلاد';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 10),

                // Years of Experience with Increment/Decrement Buttons
                Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: _decrementExperience,
                    ),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'سنوات الخبرة',
                          border: OutlineInputBorder(),
                        ),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        controller: TextEditingController(
                          text: _yearsOfExperience.toString(),
                        ),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: _incrementExperience,
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                // Category Dropdown
                DropdownButtonFormField<String>(
                  decoration: const InputDecoration(labelText: 'التخصص'),
                  value: _selectedCategory,
                  items: _categories.map((String category) {
                    return DropdownMenuItem<String>(
                      value: category,
                      child: Text(category),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    setState(() {
                      _selectedCategory = newValue;
                    });
                  },
                  validator: (value) {
                    if (value == null) {
                      return 'يرجى اختيار التخصص';
                    }
                    return null;
                  },
                ),

                // Address
                TextFormField(
                  controller: _addressController,
                  decoration: const InputDecoration(labelText: 'العنوان'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'يرجى إدخال العنوان';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 20),

                // Submit Button
                CustomButton(
                  icon: Icons.check,
                  label: 'تسجيل',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Add your submit functionality here
                      print("تم إرسال النموذج بنجاح! سنوات الخبرة: $_yearsOfExperience");
                    }
                  },
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _firstNameController.dispose();
    _lastNameController.dispose();
    _phoneController.dispose();
    _dobController.dispose();
    _addressController.dispose();
    super.dispose();
  }
}
