class Product {
  final String id;
  final String name;
  final String category;
  final double price;
  final int discountPercent;
  final double rating;
  final int reviewsCount;
  final String description;
  final List<String> images;

  Product({
    required this.id,
    required this.name,
    required this.category,
    required this.price,
    required this.discountPercent,
    required this.rating,
    required this.reviewsCount,
    required this.description,
    required this.images,
  });
}

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

// Danh sách sản phẩm mẫu
final List<Product> sampleProducts = [
  Product(
    id: 'p1',
    name: 'iPhone 15 Pro Max 256GB Titan Tự Nhiên',
    category: 'Điện thoại',
    price: 21990000,
    discountPercent: 25,
    rating: 4.8,
    reviewsCount: 1200,
    description: 'iPhone 15 Pro Max sở hữu thiết kế khung viền Titan chuẩn hàng không vũ trụ cực kỳ bền bỉ và nhẹ nhàng. Trang bị chip A17 Pro mang lại hiệu năng đồ họa vượt trội, hệ thống camera chuyên nghiệp với ống kính Telephoto 5x sắc nét cùng nút Tác vụ (Action Button) hoàn toàn mới.',
    images: [
      'https://picsum.photos/seed/iphone1/600/600',
      'https://picsum.photos/seed/iphone2/600/600',
      'https://picsum.photos/seed/iphone3/600/600',
    ],
  ),
  Product(
    id: 'p2',
    name: 'MacBook Air M2 13 inch 8GB/256GB',
    category: 'Laptop',
    price: 23490000,
    discountPercent: 16,
    rating: 4.9,
    reviewsCount: 850,
    description: 'MacBook Air M2 thiết kế siêu mỏng nhẹ chỉ 1.24kg với màn hình Liquid Retina 13.6 inch rực rỡ. Hiệu năng mạnh mẽ từ chip Apple M2 giúp xử lý mượt mà mọi tác vụ văn phòng, chỉnh sửa ảnh, video và thời lượng pin lên đến 18 giờ liên tục.',
    images: [
      'https://picsum.photos/seed/mac1/600/600',
      'https://picsum.photos/seed/mac2/600/600',
    ],
  ),
  Product(
    id: 'p3',
    name: 'Samsung Galaxy S24 Ultra 5G 256GB',
    category: 'Điện thoại',
    price: 24990000,
    discountPercent: 22,
    rating: 4.7,
    reviewsCount: 640,
    description: 'Galaxy S24 Ultra tích hợp quyền năng Galaxy AI đột phá, khung viền Titan phẳng sang trọng, bút S-Pen tích hợp sẵn và camera mắt thần bóng đêm 200MP zoom quang học cực đại.',
    images: [
      'https://picsum.photos/seed/samsung1/600/600',
      'https://picsum.photos/seed/samsung2/600/600',
    ],
  ),
  Product(
    id: 'p4',
    name: 'Tai nghe chống ồn Sony WH-1000XM5',
    category: 'Phụ kiện',
    price: 6490000,
    discountPercent: 19,
    rating: 4.9,
    reviewsCount: 430,
    description: 'Tai nghe chụp tai chống ồn hàng đầu thế giới với 8 micro và 2 bộ xử lý âm thanh tích hợp. Đệm tai da mềm mại đeo êm ái cả ngày dài, pin 30 tiếng kèm sạc nhanh tiện lợi.',
    images: [
      'https://picsum.photos/seed/sony1/600/600',
      'https://picsum.photos/seed/sony2/600/600',
    ],
  ),
];

// Quản lý giỏ hàng toàn cục để 3 màn hình tự động đồng bộ dữ liệu
class CartManager {
  static final List<CartItem> items = [
    CartItem(product: sampleProducts[0], quantity: 1),
    CartItem(product: sampleProducts[1], quantity: 1),
    CartItem(product: sampleProducts[2], quantity: 1),
  ];

  static int get totalQuantity =>
      items.fold(0, (sum, item) => sum + item.quantity);

  static void addToCart(Product product) {
    final index = items.indexWhere((item) => item.product.id == product.id);
    if (index != -1) {
      items[index].quantity++;
    } else {
      items.add(CartItem(product: product, quantity: 1));
    }
  }
}

String formatCurrency(double amount, {bool shortK = false}) {
  if (shortK) {
    int kValue = (amount / 1000).round();
    String str = kValue.toString().replaceAllMapped(
      RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
      (Match m) => '${m[1]}.',
    );
    return '${str}k';
  }
  String str = amount.toInt().toString().replaceAllMapped(
    RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
    (Match m) => '${m[1]}.',
  );
  return '$str đ';
}
