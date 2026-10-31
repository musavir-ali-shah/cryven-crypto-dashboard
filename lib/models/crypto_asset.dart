class CryptoAsset {
  final int id;
  final String name;
  final String symbol;
  final String iconLetter;
  final double price;
  final double amount;
  final String status;
  final double volume;

  CryptoAsset({
    required this.id,
    required this.name,
    required this.symbol,
    required this.iconLetter,
    required this.price,
    required this.amount,
    required this.status,
    required this.volume,
  });

  static List<CryptoAsset> mockAssets = [
    CryptoAsset(
      id: 1,
      name: 'Bitcoin',
      symbol: 'BTC',
      iconLetter: '₿',
      price: 982.52,
      amount: 1.6203,
      status: 'Trending',
      volume: 5812.00,
    ),
    CryptoAsset(
      id: 2,
      name: 'Tether USD',
      symbol: 'USDT',
      iconLetter: '₮',
      price: 982.52,
      amount: 1.6203,
      status: 'Limited',
      volume: 5812.00,
    ),
    CryptoAsset(
      id: 3,
      name: 'Ethereum',
      symbol: 'ETH',
      iconLetter: 'Ξ',
      price: 982.52,
      amount: 1.6203,
      status: 'Rising',
      volume: 5812.00,
    ),
    CryptoAsset(
      id: 4,
      name: 'Dash',
      symbol: 'DASH',
      iconLetter: 'Đ',
      price: 982.52,
      amount: 1.6203,
      status: 'Trending',
      volume: 5812.00,
    ),
  ];
}