class Fruit {
  final String name;
  final String price;
  final String imagePath;

  const Fruit({
    required this.name,
    required this.price,
    required this.imagePath,
  });
}

const List<Fruit> fruitsList = [
  Fruit(
    name: 'ផ្លែ ខ្នុរ',
    price: '៩,៥០០ រៀល',
    imagePath: 'assets/images/jackfruit.png',
  ),
  Fruit(
    name: 'ផ្លែ ទៀប',
    price: '៦,០០០ រៀល',
    imagePath: 'assets/images/custard_apple.png',
  ),
  Fruit(
    name: 'ផ្លែ ជម្ពូ',
    price: '៨,០០០ រៀល',
    imagePath: 'assets/images/rose_apple.png',
  ),
  Fruit(
    name: 'ផ្លែ ត្របែក',
    price: '៥,០០០ រៀល',
    imagePath: 'assets/images/guava.png',
  ),
];
