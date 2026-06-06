import 'package:flutter/material.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String selectedPrice = 'Hourly';
  String selectedDistance = 'Under 5km';

  int selectedRating = 0;

  final List<String> facilities = [
    'Elevator',
    'Hot water',
    'Cooking place',
    'Parking',
    'Cleaning service',
    'Nearby stores',
  ];

  final Set<String> selectedFacilities = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF7F7F7),

      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 30),
              decoration: const BoxDecoration(
                color: Color(0xff1E1D57),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(35),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.remove_circle_outline,
                          color: Colors.white,
                        ),
                      ),

                      const Expanded(
                        child: Center(
                          child: Text(
                            'Filter',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 40),
                    ],
                  ),

                  const SizedBox(height: 20),

                  Container(
                    height: 55,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Row(
                      children: [
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: 'Looking for room',
                            ),
                          ),
                        ),

                        Icon(Icons.search, color: Color(0xff4D5BCB)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sort price by',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    _dropdownCard(
                      value: selectedPrice,
                      items: const ['Hourly', 'Daily', 'Monthly'],
                      onChanged: (value) {
                        setState(() {
                          selectedPrice = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Distance',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 10),

                    _dropdownCard(
                      value: selectedDistance,
                      items: const ['Under 5km', 'Under 10km', 'Under 20km'],
                      onChanged: (value) {
                        setState(() {
                          selectedDistance = value!;
                        });
                      },
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Rating',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _ratingChip(0, 'All'),
                        _ratingChip(5, '⭐ 5'),
                        _ratingChip(4, '⭐ 4'),
                        _ratingChip(3, '⭐ 3'),
                        _ratingChip(2, '⭐ 2'),
                        _ratingChip(1, '⭐ 1'),
                      ],
                    ),

                    const SizedBox(height: 24),

                    const Text(
                      'Facilities',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),

                    const SizedBox(height: 12),

                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: [
                        _facilityChip('All'),

                        ...facilities.map(_facilityChip),
                      ],
                    ),

                    const SizedBox(height: 40),

                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xff4D5BCB),
                        ),
                        child: const Text(
                          'Apply',
                          style: TextStyle(color: Colors.white),
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

  Widget _dropdownCard({
    required String value,
    required List<String> items,
    required ValueChanged<String?> onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: DropdownButton<String>(
        value: value,
        isExpanded: true,
        underline: const SizedBox(),
        items: items
            .map((e) => DropdownMenuItem(value: e, child: Text(e)))
            .toList(),
        onChanged: onChanged,
      ),
    );
  }

  Widget _ratingChip(int value, String label) {
    final selected = selectedRating == value;

    return ChoiceChip(
      label: Text(label),
      selected: selected,
      onSelected: (_) {
        setState(() {
          selectedRating = value;
        });
      },
    );
  }

  Widget _facilityChip(String facility) {
    final selected = selectedFacilities.contains(facility);

    return FilterChip(
      label: Text(facility),
      selected: selected,
      onSelected: (_) {
        setState(() {
          if (selected) {
            selectedFacilities.remove(facility);
          } else {
            selectedFacilities.add(facility);
          }
        });
      },
    );
  }
}
