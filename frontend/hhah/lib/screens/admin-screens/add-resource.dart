import 'package:flutter/material.dart';
import 'package:hhah/services/admin_service.dart';
import 'package:hhah/navigation/screen_types.dart';
import 'package:hhah/core/storage/secure_storage.dart';

class AddResource extends StatefulWidget {
  const AddResource({
    super.key,
    required this.isEnglish,
    required this.switchScreen,
  });

  final bool isEnglish;
  final Function(ScreenType) switchScreen;

  @override
  State<AddResource> createState() => _AddResourcePageState();
}

class _AddResourcePageState extends State<AddResource> {
  final _formKey = GlobalKey<FormState>();

  final _titleController = TextEditingController();
  final _linkController = TextEditingController();

  String _selectedType = 'VIDEO';
  String _selectedCategory = 'CHD_WEBSITES';

  bool _isLoading = false;

  // ---------- ENUM VALUES ----------
  final List<String> _types = ['VIDEO', 'ARTICLE', 'MAP', 'LINK'];

  final List<String> _categories = [
    // CHD
    'CHD_WEBSITES',
    'CHD_VIDEOS',
    'CHD_ARTICLES',

    // CHILD CARE
    'CHILD_CARE_FORMULA_MIXES',
    'CHILD_CARE_MEDICATION',
    'CHILD_CARE_DRAIN_CARE',
    'CHILD_CARE_WOUND_CARE',

    // SPIRITUAL
    'SP_DEVOTIONALS',
    'SP_RESOURCES',

    // HOSPITAL HELPLINE
    'HOSPITAL_HELPLINE_WEBLINKS',
    'HOSPITAL_HELPLINE_AREA_MAP',
    'HOSPITAL_HELPLINE_SHOWERS',
    'HOSPITAL_HELPLINE_CAFETERIA_MENU',

    // CHILD CARE INFORMATION
    'CHILD_CARE_INFORMATION_ARTICLES',
  ];

  // ---------- INPUT DECORATION ----------
  InputDecoration _inputDecoration(String label) {
    return InputDecoration(
      labelText: label,
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
    );
  }

  // ---------- SUBMIT ----------
  Future<void> _submit() async {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    setState(() => _isLoading = true);

    try {
      // final token = await SecureStorage.getToken();
      // final role = await SecureStorage.getRole();

      // print('--- DEBUG AUTH ---');
      // print('JWT before request: $token');
      // print('Role stored: $role');
      // print('------------------');
      await AdminService.createResource(
        title: _titleController.text.trim(),
        language: widget.isEnglish ? 'EN' : 'AR',
        type: _selectedType,
        category: _selectedCategory,
        link: _linkController.text.trim(),
      );

      if (!mounted) return;

      widget.switchScreen(ScreenType.adminMainMenu);
    } catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.toString())));
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  // ---------- DISPOSE ----------
  @override
  void dispose() {
    _titleController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  // ---------- UI ----------
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Form(
        key: _formKey,
        child: SizedBox(
          width: 400,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // TITLE
              TextFormField(
                controller: _titleController,
                decoration: _inputDecoration('Title'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Title is required' : null,
              ),

              const SizedBox(height: 16),

              // TYPE
              DropdownButtonFormField<String>(
                value: _selectedType,
                decoration: _inputDecoration('Type'),
                items: _types
                    .map(
                      (type) =>
                          DropdownMenuItem(value: type, child: Text(type)),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => _selectedType = value!);
                },
              ),

              const SizedBox(height: 16),

              // CATEGORY
              DropdownButtonFormField<String>(
                value: _selectedCategory,
                decoration: _inputDecoration('Category'),
                items: _categories
                    .map(
                      (category) => DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  setState(() => _selectedCategory = value!);
                },
              ),

              const SizedBox(height: 16),

              // LINK
              TextFormField(
                controller: _linkController,
                decoration: _inputDecoration('Link'),
                validator: (value) =>
                    value == null || value.isEmpty ? 'Link is required' : null,
              ),

              const SizedBox(height: 24),

              // SUBMIT
              ElevatedButton(
                onPressed: _isLoading ? null : _submit,
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text('Create Resource'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
