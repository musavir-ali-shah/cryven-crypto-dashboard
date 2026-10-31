import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';

class QuickTradeCard extends StatefulWidget {
  const QuickTradeCard({super.key});

  @override
  State<QuickTradeCard> createState() => _QuickTradeCardState();
}

class _QuickTradeCardState extends State<QuickTradeCard> {
  bool _isBuySelected = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Buy / Sell Selector
        Row(
          children: [
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(4),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isBuySelected = true),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: _isBuySelected ? AppColors.cardSurfaceLight : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'BUY',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: _isBuySelected ? AppColors.textWhite : AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: () => setState(() => _isBuySelected = false),
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            color: !_isBuySelected ? AppColors.cardSurfaceLight : Colors.transparent,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Text(
                            'SELL',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: !_isBuySelected ? AppColors.textWhite : AppColors.textMuted,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: const Icon(LucideIcons.settings, size: 18, color: AppColors.textWhite),
            ),
          ],
        ),

        const SizedBox(height: 16),

        // Input Currency Cards with Center Swap
        Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                _buildCurrencyInputCard(
                  title: 'You Buy',
                  symbol: 'BTC',
                  amount: '18.959',
                  balance: '487.95',
                  iconColor: const Color(0xFFF7931A),
                  iconData: LucideIcons.bitcoin,
                ),
                const SizedBox(height: 12),
                _buildCurrencyInputCard(
                  title: 'You Spend',
                  symbol: 'USD',
                  amount: '10,272',
                  balance: '15,812.49',
                  iconColor: AppColors.primaryBlue,
                  iconData: LucideIcons.dollarSign,
                ),
              ],
            ),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.borderSubtle, width: 2),
              ),
              child: const Icon(LucideIcons.arrowUpDown, size: 14, color: AppColors.textWhite),
            ),
          ],
        ),

        const SizedBox(height: 18),

        // Action Buttons
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryBlue,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
              elevation: 0,
            ),
            child: const Text('Buy ETH', style: TextStyle(fontWeight: FontWeight.w600, color: Colors.white)),
          ),
        ),
        const SizedBox(height: 10),
        SizedBox(
          width: double.infinity,
          height: 48,
          child: OutlinedButton(
            onPressed: () {},
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: AppColors.borderSubtle),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            ),
            child: const Text('Connect Wallet', style: TextStyle(fontWeight: FontWeight.w600, color: AppColors.textWhite)),
          ),
        ),
      ],
    );
  }

  Widget _buildCurrencyInputCard({
    required String title,
    required String symbol,
    required String amount,
    required String balance,
    required Color iconColor,
    required IconData iconData,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  CircleAvatar(radius: 12, backgroundColor: iconColor, child: Icon(iconData, size: 14, color: Colors.white)),
                  const SizedBox(width: 8),
                  Text(symbol, style: AppTypography.titleMedium),
                ],
              ),
              Text(title, style: AppTypography.bodySmall),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Expanded(
                child: Text(
                  amount,
                  style: AppTypography.heading1.copyWith(fontSize: 24),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text('Balance', style: TextStyle(fontSize: 10, color: AppColors.textMuted)),
                  Text(balance, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w500, color: AppColors.textWhite)),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}