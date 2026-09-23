-- === Weight (grams) backfill for all documented-recipe ingredients ===
-- Powers the green/red weight & ounce badges on the Recipes tab.

alter table recipe_items add column if not exists grams numeric;

update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Flank steak';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Fresh broccoli';
update recipe_items set grams = 2 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Fresh ginger';
update recipe_items set grams = 6 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Garlic';
update recipe_items set grams = 30 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Rice wine vinegar';
update recipe_items set grams = 45 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 60 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Oyster sauce';
update recipe_items set grams = 30 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Rice wine';
update recipe_items set grams = 12.5 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Brown sugar';
update recipe_items set grams = 8 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Cornstarch';
update recipe_items set grams = 2.2 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Sesame oil';
update recipe_items set grams = 200 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'White rice';
update recipe_items set grams = 27.0 where meal_id = (select id from meals where name = 'Beef & Broccoli') and name = 'Avocado oil';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'Flank steak';
update recipe_items set grams = 25.0 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'Green onion';
update recipe_items set grams = 75 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 31.2 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'White sugar';
update recipe_items set grams = 18 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'Garlic';
update recipe_items set grams = 27.0 where meal_id = (select id from meals where name = 'Beef Bulgogi') and name = 'Sesame oil';
update recipe_items set grams = 1020.6 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Top round steak';
update recipe_items set grams = 150 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Yellow onion';
update recipe_items set grams = 915 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Cream of potato soup';
update recipe_items set grams = 480 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Beef broth';
update recipe_items set grams = 16 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Beef bouillon';
update recipe_items set grams = 28 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Au jus gravy mix';
update recipe_items set grams = 56 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Brown gravy mix';
update recipe_items set grams = 30 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Worcestershire sauce';
update recipe_items set grams = 9 where meal_id = (select id from meals where name = 'Beef n Gravy') and name = 'Garlic';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Philly Cheesesteak') and name = 'Beef (sirloin/ribeye/tri-tip)';
update recipe_items set grams = 150 where meal_id = (select id from meals where name = 'Philly Cheesesteak') and name = 'White sweet onion';
update recipe_items set grams = 240 where meal_id = (select id from meals where name = 'Philly Cheesesteak') and name = 'French rolls';
update recipe_items set grams = 120 where meal_id = (select id from meals where name = 'Philly Cheesesteak') and name = 'Provolone cheese';
update recipe_items set grams = 28.4 where meal_id = (select id from meals where name = 'Philly Cheesesteak') and name = 'Butter';
update recipe_items set grams = 680.4 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Chicken breast';
update recipe_items set grams = 1200 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Fresh broccoli';
update recipe_items set grams = 18 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Garlic';
update recipe_items set grams = 454 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Fettuccine';
update recipe_items set grams = 54.0 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Olive oil';
update recipe_items set grams = 113.6 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Butter';
update recipe_items set grams = 1440 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Heavy cream';
update recipe_items set grams = 339 where meal_id = (select id from meals where name = 'Broccoli Chicken Alfredo') and name = 'Parmesan';
update recipe_items set grams = 680.4 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Chicken breast';
update recipe_items set grams = 12 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Garlic';
update recipe_items set grams = 75.0 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Yellow onion';
update recipe_items set grams = 793.8 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Crushed tomatoes';
update recipe_items set grams = 32 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Tomato paste';
update recipe_items set grams = 120 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Flour';
update recipe_items set grams = 200 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Panko bread crumbs';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Spaghetti noodles';
update recipe_items set grams = 240 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'White wine';
update recipe_items set grams = 40.5 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Olive oil';
update recipe_items set grams = 50 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Egg';
update recipe_items set grams = 113 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Parmesan';
update recipe_items set grams = 80 where meal_id = (select id from meals where name = 'Chicken Parmesan') and name = 'Sliced mozzarella';
update recipe_items set grams = 680.4 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Chicken breast';
update recipe_items set grams = 60.0 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Flour';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Garlic powder';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Onion powder';
update recipe_items set grams = 4.6 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Italian seasoning';
update recipe_items set grams = 27.0 where meal_id = (select id from meals where name = 'Pan Seared Chicken Breast') and name = 'Olive oil';
update recipe_items set grams = 850 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Russet potatoes';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Cheddar cheese';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Mozzarella';
update recipe_items set grams = 720 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Whole milk';
update recipe_items set grams = 85.2 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Butter';
update recipe_items set grams = 42 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Dried minced onion';
update recipe_items set grams = 48 where meal_id = (select id from meals where name = 'Cheesy Scalloped Potatoes') and name = 'Flour';
update recipe_items set grams = 1360.8 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Yellow onion';
update recipe_items set grams = 1440 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Beef broth';
update recipe_items set grams = 16 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Flour';
update recipe_items set grams = 240 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Dry sherry';
update recipe_items set grams = 15 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 180 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Bread';
update recipe_items set grams = 40.5 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'Olive oil';
update recipe_items set grams = 226 where meal_id = (select id from meals where name = 'French Onion Soup') and name = 'General cheese';
update recipe_items set grams = 510 where meal_id = (select id from meals where name = 'Mom''s Fried Ramen') and name = 'Ramen noodles';
update recipe_items set grams = 30 where meal_id = (select id from meals where name = 'Mom''s Fried Ramen') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 13.5 where meal_id = (select id from meals where name = 'Mom''s Fried Ramen') and name = 'Vegetable oil';
update recipe_items set grams = 240 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Flour';
update recipe_items set grams = 12.5 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'White sugar';
update recipe_items set grams = 14 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Baking powder';
update recipe_items set grams = 5.8 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Garlic powder';
update recipe_items set grams = 0.6 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Cayenne pepper';
update recipe_items set grams = 240 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Buttermilk';
update recipe_items set grams = 156.2 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Butter';
update recipe_items set grams = 169.5 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Sharp cheddar cheese';
update recipe_items set grams = 14 where meal_id = (select id from meals where name = 'Red Lobster Biscuits') and name = 'Fresh parsley';
update recipe_items set grams = 200 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Butter';
update recipe_items set grams = 28.2 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Parmesan';
update recipe_items set grams = 9 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Garlic';
update recipe_items set grams = 7 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Garlic salt';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Italian seasoning';
update recipe_items set grams = 0.6 where meal_id = (select id from meals where name = 'Garlic Butter') and name = 'Paprika';
update recipe_items set grams = 60 where meal_id = (select id from meals where name = 'Asian Sauce') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 60 where meal_id = (select id from meals where name = 'Asian Sauce') and name = 'Dark soy sauce';
update recipe_items set grams = 90 where meal_id = (select id from meals where name = 'Asian Sauce') and name = 'Oyster sauce';
update recipe_items set grams = 25.0 where meal_id = (select id from meals where name = 'Asian Sauce') and name = 'Brown sugar';
update recipe_items set grams = 27.0 where meal_id = (select id from meals where name = 'Asian Sauce') and name = 'Sesame oil';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Chicken breast';
update recipe_items set grams = 454 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Taco shells';
update recipe_items set grams = 150 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Yellow onion';
update recipe_items set grams = 400 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Romaine lettuce';
update recipe_items set grams = 113 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'General cheese';
update recipe_items set grams = 7 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Cumin';
update recipe_items set grams = 7 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Chili powder';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Paprika';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Garlic powder';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Onion powder';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Dried oregano';
update recipe_items set grams = 0.6 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Red pepper flakes';
update recipe_items set grams = 33.8 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Olive oil';
update recipe_items set grams = 67 where meal_id = (select id from meals where name = 'Chicken Tacos') and name = 'Lime';
update recipe_items set grams = 600 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Eggs';
update recipe_items set grams = 800 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Fresh broccoli';
update recipe_items set grams = 150 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Yellow onion';
update recipe_items set grams = 100 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Green pepper';
update recipe_items set grams = 10 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Oyster sauce';
update recipe_items set grams = 15 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Shaoxing wine (or Mirin)';
update recipe_items set grams = 10.6 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Cornstarch';
update recipe_items set grams = 22.5 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Low-sodium soy sauce';
update recipe_items set grams = 2.2 where meal_id = (select id from meals where name = 'Egg Foo Young') and name = 'Sesame oil';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Lasagna') and name = '96% lean ground beef';
update recipe_items set grams = 120.0 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Yellow onion';
update recipe_items set grams = 9 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Garlic';
update recipe_items set grams = 15.0 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Fresh parsley';
update recipe_items set grams = 900 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Lasagna noodles';
update recipe_items set grams = 13.5 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Olive oil';
update recipe_items set grams = 2.3 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Italian seasoning';
update recipe_items set grams = 1360 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Rao''s marinara';
update recipe_items set grams = 50 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Egg';
update recipe_items set grams = 425.2 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Ricotta cheese';
update recipe_items set grams = 453.6 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Mozzarella';
update recipe_items set grams = 56.5 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Parmesan';
-- Pizza Dough: replace with the new 75%-scaled recipe (3 dough balls, ~10-11" pizzas).
-- Uses Andy's own stated weights rather than estimated conversions.

delete from recipe_items
where meal_id = (select id from meals where name = 'Pizza Dough');

insert into recipe_items (meal_id, store_id, name, qty, unit, grams) values
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'Bread flour', 3.625, 'cups', 473),
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'Water', 1.333, 'cups', 315),
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'White sugar', 2.25, 'tsp', 11),
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'Kosher salt', 1.25, 'tsp', 7.5),
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'Instant yeast', 1.75, 'tsp', 7.5),
  ((select id from meals where name = 'Pizza Dough'), (select id from stores where name = 'Aisle'), 'Olive oil', 1.875, 'tbsp', 24);

-- Update the bake step to match the new, smaller dough-ball size.
update meals
set instructions = replace(instructions, '12-14 inch round', '10-11 inch round')
where name = 'Pizza Dough';
