import '../../../../core/routes/imports.dart';

class MySettingsScreen extends StatefulWidget {
  const MySettingsScreen({super.key});

  @override
  State<MySettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  // Controller'lar
  final TextEditingController _nameController =
      TextEditingController(text: "Kelvin Klein");
  final TextEditingController _usernameController =
      TextEditingController(text: "@kelvinklein");
  final TextEditingController _passwordController =
      TextEditingController(text: "********");
  String _selectedLanguage = "EN"; // Tanlangan til
  Color _selectedColor = Colors.blue; // Tanlangan rang
  File? selectedImage;
  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildHeader(),
              const SizedBox(height: 20),
              _buildProfileSection(),
              const SizedBox(height: 30),
              _buildLanguageSection(),
              const SizedBox(height: 30),
              _buildThemeColorSection(),
            ],
          ),
        ),
      ),
    );
  }

  // Header qismi
  Widget _buildHeader() {
    return const Text(
      "My Settings",
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: Colors.black87,
      ),
    );
  }

  // Profil bo'limi
  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Profile",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Your personal information and account security settings.",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : AssetImage(AppImages.lesson1),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    pickImagefromGsllery();
                  },
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Change Photo",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: const Text(
                    "Delete Photo",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 16),
        _buildTextField("Name", _nameController),
        const SizedBox(height: 16),
        _buildTextField("Username", _usernameController),
        const SizedBox(height: 16),
        _buildTextField("Password", _passwordController, isPassword: true),
      ],
    );
  }

  // TextField yaratish uchun yordamchi funksiya
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          obscureText: isPassword,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: const BorderSide(color: Colors.grey),
            ),
            suffixIcon: isPassword
                ? const Icon(Icons.visibility, color: Colors.grey)
                : null,
          ),
        ),
      ],
    );
  }

  // Til tanlash bo'limi
  Widget _buildLanguageSection() {
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
            _buildLanguageButton("RU"),
            const SizedBox(width: 8),
            _buildLanguageButton("EN"),
            const SizedBox(width: 8),
            _buildLanguageButton("UZ"),
          ],
        ),
      ],
    );
  }

  // Til tugmasi yaratish uchun yordamchi funksiya
  Widget _buildLanguageButton(String language) {
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

  // Tema rangi bo'limi
  Widget _buildThemeColorSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Theme Color",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          "Choose a preferred theme for the app",
          style: TextStyle(
            fontSize: 14,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            _buildColorButton(Colors.cyan),
            const SizedBox(width: 8),
            _buildColorButton(Colors.blue),
            const SizedBox(width: 8),
            _buildColorButton(Colors.purple),
            const SizedBox(width: 8),
            _buildColorButton(Colors.red),
            const SizedBox(width: 8),
            _buildColorButton(Colors.indigo),
          ],
        ),
      ],
    );
  }

  // Rang tugmasi yaratish uchun yordamchi funksiya
  Widget _buildColorButton(Color color) {
    bool isSelected = _selectedColor == color;
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedColor = color;
        });
      },
      child: Container(
        width: 30,
        height: 30,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected ? Border.all(color: Colors.black, width: 2) : null,
        ),
      ),
    );
  }

  Future pickImagefromGsllery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      selectedImage = File(returnedImage?.path ?? "");
    });
  }
}
