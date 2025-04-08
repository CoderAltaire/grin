import 'package:flutter/material.dart';

class CustomLanguageSection extends StatefulWidget {
  final String selectedLanguage;
  const CustomLanguageSection({super.key, required this.selectedLanguage});

  @override
  State<CustomLanguageSection> createState() => _CustomLanguageSectionState();
}

class _CustomLanguageSectionState extends State<CustomLanguageSection> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Language",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Customize your language",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildLanguageButton("RU", widget.selectedLanguage),
            const SizedBox(width: 8),
            _buildLanguageButton("EN", widget.selectedLanguage),
            const SizedBox(width: 8),
            _buildLanguageButton("UZ", widget.selectedLanguage),
          ],
        ),
      ],
    );
  }

  Widget _buildLanguageButton(String language, String _selectedLanguage) {
    bool isSelected = _selectedLanguage == language;
    return OutlinedButton(
      onPressed: () {
        setState(() {
          _selectedLanguage = language;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: isSelected ? Colors.blue : Colors.transparent,
        side: BorderSide(color: isSelected ? Colors.blue : Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        language,
        style: TextStyle(
          color: isSelected ? Colors.white : Colors.black,
          fontSize: 14,
        ),
      ),
    );
  }
}
