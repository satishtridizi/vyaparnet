import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/sign_in_page.dart';
import 'package:dotted_border/dotted_border.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
  final ImagePicker _picker = ImagePicker();

  Future<void> pickImage() async {
    final XFile? image = await _picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );

    if (image != null) {
      setState(() {
        uploadedImages.add(File(image.path));
      });
    }
  }

  Future<void> showAddItemDialog({
    required String title,
    required List<String> targetList,
  }) async {
    final controller = TextEditingController();

    await showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text(title),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(hintText: 'Enter value'),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.trim().isNotEmpty) {
                setState(() {
                  targetList.add(controller.text.trim());
                });
              }
              Navigator.pop(context);
            },
            child: const Text('Add'),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    descriptionController.text =
        "Sri Anu Furnitures and Furnishing (est. 1994) is a prominent Hyderabad-based manufacturer, wholesaler, and retailer of premium home and office furniture. Operating over 300,000 sq. ft. of showroom space, they offer customized and branded furniture including sofas, beds, and dining sets directly to consumers, specializing in durable, stylish pieces designed to fit various budgets.";
  }

  final formKey = GlobalKey<FormState>();

  final TextEditingController businessNameController = TextEditingController();

  final TextEditingController descriptionController = TextEditingController();

  final TextEditingController addressController = TextEditingController();

  final TextEditingController landmarkController = TextEditingController();

  final TextEditingController pincodeController = TextEditingController();

  String selectedCategory = "Décor and Furnishings";
  String selectedCity = "Hyderabad";

  List<String> categories = [
    "Décor and Furnishings",
    "Electronics",
    "Fashion",
    "Food",
  ];

  List<String> cities = ["Hyderabad", "Bangalore", "Chennai", "Mumbai"];
  List<File> uploadedImages = [];
  List<String> products = [
    "Dining Table",
    "Sofa",
    "King Size Bed",
    "Queen Size Bed",
  ];

  List<String> serviceAreas = ["Madhapur", "Begumpet", "Koti", "Secunderabad"];

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
      ),
    );
  }

  Widget customTextField({
    required TextEditingController controller,
    int maxLines = 1,
    String? hint,
    Widget? suffixIcon,
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        suffixIcon: suffixIcon,
        filled: true,
        fillColor: Colors.grey.shade100,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(14),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget buildChipSection({
    required List<String> items,
    required VoidCallback onAdd,
  }) {
    return Column(
      children: [
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: items
              .map(
                (e) => Chip(
                  backgroundColor: const Color(0xffF4F1FF),
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  visualDensity: VisualDensity.compact,
                  label: Text(e, style: const TextStyle(fontSize: 12)),
                  deleteIconColor: const Color(0xff5B5FEF),
                  onDeleted: () {
                    setState(() {
                      items.remove(e);
                    });
                  },
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: onAdd,
          child: DottedBorder(
            options: RoundedRectDottedBorderOptions(
              radius: const Radius.circular(8),
              dashPattern: const [4, 3],
              strokeWidth: 1.5,
              color: const Color(0xff5B5FEF),
            ),
            child: Container(
              width: double.infinity,
              height: 42,
              alignment: Alignment.center,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.add, size: 18, color: Color(0xff5B5FEF)),
                  SizedBox(width: 6),
                  Text(
                    'Add More',
                    style: TextStyle(
                      color: Color(0xff5B5FEF),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildImageSection() {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: [
        ...uploadedImages.map(
          (image) => Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.file(
                  image,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      uploadedImages.remove(image);
                    });
                  },
                  child: const CircleAvatar(
                    radius: 10,
                    backgroundColor: Colors.red,
                    child: Icon(Icons.close, size: 12, color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),

        GestureDetector(
          onTap: pickImage,
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: const Color(0xff5B5FEF)),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add, color: Color(0xff5B5FEF)),
                SizedBox(height: 4),
                Text("Add More", style: TextStyle(color: Color(0xff5B5FEF))),
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff11173D),
      appBar: AppBar(
        backgroundColor: const Color(0xff11173D),
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Image.asset('assets/logo.png', height: 80),

            const SizedBox(height: 12),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
              ),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    sectionTitle("Business Name"),
                    customTextField(
                      controller: businessNameController,
                      hint: "Anu Furnishing",
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Select Category"),

                    DropdownButtonFormField(
                      value: selectedCategory,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      items: categories
                          .map(
                            (e) => DropdownMenuItem(value: e, child: Text(e)),
                          )
                          .toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedCategory = value.toString();
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Upload Pictures"),
                    buildImageSection(),

                    const SizedBox(height: 20),

                    sectionTitle("Business Description"),

                    customTextField(
                      controller: descriptionController,
                      maxLines: 8,
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Services or Products Offered"),

                    buildChipSection(
                      items: products,
                      onAdd: () {
                        showAddItemDialog(
                          title: 'Add Product',
                          targetList: products,
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Serviceable Areas"),

                    buildChipSection(
                      items: serviceAreas,
                      onAdd: () {
                        showAddItemDialog(
                          title: 'Add Service Area',
                          targetList: serviceAreas,
                        );
                      },
                    ),

                    const SizedBox(height: 20),

                    sectionTitle("Business Address"),

                    customTextField(
                      controller: addressController,
                      hint: "Venkateswara Heights, Nacharam...",
                      suffixIcon: const Icon(
                        Icons.location_on,
                        color: Color(0xff5B5FEF),
                      ),
                    ),

                    const SizedBox(height: 20),
                    sectionTitle("Landmark (Optional)"),

                    customTextField(controller: landmarkController),

                    const SizedBox(height: 20),

                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sectionTitle("City"),

                              DropdownButtonFormField(
                                value: selectedCity,
                                decoration: const InputDecoration(
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      color: Color(0xff5B5FEF),
                                    ),
                                  ),
                                ),
                                items: cities
                                    .map(
                                      (e) => DropdownMenuItem(
                                        value: e,
                                        child: Text(e),
                                      ),
                                    )
                                    .toList(),
                                onChanged: (value) {
                                  setState(() {
                                    selectedCity = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              sectionTitle("Pincode"),
                              customTextField(controller: pincodeController),
                            ],
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 30),

                    SizedBox(
                      width: double.infinity,
                      height: 60,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff3F4CCB),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        onPressed: () {
                          Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (_) => const SignInPage(),
                            ),
                            (route) => false,
                          );
                        },
                        child: const Text(
                          "Create",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
