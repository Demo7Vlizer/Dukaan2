// Import required Flutter material design package
import 'package:flutter/material.dart';

// Custom switch widget that can be toggled on/off, similar to a light switch
class CustomSwitch extends StatefulWidget {
  // Current state of the switch (on/off)
  final bool value;
  // Function to call when switch state changes
  final ValueChanged<bool>? onChanged;
  // Whether the switch can be interacted with
  final bool enabled;

  // Constructor to initialize the switch
  const CustomSwitch({
    super.key,
    required this.value,
    this.onChanged,
    this.enabled = true, // Switch is enabled by default
  });

  @override
  State<CustomSwitch> createState() => _CustomSwitchState();
}

// State class that handles the switch's behavior and appearance
class _CustomSwitchState extends State<CustomSwitch> {
  // Internal value to track switch state
  late bool _value;

  @override
  void initState() {
    super.initState();
    // Initialize switch value from widget property
    _value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    // GestureDetector to handle tap events on the switch
    return GestureDetector(
      // Only allow tapping if switch is enabled
      onTap: widget.enabled
          ? () {
              setState(() {
                // Toggle the switch value
                _value = !_value;
                // Notify parent widget of the change
                widget.onChanged?.call(_value);
              });
            }
          : null,
      child: Opacity(
        // Reduce opacity when switch is disabled
        opacity: widget.enabled ? 1.0 : 0.5,
        child: Container(
          // Switch background container dimensions
          width: 44,
          height: 24,
          padding: const EdgeInsets.all(2),
          decoration: BoxDecoration(
            // Rounded corners for the switch background
            borderRadius: BorderRadius.circular(12),
            // Blue when on, grey when off
            color: _value ? const Color(0xFF0E85FF) : Colors.grey.shade300,
          ),
          child: AnimatedAlign(
            // Smooth animation when toggling
            duration: const Duration(milliseconds: 200),
            // Move circle to right when on, left when off
            alignment: _value ? Alignment.centerRight : Alignment.centerLeft,
            // White circle that slides
            child: Container(
              width: 20,
              height: 20,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
