library constants;

// Your wordpress website URL
const String WORDPRESS_URL = "https://cuinoticeboard.online";

// Featured category ID (for Home Screen top section)
const int FEATURED_ID = 11;

// Tab 2 page category name
const String PAGE2_CATEGORY_NAME = "Important";

// Tab 2 page category ID
const int PAGE2_CATEGORY_ID = 10;

// Custom categories in search tab
// Array in format
// ["Category Name", "Image Link", "Category ID"]
const List<dynamic> CUSTOM_CATEGORIES = [
  ["CS", "assets/boxed/cs.png", 2],
  ["MS", "assets/boxed/chatting.png", 3],
  ["Humainities", "assets/boxed/human.png", 4],
  ["Math", "assets/boxed/tools.png", 9],
  ["ES", "assets/boxed/es.png", 8],
  ["Important", "assets/boxed/message.png", 10],
  ["Featured", "assets/boxed/gear.png", 11],
  // ["Travel", "assets/boxed/travel.png", 7],
  // ["Recipies", "assets/boxed/recipies.png", 10],
];
