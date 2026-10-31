import 'package:flutter/material.dart';
import '../core/constants/app_colors.dart';
import '../core/utils/responsive.dart';
import '../widgets/asset_table.dart';
import '../widgets/balance_card.dart';
import '../widgets/main_chart_card.dart';
import '../widgets/quick_trade_card.dart';
import '../widgets/top_nav_bar.dart';


class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    final bool isMobile = Responsive.isMobile(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const TopNavBar(),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 14.0 : 24.0,
                  vertical: 8.0,
                ),
                child: Column(
                  children: [
                    if (isDesktop) ...[
                      // Desktop Layout (Side-by-side)
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(flex: 68, child: MainChartCard()),
                          SizedBox(width: 24),
                          Expanded(flex: 32, child: QuickTradeCard()),
                        ],
                      ),
                      const SizedBox(height: 24),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Expanded(flex: 68, child: AssetTable()),
                          SizedBox(width: 24),
                          Expanded(flex: 32, child: BalanceCard()),
                        ],
                      ),
                    ] else ...[
                      // Mobile & Tablet Layout (Stacked cleanly)
                      const MainChartCard(),
                      const SizedBox(height: 18),
                      const QuickTradeCard(),
                      const SizedBox(height: 18),
                      const BalanceCard(),
                      const SizedBox(height: 18),
                      const AssetTable(),
                    ],
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}