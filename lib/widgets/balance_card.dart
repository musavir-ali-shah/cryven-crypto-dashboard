import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';

class BalanceCard extends StatelessWidget {
  const BalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(22),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
        gradient: const RadialGradient(
          center: Alignment(-0.8, -0.6),
          radius: 1.5,
          colors: [
            Color(0xFF1B2B4A),
            Color(0xFF0F1522),
          ],
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Available Balance', style: TextStyle(color: AppColors.textMuted, fontSize: 13)),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text('378.357', style: AppTypography.heading1.copyWith(fontSize: 32, letterSpacing: -0.5)),
              const SizedBox(width: 8),
              Text('BTC', style: AppTypography.titleMedium.copyWith(color: AppColors.textWhite)),
            ],
          ),
          const SizedBox(height: 32),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildMetricItem('Estimate fee', '6.32 USD'),
              _buildMetricItem('You will receive', '120.58 USD'),
              _buildMetricItem('Spread', '0%'),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildMetricItem(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(fontSize: 11, color: AppColors.textMuted)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: AppColors.textWhite)),
      ],
    );
  }
}