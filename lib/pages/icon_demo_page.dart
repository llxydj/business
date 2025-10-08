import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class IconDemoPage extends StatefulWidget {
  const IconDemoPage({super.key});

  @override
  State<IconDemoPage> createState() => _IconDemoPageState();
}

class _IconDemoPageState extends State<IconDemoPage> {
  double _iconSize = 50.0;
  Color _iconColor = Colors.teal;
  IconData _selectedIcon = Icons.pets;

  final List<Map<String, dynamic>> _availableIcons = [
    {'icon': Icons.pets, 'name': 'Pets'},
    {'icon': Icons.favorite, 'name': 'Favorite'},
    {'icon': Icons.star, 'name': 'Star'},
    {'icon': Icons.emoji_emotions, 'name': 'Emoji'},
    {'icon': MaterialCommunityIcons.cat, 'name': 'Cat (Custom)'},
    {'icon': MaterialCommunityIcons.dog, 'name': 'Dog (Custom)'},
    {'icon': MaterialCommunityIcons.paw, 'name': 'Paw (Custom)'},
    {'icon': FontAwesome.heart, 'name': 'Heart (FA)'},
  ];

  final List<Color> _availableColors = [
    Colors.teal,
    Colors.red,
    Colors.blue,
    Colors.orange,
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.amber,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dynamic Icon Demo'),
        backgroundColor: Colors.teal,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Icon display area
            Container(
              height: 250,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: Colors.grey[400]!, width: 2),
              ),
              child: Center(
                child: Icon(
                  _selectedIcon,
                  size: _iconSize,
                  color: _iconColor,
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Size slider
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Icon Size',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Poppins',
                          ),
                        ),
                        Text(
                          '${_iconSize.toInt()}px',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    Slider(
                      value: _iconSize,
                      min: 20,
                      max: 150,
                      divisions: 26,
                      label: _iconSize.toInt().toString(),
                      onChanged: (value) {
                        setState(() {
                          _iconSize = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Color picker
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Icon Color',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 12,
                      runSpacing: 12,
                      children: _availableColors.map((color) {
                        final isSelected = _iconColor == color;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _iconColor = color;
                            });
                          },
                          child: Container(
                            width: 50,
                            height: 50,
                            decoration: BoxDecoration(
                              color: color,
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: isSelected ? Colors.black : Colors.grey,
                                width: isSelected ? 3 : 1,
                              ),
                              boxShadow: isSelected
                                  ? [
                                      BoxShadow(
                                        color: color.withOpacity(0.5),
                                        blurRadius: 8,
                                        spreadRadius: 2,
                                      ),
                                    ]
                                  : null,
                            ),
                            child: isSelected
                                ? const Icon(Icons.check,
                                    color: Colors.white)
                                : null,
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 16),

            // Icon picker
            Card(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Select Icon',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Poppins',
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Includes Material Icons & Custom Vector Icons',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                        fontFamily: 'Roboto',
                      ),
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: _availableIcons.map((iconData) {
                        final isSelected = _selectedIcon == iconData['icon'];
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              _selectedIcon = iconData['icon'];
                            });
                          },
                          child: Container(
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? Colors.teal.withOpacity(0.2)
                                  : Colors.grey[200],
                              borderRadius: BorderRadius.circular(8),
                              border: Border.all(
                                color: isSelected ? Colors.teal : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                Icon(
                                  iconData['icon'],
                                  size: 32,
                                  color: isSelected ? Colors.teal : Colors.grey[700],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  iconData['name'],
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: isSelected ? Colors.teal : Colors.grey[700],
                                  ),
                                  textAlign: TextAlign.center,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            // Info card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.teal.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.teal),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.info_outline, color: Colors.teal),
                      SizedBox(width: 8),
                      Text(
                        'Dynamic Icon Features',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8),
                  Text('✓ Runtime size adjustment (20-150px)'),
                  Text('✓ Dynamic color selection'),
                  Text('✓ Material Icons support'),
                  Text('✓ Custom vector icons (flutter_vector_icons)'),
                  Text('✓ Live preview updates'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
