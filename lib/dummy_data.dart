import 'features/home/home.dart';

List<ProductModel> dummyProducts = [
  ProductModel(
    id: '1',
    image:
        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
    name: 'Classic Sneakers',
    hasOffer: true,
    isFav: false,
    priceAfter: 59.99,
    priceBefore: 89.99,
    description:
        'Comfortable classic sneakers made from durable canvas with soft inner padding. Perfect for casual and daily wear.',
  ),
  ProductModel(
    id: '2',
    image:
        'https://images.stockcake.com/public/f/4/0/f401f957-cbd4-4082-a965-0e438b2f515f_large/geometric-design-t-shirt-stockcake.jpg',
    name: 'Leather Jacket',
    hasOffer: false,
    isFav: true,
    priceAfter: 199.99,
    priceBefore: 199.99,
    description:
        'Premium leather jacket with smooth lining and a modern slim fit design. Ideal for stylish winter outfits.',
  ),
  ProductModel(
    id: '3',
    image:
        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
    name: 'Smart Watch',
    hasOffer: true,
    isFav: true,
    priceAfter: 129.50,
    priceBefore: 179.99,
    description:
        'Feature-rich smartwatch with heart rate monitor, step counter, and message notifications. Water-resistant and lightweight.',
  ),
  ProductModel(
    id: '4',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Wireless Headphones',
    hasOffer: false,
    isFav: false,
    priceAfter: 249.00,
    priceBefore: 249.00,
    description:
        'High-quality wireless headphones with noise cancellation and long battery life for immersive sound experience.',
  ),
  ProductModel(
    id: '5',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Casual T-Shirt',
    hasOffer: true,
    isFav: false,
    priceAfter: 24.99,
    priceBefore: 39.99,
    description:
        'Soft cotton T-shirt with minimal design and breathable fabric. Great for daily casual looks.',
  ),
  ProductModel(
    id: '7',
    image:
        'https://images.stockcake.com/public/f/4/0/f401f957-cbd4-4082-a965-0e438b2f515f_large/geometric-design-t-shirt-stockcake.jpg',
    name: 'Denim Jeans',
    hasOffer: false,
    isFav: false,
    priceAfter: 59.99,
    priceBefore: 59.99,
    description:
        'Classic blue denim jeans with a comfortable stretch fit and durable stitching. Suitable for all-day wear.',
  ),
  ProductModel(
    id: '8',
    image:
        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
    name: 'Bluetooth Speaker',
    hasOffer: true,
    isFav: true,
    priceAfter: 39.99,
    priceBefore: 69.99,
    description:
        'Portable Bluetooth speaker with deep bass and 10-hour battery life. Ideal for travel and outdoor use.',
  ),
  ProductModel(
    id: '9',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Fitness Band',
    hasOffer: true,
    isFav: false,
    priceAfter: 45.00,
    priceBefore: 65.00,
    description:
        'Lightweight fitness band with activity tracking, calorie counter, and sleep monitoring. Water-resistant design.',
  ),
  ProductModel(
    id: '10',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Basic Hoodie',
    hasOffer: false,
    isFav: false,
    priceAfter: 89.99,
    priceBefore: 89.99,
    description:
        'Cozy cotton hoodie with adjustable drawstrings and kangaroo pocket. Perfect for casual winter days.',
  ),
  ProductModel(
    id: '12',
    image:
        'https://images.stockcake.com/public/f/4/0/f401f957-cbd4-4082-a965-0e438b2f515f_large/geometric-design-t-shirt-stockcake.jpg',
    name: 'Slim Fit Shirt',
    hasOffer: false,
    isFav: true,
    priceAfter: 49.99,
    priceBefore: 49.99,
    description:
        'Elegant slim-fit shirt made from soft cotton fabric. Suitable for both formal and semi-casual occasions.',
  ),
  ProductModel(
    id: '13',
    image:
        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
    name: 'Gaming Mouse',
    hasOffer: true,
    isFav: false,
    priceAfter: 35.99,
    priceBefore: 55.99,
    description:
        'Ergonomic gaming mouse with RGB lighting and high DPI sensor. Designed for precision and comfort.',
  ),
  ProductModel(
    id: '14',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Laptop Backpack',
    hasOffer: true,
    isFav: false,
    priceAfter: 69.99,
    priceBefore: 99.99,
    description:
        'Spacious laptop backpack with padded compartments and waterproof material. Ideal for students and professionals.',
  ),
  ProductModel(
    id: '15',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Sports Shorts',
    hasOffer: false,
    isFav: true,
    priceAfter: 29.99,
    priceBefore: 29.99,
    description:
        'Lightweight sports shorts with quick-dry fabric and elastic waistband. Great for workouts or casual wear.',
  ),
  ProductModel(
    id: '17',
    image:
        'https://images.stockcake.com/public/f/4/0/f401f957-cbd4-4082-a965-0e438b2f515f_large/geometric-design-t-shirt-stockcake.jpg',
    name: 'Cotton Pants',
    hasOffer: false,
    isFav: false,
    priceAfter: 64.99,
    priceBefore: 64.99,
    description:
        'Breathable cotton pants with modern fit and smooth texture. Perfect for summer days and travel.',
  ),
  ProductModel(
    id: '18',
    image:
        'https://i.etsystatic.com/42377391/r/il/f4c4b5/5133648322/il_570xN.5133648322_3fx8.jpg',
    name: 'Wireless Charger',
    hasOffer: true,
    isFav: true,
    priceAfter: 25.99,
    priceBefore: 39.99,
    description:
        'Fast wireless charger compatible with all Qi-enabled devices. Sleek and compact design for easy placement.',
  ),
  ProductModel(
    id: '19',
    image:
        'https://blackwaterstudios.co.uk/wp-content/uploads/creating-a-t-shirt-design-with-procreate.png',
    name: 'Stylish Cap',
    hasOffer: true,
    isFav: false,
    priceAfter: 14.99,
    priceBefore: 24.99,
    description:
        'Trendy adjustable cap made from breathable cotton fabric. Ideal for sunny days and casual looks.',
  ),
];
