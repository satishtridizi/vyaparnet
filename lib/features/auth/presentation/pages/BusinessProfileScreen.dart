import 'package:flutter/material.dart';
import 'package:vyaparnet/features/auth/presentation/pages/sign_in_page.dart';

class BusinessProfileScreen extends StatefulWidget {
  const BusinessProfileScreen({super.key});

  @override
  State<BusinessProfileScreen> createState() => _BusinessProfileScreenState();
}

class _BusinessProfileScreenState extends State<BusinessProfileScreen> {
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

  List<String> uploadedImages = [
    "https://picsum.photos/200",
    "https://picsum.photos/201",
  ];

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
  }) {
    return TextFormField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
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
                  label: Text(e),
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
        OutlinedButton.icon(
          onPressed: onAdd,
          icon: const Icon(Icons.add),
          label: const Text("Add More"),
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
          (image) => ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.network(
              image,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              border: Border.all(
                color: Colors.indigo,
                style: BorderStyle.solid,
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.add),
                SizedBox(height: 4),
                Text("Add More"),
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
        centerTitle: true,
        title: const Text("VyaparNet"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          padding: const EdgeInsets.all(20),
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
                      .map((e) => DropdownMenuItem(value: e, child: Text(e)))
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

                customTextField(controller: descriptionController, maxLines: 5),

                const SizedBox(height: 20),

                sectionTitle("Services or Products Offered"),

                buildChipSection(items: products, onAdd: () {}),

                const SizedBox(height: 20),

                sectionTitle("Serviceable Areas"),

                buildChipSection(items: serviceAreas, onAdd: () {}),

                const SizedBox(height: 20),

                sectionTitle("Business Address"),

                customTextField(controller: addressController),

                const SizedBox(height: 20),

                sectionTitle("Landmark"),

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
                  height: 55,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff3F4CCB),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (_) => const SignInPage()),
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
      ),
    );
  }
}
