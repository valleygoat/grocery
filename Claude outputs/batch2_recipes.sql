-- === Recipe batch 2: 13 new meals + Chicken Tacos / Egg Foo Young / Lasagna updates ===
-- Run this whole script in the Supabase SQL Editor.

-- 1. New meals
insert into meals (name, category_id, sort_order) values
  ('Beef Bulgogi', (select id from categories where label='🥩 Beef'), 1000),
  ('Beef n Gravy', (select id from categories where label='🥩 Beef'), 1001),
  ('Philly Cheesesteak', (select id from categories where label='🥩 Beef'), 1002),
  ('Broccoli Chicken Alfredo', (select id from categories where label='🍗 Chicken'), 1003),
  ('Chicken Parmesan', (select id from categories where label='🍗 Chicken'), 1004),
  ('Pan Seared Chicken Breast', (select id from categories where label='🍗 Chicken'), 1005),
  ('Cheesy Scalloped Potatoes', (select id from categories where label='🗂️ Misc'), 1006),
  ('French Onion Soup', (select id from categories where label='🗂️ Misc'), 1007),
  ('Mom''s Fried Ramen', (select id from categories where label='🗂️ Misc'), 1008),
  ('Red Lobster Biscuits', (select id from categories where label='🗂️ Misc'), 1009),
  ('Garlic Butter', null, 1010),
  ('Asian Sauce', null, 1011),
  ('Pizza Dough', null, 1012)
on conflict (name) do nothing;

-- 2. Ingredients for the new meals
insert into recipe_items (meal_id, store_id, name, qty, unit) values
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Veggies/Meat'), 'Flank steak', 1, 'lb'),
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Veggies/Meat'), 'Green onion', 0.25, 'bunch'),
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 5, 'tbsp'),
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Aisle'), 'White sugar', 2.5, 'tbsp'),
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Aisle'), 'Garlic', 2, 'tbsp'),
  ((select id from meals where name='Beef Bulgogi'), (select id from stores where name='Aisle'), 'Sesame oil', 2, 'tbsp'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Veggies/Meat'), 'Top round steak', 2.25, 'lb'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Cream of potato soup', 3, 'cans'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Beef broth', 2, 'cups'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Beef bouillon', 2, 'tbsp'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Au jus gravy mix', 1, 'packet'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Brown gravy mix', 2, 'packets'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Aisle'), 'Worcestershire sauce', 2, 'tbsp'),
  ((select id from meals where name='Beef n Gravy'), (select id from stores where name='Costco'), 'Garlic', 1, 'tbsp'),
  ((select id from meals where name='Philly Cheesesteak'), (select id from stores where name='Veggies/Meat'), 'Beef (sirloin/ribeye/tri-tip)', 1, 'lb'),
  ((select id from meals where name='Philly Cheesesteak'), (select id from stores where name='Veggies/Meat'), 'White sweet onion', 1, ''),
  ((select id from meals where name='Philly Cheesesteak'), (select id from stores where name='Aisle'), 'French rolls', 3, ''),
  ((select id from meals where name='Philly Cheesesteak'), (select id from stores where name='Dairy'), 'Provolone cheese', 6, 'slices'),
  ((select id from meals where name='Philly Cheesesteak'), (select id from stores where name='Dairy'), 'Butter', 2, 'tbsp'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1.5, 'lb'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Veggies/Meat'), 'Fresh broccoli', 3, 'head'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Veggies/Meat'), 'Garlic', 6, 'cloves'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Aisle'), 'Fettuccine', 1, 'box'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Aisle'), 'Olive oil', 4, 'tbsp'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Dairy'), 'Butter', 8, 'tbsp'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Dairy'), 'Heavy cream', 6, 'cups'),
  ((select id from meals where name='Broccoli Chicken Alfredo'), (select id from stores where name='Dairy'), 'Parmesan', 3, 'cups'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1.5, 'lb'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Veggies/Meat'), 'Garlic', 4, 'cloves'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 0.5, ''),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Crushed tomatoes', 28, 'oz'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Tomato paste', 2, 'tbsp'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Flour', 1, 'cup'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Panko bread crumbs', 1, 'cup'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Spaghetti noodles', 1, 'lb'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'White wine', 1, 'cup'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Aisle'), 'Olive oil', 3, 'tbsp'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Dairy'), 'Egg', 1, ''),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Dairy'), 'Parmesan', 1, 'cup'),
  ((select id from meals where name='Chicken Parmesan'), (select id from stores where name='Dairy'), 'Sliced mozzarella', 4, 'slices'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1.5, 'lb'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Aisle'), 'Flour', 0.5, 'cup'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Aisle'), 'Garlic powder', 1, 'tsp'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Aisle'), 'Onion powder', 1, 'tsp'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Aisle'), 'Italian seasoning', 2, 'tsp'),
  ((select id from meals where name='Pan Seared Chicken Breast'), (select id from stores where name='Aisle'), 'Olive oil', 2, 'tbsp'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Veggies/Meat'), 'Russet potatoes', 5, ''),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Dairy'), 'Cheddar cheese', 16, 'oz'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Dairy'), 'Mozzarella', 16, 'oz'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Dairy'), 'Whole milk', 3, 'cups'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Dairy'), 'Butter', 6, 'tbsp'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Aisle'), 'Dried minced onion', 6, 'tbsp'),
  ((select id from meals where name='Cheesy Scalloped Potatoes'), (select id from stores where name='Aisle'), 'Flour', 6, 'tbsp'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 3, 'lb'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Beef broth', 6, 'cups'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Flour', 2, 'tbsp'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Dry sherry', 1, 'cup'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 1, 'tbsp'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Bread', 1, 'loaf'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Aisle'), 'Olive oil', 3, 'tbsp'),
  ((select id from meals where name='French Onion Soup'), (select id from stores where name='Dairy'), 'General cheese', 2, 'cups'),
  ((select id from meals where name='Mom''s Fried Ramen'), (select id from stores where name='Aisle'), 'Ramen noodles', 6, 'packages'),
  ((select id from meals where name='Mom''s Fried Ramen'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 2, 'tbsp'),
  ((select id from meals where name='Mom''s Fried Ramen'), (select id from stores where name='Aisle'), 'Vegetable oil', 1, 'tbsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Aisle'), 'Flour', 2, 'cups'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Aisle'), 'White sugar', 1, 'tbsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Aisle'), 'Baking powder', 1, 'tbsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Aisle'), 'Garlic powder', 2.5, 'tsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Aisle'), 'Cayenne pepper', 0.25, 'tsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Dairy'), 'Buttermilk', 1, 'cup'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Dairy'), 'Butter', 11, 'tbsp'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Dairy'), 'Sharp cheddar cheese', 1.5, 'cups'),
  ((select id from meals where name='Red Lobster Biscuits'), (select id from stores where name='Veggies/Meat'), 'Fresh parsley', 1, 'tbsp'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Dairy'), 'Butter', 1, 'cup'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Dairy'), 'Parmesan', 0.25, 'cup'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Aisle'), 'Garlic', 1, 'tbsp'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Aisle'), 'Garlic salt', 1, 'tbsp'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Aisle'), 'Italian seasoning', 1, 'tsp'),
  ((select id from meals where name='Garlic Butter'), (select id from stores where name='Aisle'), 'Paprika', 0.25, 'tsp'),
  ((select id from meals where name='Asian Sauce'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 4, 'tbsp'),
  ((select id from meals where name='Asian Sauce'), (select id from stores where name='Aisle'), 'Dark soy sauce', 4, 'tbsp'),
  ((select id from meals where name='Asian Sauce'), (select id from stores where name='Aisle'), 'Oyster sauce', 6, 'tbsp'),
  ((select id from meals where name='Asian Sauce'), (select id from stores where name='Aisle'), 'Brown sugar', 2, 'tbsp'),
  ((select id from meals where name='Asian Sauce'), (select id from stores where name='Aisle'), 'Sesame oil', 2, 'tbsp'),
  ((select id from meals where name='Pizza Dough'), (select id from stores where name='Aisle'), 'Bread flour', 4.75, 'cups'),
  ((select id from meals where name='Pizza Dough'), (select id from stores where name='Aisle'), 'White sugar', 1, 'tbsp'),
  ((select id from meals where name='Pizza Dough'), (select id from stores where name='Aisle'), 'Kosher salt', 1.75, 'tsp'),
  ((select id from meals where name='Pizza Dough'), (select id from stores where name='Aisle'), 'Instant yeast', 2.25, 'tsp'),
  ((select id from meals where name='Pizza Dough'), (select id from stores where name='Aisle'), 'Olive oil', 2.5, 'tbsp');

-- 3. Add the new seasoning/marinade items to the EXISTING Chicken Tacos (keeps shells/onion/lettuce/cheese already there)
insert into recipe_items (meal_id, store_id, name, qty, unit) values
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Cumin', 1, 'tbsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Chili powder', 1, 'tbsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Paprika', 1, 'tsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Garlic powder', 1, 'tsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Onion powder', 1, 'tsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Dried oregano', 1, 'tsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Red pepper flakes', 0.25, 'tsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Olive oil', 2.5, 'tbsp'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Veggies/Meat'), 'Lime', 1, '');

-- 4. Replace the EXISTING Egg Foo Young ingredient list with the corrected version
delete from recipe_items where meal_id = (select id from meals where name = 'Egg Foo Young');
insert into recipe_items (meal_id, store_id, name, qty, unit) values
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Dairy'), 'Eggs', 12, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Fresh broccoli', 2, 'head'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 1, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Oyster sauce', 2, 'tsp'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Shaoxing wine (or Mirin)', 1, 'tbsp'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Cornstarch', 1.33, 'tbsp'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 1.5, 'tbsp'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Sesame oil', 0.5, 'tsp');

-- 5. Fix the marinara quantity on the EXISTING Lasagna (1.5 jars -> 2 jars, matches 48oz)
update recipe_items set qty = 2 where meal_id = (select id from meals where name = 'Lasagna') and name = 'Rao''s marinara';

-- 6. Cooking steps for all 16 recipes
update meals set instructions = 'Place the beef in a shallow dish.

Combine the soy sauce, sugar, chopped green onion, garlic, sesame oil, and pepper in a bowl.

Pour the marinade over the beef, cover, and refrigerate for at least 1 hour or overnight.

Grill the beef.' where name = 'Beef Bulgogi';
update meals set instructions = 'Throw everything into the crockpot.

Cook on low until the beef is tender.

Eat.' where name = 'Beef n Gravy';
update meals set instructions = 'In a medium skillet or saucepan over medium-high heat, melt the butter. Whisk in the flour and dried onion, and cook for 1 minute.

Slowly whisk in the milk, stirring until the mixture is bubbly. Remove from heat.

Add salt, pepper, and grated cheese. Whisk until blended.

In a baking dish, arrange half the sliced potatoes in the bottom. Cover with half the cheese sauce. Add another layer of the remaining potatoes and cover with the remaining sauce.

Top with the reserved cheese.

Bake uncovered for 45 minutes to 1 hour.' where name = 'Cheesy Scalloped Potatoes';
update meals set instructions = 'Start boiling water for the pasta.

Slice the chicken in half or into strips and season with salt. Cut the broccoli into florets.

Heat a large pan over medium-high with oil lightly covering the bottom.

Cook the broccoli for 4 minutes until bright green, then add ¼ cup water and cook until it evaporates.

Cook the pasta al dente.

Add more oil to the pan and cook the chicken until done. Remove from the pan when done.

Melt the butter in the pan. Add the garlic and cook for 30 seconds until fragrant.

Add the cream and cheese, and cook until bubbling, stirring and scraping the bottom continuously. Turn to low heat.

Add everything back to the pan and mix.' where name = 'Broccoli Chicken Alfredo';
update meals set instructions = 'Slice the chicken breasts in half and pound to an even thickness. Season with salt and pepper.

Add the chicken, ½ cup white wine, and 2 cloves of garlic to a bowl and refrigerate.

Add the olive oil, remaining garlic, tomato paste, and onion to a pan. Sear for 1 minute.

Add the crushed tomatoes and remaining white wine to the pan.

Start boiling a pot of water for the spaghetti.

Reduce the pan to a simmer for 30 minutes, stirring often.

Pat the chicken dry. Coat it in flour, then egg, then the breadcrumb and cheese mixture.

Season the tomato sauce with salt and pepper.

Add olive oil to a new pan over medium heat. Add the breaded chicken — it should be a gentle sizzle.

Add the spaghetti to the boiling water.

Flip the chicken once golden on one side, and cook until golden on both sides and the chicken reaches 165°F. Move to a cooling rack.

Top the chicken with mozzarella and broil until the cheese is melted.' where name = 'Chicken Parmesan';
update meals set instructions = 'Pat the chicken breasts dry (if thick, butterfly them first). In a large bowl, combine the flour, salt, pepper, garlic powder, onion powder, and Italian seasoning.

Coat the chicken breasts in the flour mixture and set aside.

Heat the olive oil in a large skillet over medium-high heat. Once hot, add the coated chicken and cook 4 to 5 minutes per side, until golden brown and cooked through (about 8-10 minutes total).

Remove from the pan and serve warm with pasta or vegetables.' where name = 'Pan Seared Chicken Breast';
update meals set instructions = 'Freeze the beef for about 15 minutes to make it easier to chop.

Finely chop the beef.

Dice the onion.

Heat a cast iron pan on high with oil. Cook the onions, then remove once done.

Add more oil to the pan and cook the beef, seasoning to taste.

Once cooked, add the onions back to the pan.

Place provolone on top and let it melt slightly, then place a French roll on top of the mixture and scoop everything into the roll.' where name = 'Philly Cheesesteak';
update meals set instructions = 'Chop the onions pole to pole.

Caramelize the onions in olive oil over medium heat, 45-60 minutes.

Warm the beef broth in a separate pot.

Toast old bread with olive oil in the oven at 400°F for about 5 minutes.

Once the onions are caramelized, add the flour and cook for 2 minutes.

Deglaze with the dry sherry, then add the soy sauce.

Add soup to a ramekin, then cheese, then bread, then more cheese.

Broil for 3-5 minutes until golden brown.' where name = 'French Onion Soup';
update meals set instructions = 'Boil enough water in a wok to cover the noodles.

Add the noodles and stir until completely separated.

Drain the water, add the noodles back to the pan, and add half of the seasoning packets (e.g. 2 packets for 4 blocks of noodles).

Add about 1 tbsp of oil to the noodles and mix.

Fry the noodles until mostly dried out, stirring occasionally. Add fried eggs, vegetables, or fried beef if desired.' where name = 'Mom''s Fried Ramen';
update meals set instructions = 'Preheat the oven to 450°F.

In a large bowl, combine the flour, sugar, baking powder, garlic powder, salt, and cayenne pepper.

In a large measuring cup, whisk together the buttermilk and melted butter.

Pour the wet mixture over the dry ingredients in the large bowl.

Gently fold in the shredded cheddar.

Scoop the batter evenly onto a baking sheet using a ¼ cup measure. Bake for 10-12 minutes until golden brown.

Whisk together the melted butter, parsley, and garlic powder.

Brush the mixture onto the finished hot biscuits.' where name = 'Red Lobster Biscuits';
update meals set instructions = 'Mix all the ingredients until smooth.

Store in the fridge for 3-4 days, or roll into a log and freeze for longer storage.' where name = 'Garlic Butter';
update meals set instructions = 'Whisk all the ingredients together until combined.' where name = 'Asian Sauce';
update meals set instructions = 'In a small bowl, dissolve the sugar in the lukewarm water, then sprinkle the yeast over top. Let sit 5-10 minutes until foamy.

Combine the flour and salt in a food processor fitted with the dough blade. Pulse 3-4 times to mix.

Add the olive oil and the bloomed yeast mixture. Run the processor until the dough forms a ball that rides around the bowl above the blade (about 15 seconds), then continue processing 15 seconds longer.

Turn the dough onto a floured surface and knead briefly until smooth. It should pass the windowpane test — stretch thin enough to see light through without tearing.

Divide the dough into 3 equal balls. Place each in its own airtight container and refrigerate for 1 to 5 days.

Remove the dough from the fridge at least 2 hours before baking to come to room temperature.

Preheat the oven with a pizza steel inside to 550°F for 45 minutes to 1 hour.

Stretch one dough ball by hand into a 12-14 inch round, being careful not to degas the rim. Top as desired, then slide onto the preheated steel and bake 5-8 minutes, watching closely, until the crust is blistered and browned and the cheese is bubbling.' where name = 'Pizza Dough';
update meals set instructions = 'Marinate the chicken for 1 to 6 hours in the olive oil, seasoning blend, and lime juice — about 2.5 tbsp oil and 2 tbsp of the seasoning mix per pound of chicken.

Cook the chicken through, then build tacos with the shells, onion, lettuce, and cheese.' where name = 'Chicken Tacos';
update meals set instructions = 'Mix the cornstarch with 1½ tbsp of the soy sauce.

Add the oyster sauce, cooking wine, sesame oil, and 1 cup water to the mixture.

Pour the mixture into a saucepan over medium heat. Bring to a simmer, stirring constantly, until it thickens (about 1 minute). Remove from heat and set aside.

Add the eggs to a bowl and whisk.

Add the thinly cut vegetables (broccoli, green pepper, onion) to the bowl and mix.

Heat a skillet over medium with a small amount of sesame oil.

Cook until the bottom is golden brown and easy to flip, then flip.

Cook until the other side is golden brown and remove. Serve with the sauce.' where name = 'Egg Foo Young';
update meals set instructions = 'Preheat the oven to 375°F. Cook the lasagna noodles per the package directions, then drain, rinse with cold water, and lay on parchment paper.

Heat the olive oil in a large skillet over medium-high heat. Add the onion and cook until softened, 3-4 minutes. Add the ground beef, season with salt and pepper, then add the garlic and cook, stirring, for 30 seconds.

Add the marinara, Italian seasoning, and parsley to the skillet. Bring to a simmer, then reduce to low and cook for 10-15 minutes, stirring occasionally.

While the sauce simmers, beat the egg lightly in a bowl and stir in the ricotta.

Spread about 1 cup of sauce in a 9x13 baking dish. Lay 3 noodles over the sauce. Spread ⅓ of the remaining sauce over the noodles, add spoonfuls of half the ricotta mixture, then sprinkle ⅓ of the mozzarella and ⅓ of the parmesan on top.

Repeat the layer once more. For the top layer, use the remaining 3 noodles, the rest of the sauce, and the rest of the mozzarella and parmesan.

Cover with foil (sprayed on the underside) and bake for 35 minutes. Uncover and bake 10-15 more minutes until hot and bubbling and the cheese is lightly browned. Let rest 10 minutes before serving.' where name = 'Lasagna';
