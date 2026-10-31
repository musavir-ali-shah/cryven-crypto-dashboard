import 'package:flutter/material.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../models/crypto_asset.dart';

class AssetTable extends StatelessWidget {
  const AssetTable({super.key});

  @override
  Widget build(BuildContext context) {
    final assets = CryptoAsset.mockAssets;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: AppColors.borderSubtle),
      ),
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minWidth: constraints.maxWidth < 650 ? 650 : constraints.maxWidth,
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                    child: Row(
                      children: const [
                        SizedBox(width: 30, child: Text('#', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
                        SizedBox(width: 150, child: Text('Exchange', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
                        SizedBox(width: 110, child: Text('BNB/USD', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
                        SizedBox(width: 120, child: Text('Amount', style: TextStyle(color: AppColors.textMuted, fontSize: 12))),
                        SizedBox(width: 110, child: Center(child: Text('Diff', style: TextStyle(color: AppColors.textMuted, fontSize: 12)))),
                        SizedBox(width: 110, child: Align(alignment: Alignment.centerRight, child: Text('Volume', style: TextStyle(color: AppColors.textMuted, fontSize: 12)))),
                      ],
                    ),
                  ),
                  const Divider(color: AppColors.borderSubtle, height: 16),
                  Column(
                    children: assets.map((asset) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.cardSurfaceLight.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 30,
                              child: Text('${asset.id}', style: const TextStyle(color: AppColors.textMuted, fontSize: 13)),
                            ),
                            SizedBox(
                              width: 150,
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    radius: 12,
                                    backgroundColor: _getAssetColor(asset.symbol),
                                    child: Text(
                                      asset.iconLetter,
                                      style: const TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Expanded(
                                    child: Text(
                                      asset.name,
                                      overflow: TextOverflow.ellipsis,
                                      style: AppTypography.titleMedium.copyWith(fontSize: 13),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 110,
                              child: Text('\$${asset.price.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textWhite, fontSize: 13, fontWeight: FontWeight.w500)),
                            ),
                            SizedBox(
                              width: 120,
                              child: Text('${asset.amount} ${asset.symbol}', style: const TextStyle(color: AppColors.textMuted, fontSize: 12)),
                            ),
                            SizedBox(
                              width: 110,
                              child: Center(child: _buildStatusBadge(asset.status)),
                            ),
                            SizedBox(
                              width: 110,
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text('\$${asset.volume.toStringAsFixed(2)}', style: const TextStyle(color: AppColors.textWhite, fontSize: 13, fontWeight: FontWeight.w500)),
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Color _getAssetColor(String symbol) {
    switch (symbol) {
      case 'BTC': return const Color(0xFFF7931A);
      case 'USDT': return const Color(0xFF26A17B);
      case 'ETH': return const Color(0xFF627EEA);
      case 'DASH': return const Color(0xFF008CE7);
      default: return AppColors.primaryBlue;
    }
  }

  Widget _buildStatusBadge(String status) {
    Color borderColor;
    Color textColor;

    switch (status) {
      case 'Trending':
        borderColor = const Color(0xFF00E5FF);
        textColor = const Color(0xFF00E5FF);
        break;
      case 'Limited':
        borderColor = const Color(0xFF3861FB);
        textColor = const Color(0xFF3861FB);
        break;
      case 'Rising':
        borderColor = const Color(0xFFFF5252);
        textColor = const Color(0xFFFF5252);
        break;
      default:
        borderColor = AppColors.textMuted;
        textColor = AppColors.textMuted;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: borderColor.withOpacity(0.6), width: 1.2),
      ),
      child: Text(
        status,
        style: TextStyle(color: textColor, fontSize: 11, fontWeight: FontWeight.w500),
      ),
    );
  }
}