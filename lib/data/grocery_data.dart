class GroceryData {
  static List<Map<String, dynamic>> groceryList = [
    //we made it static so that we can acess it from anywhere
    {
      'id': '1',
      'name': 'Apples',
      'description': 'Fruits',
      'quantity': '5',
      'price': 2.99,
      'imageUrl': 'https://5.imimg.com/data5/LM/DU/MY-22954806/apple-fruit.jpg',
    },
    {
      'id': '2',
      'name': 'Bread',
      'description': 'Bakery',
      'quantity': '2',
      'price': 1.49,
      'imageUrl':
          'https://www.bhg.com/thmb/ov2S31znAvSCXqrpgJQ8rwBgzp8=/2250x0/filters:no_upscale():strip_icc()/BHG-milk-bread-4CdeIL1uKGyB5ryU8J_EED-aaa76729c86a413ca7500029edba79f0.jpg',
    },
    {
      'id': '3',
      'name': 'Milk',
      'description': 'Dairy',
      'quantity': '1',
      'price': 2.29,
      'imageUrl':
          'https://static.toiimg.com/thumb/msid-70139351,width-1280,resizemode-4/70139351.jpg',
    },
    {
      'id': '4',
      'name': 'Eggs',
      'description': 'Dairy',
      'quantity': '1',
      'price': 1.99,
      'imageUrl':
          'https://cdn.britannica.com/94/151894-050-F72A5317/Brown-eggs.jpg',
    },
  ];

  // Printing the grocery list
  // for (var item in groceryList) {
  //   print('ID: ${item['id']}');
  //   print('Name: ${item['name']}');
  //   print('Category: ${item['category']}');
  //   print('Quantity: ${item['quantity']}');
  //   print('Price: \$${item['price']}');
  //   print('Image URL: ${item['imageUrl']}');
  //   print('----------------------');
  // }
}
