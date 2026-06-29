import 'package:flutter/material.dart';
import 'package:flutter_application/features/analytics/model/chart_data.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Analytics extends StatelessWidget {
  const Analytics({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> dailyData = [
      {'day': 'Mon', 'value': 5.2},
      {'day': 'Tue', 'value': 6.8},
      {'day': 'Wed', 'value': 7.1},
      {'day': 'Thu', 'value': 4.9},
      {'day': 'Fri', 'value': 6.3},
      {'day': 'Sat', 'value': 8.1},
      {'day': 'Sun', 'value': 5.5},
    ];

    // We need a maximum value to calculate the width of our bars as a percentage.
    // Since the highest value is 8.1, 10.0 is a clean maximum.
    final double maxDailyValue = 10.0;

    final Color fadedGreen = Colors.white.withOpacity(0.3);
    final List<ChartData> chartData = [
      ChartData('1', 20, fadedGreen),
      ChartData('2', 35, fadedGreen),
      ChartData('3', 45, fadedGreen),
      ChartData('4', 30, fadedGreen),
      ChartData('5', 40, fadedGreen),
      ChartData('6', 35, fadedGreen),
      ChartData('7', 50, fadedGreen),
      ChartData('8', 35, fadedGreen),
      ChartData('9', 45, fadedGreen),
      ChartData('10', 60, Colors.white), // The highlighted active month
    ];
    return SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0),
          child: Column(
            children: [
              SizedBox(height: 28),
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'This week',
                        style: TextStyle(
                          color: Color(0xff8A8A80),
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      Text(
                        'Energy Usage',
                        style: TextStyle(
                          color: Color(0xff1A1A1A),
                          fontSize: 26,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 28),
              Container(
                padding: const EdgeInsets.all(
                  24,
                ), // Added padding for inner spacing
                decoration: BoxDecoration(
                  color: const Color(0xff2D4A3E),
                  borderRadius: BorderRadius.circular(24),
                ),
                child: Column(
                  // Changed from Row to Column
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // --- TEXT SECTION ---
                    const Text(
                      'Total this month',
                      style: TextStyle(
                        color: Color.fromARGB(150, 255, 255, 255),
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      "48.2 kWh",
                      style: TextStyle(
                        fontSize: 40,
                        color: Colors.white,
                        fontWeight:
                            FontWeight.w600, // Slightly bolder to match design
                      ),
                    ),
                    const SizedBox(height: 12),

                    // --- PERCENTAGE PILL ---
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.15),
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: const Text(
                        "↓ 12% vs last month",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: 30,
                    ), // Spacing between text and chart
                    // --- SYNCFUSION CHART SECTION ---
                    SizedBox(
                      height:
                          60, // Fixed height specifically for the mini-chart
                      child: SfCartesianChart(
                        margin:
                            EdgeInsets.zero, // Removes default chart padding
                        plotAreaBorderWidth:
                            0, // Removes the border box around the chart
                        // Hide both axes completely to match the design
                        primaryXAxis: CategoryAxis(isVisible: false),
                        primaryYAxis: NumericAxis(isVisible: false),

                        series: <CartesianSeries<ChartData, String>>[
                          ColumnSeries<ChartData, String>(
                            dataSource: chartData,
                            xValueMapper: (ChartData data, _) => data.x,
                            yValueMapper: (ChartData data, _) => data.y,
                            pointColorMapper: (ChartData data, _) =>
                                data.color, // Maps our custom colors
                            borderRadius: BorderRadius.circular(
                              4,
                            ), // Rounds the top of the columns
                            width: 0.6, // Makes the bars slightly thinner
                            spacing: 0.2, // Space between bars
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 28),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [Text('Daily breakdown')],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 1. The Title

                  // 2. The List
                  ListView.builder(
                    shrinkWrap:
                        true, // Prevents layout errors inside a scroll view
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dailyData.length,
                    itemBuilder: (context, index) {
                      final data = dailyData[index];
                      final double barPercentage =
                          data['value'] / maxDailyValue;

                      return Padding(
                        padding: const EdgeInsets.only(
                          bottom: 16.0,
                        ), // Space between rows
                        child: Row(
                          children: [
                            // --- 1. Day Text ---
                            SizedBox(
                              width:
                                  40, // Fixed width keeps all the bars perfectly aligned
                              child: Text(
                                data['day'],
                                style: const TextStyle(
                                  color: Color(0xff8A8A80),
                                  fontSize: 14,
                                ),
                              ),
                            ),

                            // --- 2. The Custom Progress Bar ---
                            Expanded(
                              child: Container(
                                height: 10, // Thickness of the bar
                                decoration: BoxDecoration(
                                  color: const Color(
                                    0xffF0F0EB,
                                  ), // Light beige background track
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                alignment: Alignment
                                    .centerLeft, // Forces the green bar to start on the left
                                // FractionallySizedBox sizes its child to a fraction of the total available space!
                                child: FractionallySizedBox(
                                  widthFactor: barPercentage,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                        0xff4A7C6B,
                                      ), // Dark green active bar
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 16),

                            // --- 3. Value Text ---
                            SizedBox(
                              width:
                                  50, // Fixed width so the numbers align nicely on the right
                              child: Text(
                                '${data['value']} \nkWh', // \n drops kWh to the next line if needed
                                textAlign: TextAlign.right,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 14,
                                  height: 1.2,
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  }
}

