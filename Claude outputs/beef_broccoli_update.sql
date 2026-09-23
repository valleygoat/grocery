-- Beef & Broccoli: correct the ingredient list to match the real recipe, and add cooking steps.

-- 1. Remove the old (rougher) ingredient rows for this meal.
delete from recipe_items
where meal_id = (select id from meals where name = 'Beef & Broccoli');

-- 2. Insert the corrected ingredient list.
insert into recipe_items (meal_id, store_id, name, qty, unit) values
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Veggies/Meat'), 'Flank steak', 1, 'lb'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Veggies/Meat'), 'Fresh broccoli', 1, 'lb'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Veggies/Meat'), 'Fresh ginger', 1, 'tsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Veggies/Meat'), 'Garlic', 2, 'cloves'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Rice wine vinegar', 2, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Low-sodium soy sauce', 3, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Oyster sauce', 4, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Rice wine', 2, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Brown sugar', 1, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Cornstarch', 1, 'tbsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'Sesame oil', 0.5, 'tsp'),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Aisle'), 'White rice', 1, ''),
  ((select id from meals where name = 'Beef & Broccoli'), (select id from stores where name = 'Costco'), 'Avocado oil', 2, 'tbsp');

-- 3. Add the cooking steps.
update meals set instructions = 'Cut the steak into thin slices.

Add the beef, 2 tbsp rice wine vinegar, and 1 tbsp soy sauce to a bag and marinate in the fridge for 30 minutes.

Half-steam the broccoli (2-3 minutes in the microwave).

In a bowl, mix the oyster sauce, rice wine, brown sugar, cornstarch, and 2 tbsp soy sauce. Stir well.

Heat a wok on high with 2 tbsp oil and the sesame oil. Once hot, cook the steak, then set it aside when done.

Cook the garlic and ginger in the wok for 30 seconds. Add the beef and broccoli back in.

Add the sauce, stir, cook, and serve.'
where name = 'Beef & Broccoli';
