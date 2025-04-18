import 'package:grin/view/main/profile/widget/all_functions.dart';
import 'package:path/path.dart' as path;

import '../../../../core/routes/imports.dart';

class MySettingsScreen extends StatefulWidget {
  const MySettingsScreen({super.key});

  @override
  State<MySettingsScreen> createState() => _MySettingsScreenState();
}

class _MySettingsScreenState extends State<MySettingsScreen> {
  // Controller'lar
  final TextEditingController _nameController = TextEditingController(
      text: HiveBoxes.userDatas.isNotEmpty
          ? HiveBoxes.userDatas.values.first.fullname
          : "no data");
  final TextEditingController _usernameController = TextEditingController(
      text: HiveBoxes.userDatas.isNotEmpty
          ? HiveBoxes.userDatas.values.first.phone_number
          : "no data");
  final TextEditingController _passwordController = TextEditingController(
      text: HiveBoxes.userDatas.isNotEmpty
          ? HiveBoxes.userDatas.values.first.user_password
          : "no data");
  String _selectedLanguage = "EN"; // Tanlangan til
  Color _selectedColor = Colors.blue; // Tanlangan rang
  File? selectedImage;
  bool _isPasswordVisible = false; // Password visibility state
  @override
  void initState() {
    super.initState();

    final imagePath = HiveBoxes.profilePhoto.get("profilePhoto");
    if (imagePath != null) {
      selectedImage = File(imagePath);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(),
      child: Scaffold(
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
      ),
    );
  }

  // Header qismi
  Widget _buildHeader() {
    return Text(
      S.of(context).strSettinges,
      style: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        color: Colors.black87,
      ),
    );
  }

  // Profil bo'limi
  Widget _buildProfileSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Text(
              S.of(context).strProfile,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            );
          },
        ),
        const SizedBox(height: 8),
        BlocBuilder<ProfileCubit, ProfileState>(
          builder: (context, state) {
            return Text(
              S.of(context).strCategory,
              style: const TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            );
          },
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: selectedImage != null
                  ? FileImage(selectedImage!)
                  : AssetImage(AppImages.no_photo),
            ),
            const SizedBox(width: 16),
            Column(
              children: [
                OutlinedButton(
                  onPressed: () {
                    pickImageFromGallery();
                    setState(() {});
                  },
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: Colors.blue),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      minimumSize: Size(wi(160), he(35))),
                  child: Text(
                    S.of(context).strChangePh,
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 14,
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      HiveBoxes.profilePhoto.clear();
                      selectedImage = null;
                    });
                  },
                  style: OutlinedButton.styleFrom(
                    minimumSize: Size(wi(160), he(35)),
                    side: const BorderSide(color: Colors.grey),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: Text(
                    S.of(context).strDelPh,
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
        _buildTextField(S.of(context).strName, _nameController),
        const SizedBox(height: 16),
        _buildTextField(S.of(context).strYourPhone, _usernameController),
        const SizedBox(height: 16),
        _buildTextField(S.of(context).strPassword, _passwordController,
            isPassword: true),
      ],
    );
  }

  // TextField yaratish uchun yordamchi funksiya
  Widget _buildTextField(String label, TextEditingController controller,
      {bool isPassword = false}) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              label,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: controller,
              obscureText: isPassword ? !_isPasswordVisible : false,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: label,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                suffixIcon: isPassword
                    ? IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                          color: Colors.grey,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible = !_isPasswordVisible;
                          });
                        },
                      )
                    : null,
              ),
            ),
          ],
        );
      },
    );
  }

  // Til tanlash bo'limi
// Til tanlash bo'limi
  Widget _buildLanguageSection() {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state.status == Status.SUCCESS) {
          // Til o'zgarganidan keyin qayta yuklash kerak
        }
      },
      builder: (context, state) {
        final currentLanguage = state.language.toUpperCase();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              S.of(context).strLanguage,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              S.of(context).strCustomizeLg,
              style: TextStyle(
                fontSize: 14,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildLanguageButton('RU'),
                const SizedBox(width: 8),
                _buildLanguageButton('EN'),
                const SizedBox(width: 8),
                _buildLanguageButton('UZ'),
              ],
            ),
          ],
        );
      },
    );
  }

// Til tugmasi yaratish uchun yordamchi funksiya
  Widget _buildLanguageButton(
    String language,
  ) {
    final lang = HiveBoxes.applanguage.get("language") ?? "uz";
    bool isSelected = language.toLowerCase() == lang.toLowerCase();
    return OutlinedButton(
      onPressed: () {
        context.read<ProfileCubit>().enterLang(language.toLowerCase());
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
        Text(
          S.of(context).strThemeColor,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          S.of(context).strChoosePreTheme,
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
            _buildColorButton(AppColors.red),
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

  /// Picks an image from the gallery, saves it locally, updates the selected
  /// image state, and stores the image path in Hive storage under 'profilePhoto'.
  Future pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage != null) {
      final savedImagePath = await saveImageToLocal(File(returnedImage.path));
      setState(() {
        selectedImage = File(savedImagePath);
      });

      // Hive'ga rasm yo‘lini saqlaymiz
      HiveBoxes.profilePhoto.put('profilePhoto', savedImagePath);
    }
  }

  Future<String> saveImageToLocal(File imageFile) async {
    final appDir = await getApplicationDocumentsDirectory();
    final fileName = path.basename(imageFile.path);
    final savedImage = await imageFile.copy('${appDir.path}/$fileName');
    return savedImage.path;
  }
}
