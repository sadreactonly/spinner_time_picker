import 'package:flutter/material.dart';

// Define a StatefulWidget for a time element picker widget
class SpinnerNumericPicker extends StatefulWidget {
  // Initialize parameters for the time element picker
  final int? initValue; // Initial value of the picker
  final int maxValue; // Maximum value of the picker
  final double height; // Height of the widget
  final double width; // Width of the widget
  final double digitHeight; // Height of individual time elements
  final TextStyle selectedTextStyle; // Text style for selected time elements
  final TextStyle nonSelectedTextStyle; // Text style for non-selected time elements
  final Color spinnerBgColor; // Background color of the widget
  final void Function(int value) onSelectedItemChanged; // Callback for value selection

  const SpinnerNumericPicker({
    Key? key,
    this.initValue,
    required this.maxValue,
    required this.height,
    required this.width,
    required this.digitHeight,
    required this.selectedTextStyle,
    required this.nonSelectedTextStyle,
    required this.onSelectedItemChanged,
    required this.spinnerBgColor,
  }) : super(key: key);

  @override
  State<SpinnerNumericPicker> createState() => _SpinnerNumericPickerState();
}

// Define the state for the TimeElementPicker widget
class _SpinnerNumericPickerState extends State<SpinnerNumericPicker> {
  late FixedExtentScrollController scrollController;
  late int _selectedValue;

  @override
  void initState() {
    // Initialize state variables and scroll controller
    setState(() {
      _selectedValue = widget.initValue ?? 0; // Set the initial value or default to 0
      scrollController = FixedExtentScrollController(initialItem: _selectedValue);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // Build the time element picker layout
    return Container(
      height: widget.height,
      width: widget.width,
      decoration: BoxDecoration(
        color: widget.spinnerBgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListWheelScrollView.useDelegate(
        controller: scrollController,
        itemExtent: widget.digitHeight, // Height of each item in the picker
        physics: const FixedExtentScrollPhysics(),
        childDelegate: ListWheelChildBuilderDelegate(
          builder: (context, index) {
            final wrappedIndex = index % widget.maxValue; // Wrap around the values
            return Center(
              child: Text(
                wrappedIndex.toString().padLeft(2, '0'), // Display with leading zero
                style: wrappedIndex == _selectedValue ? widget.selectedTextStyle : widget.nonSelectedTextStyle,
              ),
            );
          },
        ),
        onSelectedItemChanged: (index) {
          setState(() {
            _selectedValue = index % widget.maxValue;
          });
          widget.onSelectedItemChanged(_selectedValue); // Notify the parent about the value change
        },
      ),
    );
  }
}
