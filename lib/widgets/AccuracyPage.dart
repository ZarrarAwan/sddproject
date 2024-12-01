import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class AccuracyPage extends StatefulWidget {
  @override
  _AccuracyPageState createState() => _AccuracyPageState();
}

class _AccuracyPageState extends State<AccuracyPage> {
  // State variables
  bool? isHealed; // For "Healed or Not" question
  double accuracy = 0.0; // Default accuracy
  String? effectiveness; // Medicine effectiveness
  String? feedback; // Positive/Negative
  String? duration; // Treatment duration
  bool showResult = false; // To show result after calculation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.all(20),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.black, Color(0xFF1D9387)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Header Section
                const Text(
                  "Accuracy Check",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  "Monitor your healing progress",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 30),

                // Progress Indicator
                CircularPercentIndicator(
                  radius: 120,
                  lineWidth: 15,
                  percent: accuracy,
                  center: Text(
                    "${(accuracy * 100).toStringAsFixed(0)}%",
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  progressColor: Colors.white,
                  backgroundColor: Colors.grey[400]!,
                  circularStrokeCap: CircularStrokeCap.round,
                ),
                const SizedBox(height: 30),

                // Healing Status Question
                if (isHealed == null) ...[
                  const Text(
                    "Are you healed?",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildOptionButton("Yes", true),
                      const SizedBox(width: 10),
                      _buildOptionButton("Not Yet", false),
                    ],
                  ),
                ],

                // If healed, ask further questions
                if (isHealed == true && !showResult) ...[
                  _buildDropdown(
                    title: "Medicine Effectiveness",
                    items: ["Low", "Medium", "High"],
                    selectedValue: effectiveness,
                    onChanged: (value) {
                      setState(() {
                        effectiveness = value;
                      });
                    },
                  ),
                  _buildDropdown(
                    title: "Treatment Duration",
                    items: ["1 Week", "2 Weeks", "3 Weeks", "1 Month"],
                    selectedValue: duration,
                    onChanged: (value) {
                      setState(() {
                        duration = value;
                      });
                    },
                  ),
                  _buildDropdown(
                    title: "Feedback",
                    items: ["Positive", "Negative"],
                    selectedValue: feedback,
                    onChanged: (value) {
                      setState(() {
                        feedback = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: _calculateAccuracy,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "Calculate Accuracy",
                      style:
                      TextStyle(fontSize: 16, color: Color(0xFF1D9387)),
                    ),
                  ),
                ],

                // If not healed, show default accuracy
                if (isHealed == false) ...[
                  const Text(
                    "Healing is still in progress.",
                    style: TextStyle(fontSize: 16, color: Colors.white70),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                ],

                // Show results
                if (showResult) ...[
                  const SizedBox(height: 30),
                  _buildResultRow("Prescribed Medicines", effectiveness ?? "-"),
                  _buildResultRow("Treatment Duration", duration ?? "-"),
                  _buildResultRow("Feedback", feedback ?? "-"),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        // Reset all values
                        isHealed = null;
                        accuracy = 0.0;
                        effectiveness = null;
                        feedback = null;
                        duration = null;
                        showResult = false;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 12),
                    ),
                    child: const Text(
                      "Reset",
                      style:
                      TextStyle(fontSize: 16, color: Color(0xFF1D9387)),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ),
      ),
    );
  }

  // Function to Calculate Accuracy
  void _calculateAccuracy() {
    setState(() {
      // Default to 50% if duration is "2 Weeks" or "3 Weeks" and no proper response
      if (duration == "2 Weeks" || duration == "3 Weeks") {
        accuracy = 0.75;
      } else {
        // Base accuracy based on duration
        double baseAccuracy = 0.25;
        if (duration == "1 Week") {
          baseAccuracy = 0.5;
        } else if (duration == "1 Month") {
          baseAccuracy = 0.6;
        }

        // Adjust based on medicine effectiveness
        if (effectiveness == "Low") {
          baseAccuracy *= 0.75; // Reduce by 25%
        } else if (effectiveness == "High") {
          baseAccuracy *= 1.25; // Increase by 25%
        }

        // Further adjust based on feedback
        if (feedback == "Positive") {
          baseAccuracy += 0.2; // Add 20%
        } else if (feedback == "Negative") {
          baseAccuracy -= 0.2; // Subtract 20%
        }

        // Ensure accuracy is within 25% to 80% range
        accuracy = baseAccuracy.clamp(0.25, 0.8);
      }

      // Show result after calculation
      showResult = true;
    });
  }


  // Function to Build Option Buttons
  Widget _buildOptionButton(String label, bool value) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          isHealed = value;
          if (!value) {
            // Reset inputs and set default accuracy
            accuracy = 0.5;
            effectiveness = null;
            feedback = null;
            duration = null;
            showResult = false;
          }
        });
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: isHealed == value ? Colors.white : Colors.grey[700],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: isHealed == value ? Colors.black : Colors.white,
        ),
      ),
    );
  }

  // Function to Build Dropdowns
  Widget _buildDropdown({
    required String title,
    required List<String> items,
    required String? selectedValue,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, color: Colors.white70),
        ),
        DropdownButton<String>(
          isExpanded: true,
          value: selectedValue,
          dropdownColor: Colors.grey[800],
          style: const TextStyle(color: Colors.white),
          items: items
              .map((item) => DropdownMenuItem(
            value: item,
            child: Text(item),
          ))
              .toList(),
          onChanged: onChanged,
        ),
        const SizedBox(height: 10),
      ],
    );
  }

  // Function to Build Result Rows
  Widget _buildResultRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: const TextStyle(fontSize: 16, color: Colors.white70),
          ),
          Text(
            value,
            style: const TextStyle(fontSize: 16, color: Colors.white),
          ),
        ],
      ),
    );
  }
}
