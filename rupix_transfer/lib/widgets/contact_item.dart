import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final String name;
  final String details;
  final bool isSelected;

  const ContactItem({
    super.key,
    required this.name,
    required this.details,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: const Color(0x21D9D9D9),
        borderRadius: BorderRadius.circular(15),
        border: isSelected
            ? Border.all(color: const Color(0xFFA34EFF), width: 1)
            : Border.all(color: Colors.transparent),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Theme.of(
              context,
            ).colorScheme.primary.withOpacity(0.1),
            child: Text(
              name.substring(0, 1),
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    color: Color(0xFF23303B),
                    fontSize: 16,
                    fontFamily: 'Aoboshi One',
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Text(
                  details,
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.35),
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
