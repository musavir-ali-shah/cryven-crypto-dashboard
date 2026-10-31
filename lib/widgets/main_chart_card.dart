import 'dart:math';
import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/utils/responsive.dart';

class MainChartCard extends StatefulWidget {
  const MainChartCard({super.key});

  @override
  State<MainChartCard> createState() => _MainChartCardState();
}

class _MainChartCardState extends State<MainChartCard> {
  String _selectedRange = '1m';
  final List<String> _ranges = ['1h', '24h', '1w', '1m', '6m', '1y'];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.all(isMobile ? 16 : 24),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header Row (Wrap for Mobile responsiveness)
          Wrap(
            alignment: WrapAlignment.spaceBetween,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: 12,
            runSpacing: 12,
            children: [
              // Pair Selector
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: const BoxDecoration(
                      color: Color(0xFFF7931A),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(LucideIcons.bitcoin, size: 16, color: Colors.white),
                  ),
                  const SizedBox(width: 8),
                  Text('BTC/USD', style: AppTypography.titleMedium),
                  const SizedBox(width: 4),
                  const Icon(LucideIcons.chevronDown, size: 16, color: AppColors.textMuted),
                ],
              ),

              // Time Filters
              Container(
                padding: const EdgeInsets.all(3),
                decoration: BoxDecoration(
                  color: AppColors.cardSurfaceLight.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: _ranges.map((range) {
                    final isSelected = _selectedRange == range;
                    return GestureDetector(
                      onTap: () => setState(() => _selectedRange = range),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: isMobile ? 8 : 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: isSelected ? AppColors.cardSurfaceLight : Colors.transparent,
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: Text(
                          range,
                          style: TextStyle(
                            fontSize: isMobile ? 11 : 12,
                            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                            color: isSelected ? AppColors.textWhite : AppColors.textMuted,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          // Price Tag
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                '\$4,862.97',
                style: AppTypography.heading1.copyWith(
                  fontSize: isMobile ? 26 : 32,
                ),
              ),
              const SizedBox(width: 10),
              const Text(
                '+4.6%',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppColors.greenTrend,
                ),
              ),
            ],
          ),

          const SizedBox(height: 20),

          // Chart Area
          SizedBox(
            height: isMobile ? 220 : 300,
            child: Stack(
              children: [
                Positioned.fill(
                  child: CustomPaint(
                    painter: VolumeBarsPainter(),
                  ),
                ),
                LineChart(
                  LineChartData(
                    gridData: const FlGridData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: !isMobile,
                          reservedSize: 45,
                          interval: 200,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 100: return const Text('\$10k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 300: return const Text('\$80k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 500: return const Text('\$400k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 700: return const Text('\$800k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 900: return const Text('\$1,000k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 1100: return const Text('\$1,500k', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                      rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: isMobile ? 4 : 2,
                          getTitlesWidget: (value, meta) {
                            switch (value.toInt()) {
                              case 1: return const Text('Jul 25', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 4: return const Text('Aug 25', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 7: return const Text('Sep 25', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 10: return const Text('Oct 25', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                              case 13: return const Text('Nov 25', style: TextStyle(color: AppColors.textMuted, fontSize: 10));
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                    borderData: FlBorderData(show: false),
                    minX: 0,
                    maxX: 14,
                    minY: 0,
                    maxY: 1200,
                    lineBarsData: [
                      LineChartBarData(
                        spots: const [
                          FlSpot(0, 420),
                          FlSpot(2, 490),
                          FlSpot(4, 550),
                          FlSpot(5, 750),
                          FlSpot(7, 820),
                          FlSpot(8.5, 780),
                          FlSpot(10, 480),
                          FlSpot(12, 450),
                          FlSpot(14, 460),
                        ],
                        isCurved: true,
                        curveSmoothness: 0.35,
                        color: AppColors.primaryBlue,
                        barWidth: 3.5,
                        isStrokeCapRound: true,
                        dotData: FlDotData(
                          show: true,
                          checkToShowDot: (spot, barData) => spot.x == 7,
                          getDotPainter: (spot, percent, barData, index) =>
                              FlDotCirclePainter(
                                radius: 6,
                                color: AppColors.primaryBlue,
                                strokeWidth: 3,
                                strokeColor: Colors.white,
                              ),
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          gradient: LinearGradient(
                            colors: [
                              AppColors.primaryBlue.withOpacity(0.3),
                              AppColors.primaryBlue.withOpacity(0.0),
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ],
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

class VolumeBarsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFF1E283D).withOpacity(0.4)
      ..strokeWidth = 1.8;

    final random = Random(42);
    final count = 65;
    final spacing = size.width / count;

    for (int i = 4; i < count; i++) {
      final x = i * spacing;
      final heightFactor = (sin(i * 0.15).abs() * 0.6 + random.nextDouble() * 0.4);
      final barHeight = size.height * 0.7 * heightFactor;
      final yStart = size.height * 0.85 - barHeight;
      final yEnd = size.height * 0.85;

      canvas.drawLine(Offset(x, yStart), Offset(x, yEnd), paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}