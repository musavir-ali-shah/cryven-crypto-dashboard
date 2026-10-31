import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import '../../core/constants/app_colors.dart';
import '../../core/constants/app_typography.dart';
import '../../core/utils/responsive.dart';

class TopNavBar extends StatefulWidget {
  const TopNavBar({super.key});

  @override
  State<TopNavBar> createState() => _TopNavBarState();
}

class _TopNavBarState extends State<TopNavBar> {
  int _selectedIndex = 0;
  final List<String> _navItems = ['Dashboard', 'Market', 'Trade', 'Portfolio', 'Assets'];

  @override
  Widget build(BuildContext context) {
    final bool isMobile = Responsive.isMobile(context);

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 24,
        vertical: 16,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Logo Section
          Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: AppColors.primaryBlue,
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text(
                    'C',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text('Cryven', style: AppTypography.heading2),
            ],
          ),

          // Desktop/Tablet Navigation Pills
          if (!isMobile)
            Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: AppColors.cardSurface,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: AppColors.borderSubtle),
              ),
              child: Row(
                children: List.generate(_navItems.length, (index) {
                  final isSelected = _selectedIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => _selectedIndex = index),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
                      decoration: BoxDecoration(
                        color: isSelected ? AppColors.cardSurfaceLight : Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Text(
                            _navItems[index],
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                              color: isSelected ? AppColors.textWhite : AppColors.textMuted,
                            ),
                          ),
                          if (_navItems[index] == 'Market') ...[
                            const SizedBox(width: 4),
                            Icon(
                              LucideIcons.chevronDown,
                              size: 14,
                              color: isSelected ? AppColors.textWhite : AppColors.textMuted,
                            ),
                          ]
                        ],
                      ),
                    ),
                  );
                }),
              ),
            ),

          // User Profile & Actions
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: AppColors.cardSurface,
                  shape: BoxShape.circle,
                  border: Border.all(color: AppColors.borderSubtle),
                ),
                child: const Icon(LucideIcons.bell, size: 16, color: AppColors.textWhite),
              ),
              if (!isMobile) ...[
                const SizedBox(width: 12),
                Container(height: 24, width: 1, color: AppColors.borderSubtle),
                const SizedBox(width: 12),
                const Text(
                  'Musavir',
                  style: TextStyle(
                    color: AppColors.textWhite,
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
              ],
              const SizedBox(width: 10),
              const CircleAvatar(
                radius: 16,
                backgroundColor: AppColors.cardSurfaceLight,
                child: Icon(LucideIcons.user, size: 16, color: AppColors.textWhite),
              ),
            ],
          ),
        ],
      ),
    );
  }
}