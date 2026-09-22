-- === Andy's Grocery App: schema + seed data ===
-- Run this whole script once in the Supabase SQL Editor (Project > SQL Editor > New query).

-- 1. Tables

create table if not exists stores (
  id serial primary key,
  name text unique not null,
  sort_order int not null
);

create table if not exists categories (
  id serial primary key,
  label text unique not null,
  sort_order int not null
);

create table if not exists meals (
  id serial primary key,
  name text unique not null,
  category_id int references categories(id) on delete set null,
  sort_order int not null default 0
);

create table if not exists recipe_items (
  id serial primary key,
  meal_id int references meals(id) on delete cascade,
  store_id int references stores(id),
  name text not null,
  qty numeric not null default 1,
  unit text not null default ''
);

create table if not exists always_buy_items (
  id serial primary key,
  name text unique not null,
  sort_order int not null
);

create table if not exists list_state (
  id text primary key default 'main',
  selected_meal_ids int[] not null default '{}',
  checked_keys text[] not null default '{}',
  updated_at timestamptz not null default now()
);
insert into list_state (id) values ('main') on conflict (id) do nothing;

-- 2. Row Level Security: allow the app's anon key to read/write everything.
-- This is a single-user personal app with no login; the anon key is public by design,
-- so this just turns RLS on with an open policy rather than leaving it off entirely.

alter table stores enable row level security;
alter table categories enable row level security;
alter table meals enable row level security;
alter table recipe_items enable row level security;
alter table always_buy_items enable row level security;
alter table list_state enable row level security;

create policy "anon full access" on stores for all using (true) with check (true);
create policy "anon full access" on categories for all using (true) with check (true);
create policy "anon full access" on meals for all using (true) with check (true);
create policy "anon full access" on recipe_items for all using (true) with check (true);
create policy "anon full access" on always_buy_items for all using (true) with check (true);
create policy "anon full access" on list_state for all using (true) with check (true);

-- 3. Enable Realtime on list_state so both devices see live updates.
alter publication supabase_realtime add table list_state;

-- 4. Seed data
insert into stores (name, sort_order) values
  ('Costco', 0),
  ('Trader Joe''s', 1),
  ('Veggies/Meat', 2),
  ('Dairy', 3),
  ('Aisle', 4)
on conflict (name) do nothing;

insert into categories (label, sort_order) values
  ('🥦 Meatless', 0),
  ('🍗 Chicken', 1),
  ('🥩 Beef', 2),
  ('🗂️ Misc', 3)
on conflict (label) do nothing;

insert into meals (name, category_id, sort_order) values
  ('Almond Butter & Jam', (select id from categories where label='🥦 Meatless'), 0),
  ('Bean & Cheese Burritos', (select id from categories where label='🥦 Meatless'), 1),
  ('Egg Foo Young', (select id from categories where label='🥦 Meatless'), 2),
  ('Fried Rice', (select id from categories where label='🥦 Meatless'), 3),
  ('Protein Smoothie', (select id from categories where label='🥦 Meatless'), 4),
  ('Buffalo Chicken Wraps', (select id from categories where label='🍗 Chicken'), 5),
  ('Buffalo Meatball Sub', (select id from categories where label='🍗 Chicken'), 6),
  ('Chicken & Potatoes', (select id from categories where label='🍗 Chicken'), 7),
  ('Chicken Caesar Wrap', (select id from categories where label='🍗 Chicken'), 8),
  ('Chicken Nachos', (select id from categories where label='🍗 Chicken'), 9),
  ('Chicken Quesadillas', (select id from categories where label='🍗 Chicken'), 10),
  ('Chicken Tacos', (select id from categories where label='🍗 Chicken'), 11),
  ('Hotdogs', (select id from categories where label='🍗 Chicken'), 12),
  ('Pepperoni Sub', (select id from categories where label='🍗 Chicken'), 13),
  ('Rice & Meatballs', (select id from categories where label='🍗 Chicken'), 14),
  ('Sausage & Peppers', (select id from categories where label='🍗 Chicken'), 15),
  ('TJ Meatballs', (select id from categories where label='🍗 Chicken'), 16),
  ('Baked Ziti', (select id from categories where label='🥩 Beef'), 17),
  ('Beef & Broccoli', (select id from categories where label='🥩 Beef'), 18),
  ('Beef Tacos', (select id from categories where label='🥩 Beef'), 19),
  ('Chili Cheese Fries', (select id from categories where label='🥩 Beef'), 20),
  ('Ground Beef Mac & Cheese', (select id from categories where label='🥩 Beef'), 21),
  ('Lasagna', (select id from categories where label='🥩 Beef'), 22),
  ('Pasta', (select id from categories where label='🥩 Beef'), 23),
  ('Corn Dogs', (select id from categories where label='🗂️ Misc'), 24),
  ('Fried Rice + Sausage', (select id from categories where label='🗂️ Misc'), 25),
  ('Mexican Rice', (select id from categories where label='🗂️ Misc'), 26),
  ('Pizza', (select id from categories where label='🗂️ Misc'), 27),
  ('Sandwich', (select id from categories where label='🗂️ Misc'), 28)
on conflict (name) do nothing;

insert into recipe_items (meal_id, store_id, name, qty, unit) values
  ((select id from meals where name='Almond Butter & Jam'), (select id from stores where name='Costco'), 'Kirkland organic almond butter', 32, 'g'),
  ((select id from meals where name='Almond Butter & Jam'), (select id from stores where name='Costco'), 'Kirkland organic strawberry spread', 54, 'g'),
  ((select id from meals where name='Almond Butter & Jam'), (select id from stores where name='Aisle'), 'Milton''s Hearty Whole Grain bread', 2, 'slices'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 1.5, 'lb'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Aisle'), 'Ziti pasta', 1, 'lb'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Aisle'), 'Tomato paste', 1, 'tbsp'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Aisle'), 'Red lentils (dry)', 1, 'cup'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Aisle'), 'Vegetable broth', 1, 'can'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Aisle'), 'Olive oil', 1, 'tbsp'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Trader Joe''s'), 'Rao''s marinara', 1, 'jar'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Dairy'), 'Low fat cottage cheese', 1, 'cup'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Dairy'), 'Part skim ricotta', 1, 'cup'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Dairy'), 'Mozzarella', 1, 'cup'),
  ((select id from meals where name='Baked Ziti'), (select id from stores where name='Dairy'), 'Parmesan', 1, 'cup'),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Aisle'), 'Fat free refried beans', 2, 'cans'),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Aisle'), 'Large flour tortillas', 6, ''),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Aisle'), 'Smoked paprika', 1, 'tsp'),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 0.5, ''),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 0.5, ''),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Veggies/Meat'), 'Garlic', 2, 'cloves'),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Dairy'), 'Lucerne RF colby jack', 2, 'cups'),
  ((select id from meals where name='Bean & Cheese Burritos'), (select id from stores where name='Costco'), 'Olive oil', 2, 'tbsp'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Veggies/Meat'), 'Flank steak', 1, 'lb'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Veggies/Meat'), 'Fresh broccoli', 4, 'cups'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Veggies/Meat'), 'Fresh ginger', 1, 'tsp'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Veggies/Meat'), 'Garlic', 3, 'cloves'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 0.33, 'cup'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Aisle'), 'Brown sugar', 3, 'tbsp'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Aisle'), 'Cornstarch', 1.5, 'tbsp'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Aisle'), 'Sesame oil', 1, 'tbsp'),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Aisle'), 'White rice', 1, ''),
  ((select id from meals where name='Beef & Broccoli'), (select id from stores where name='Costco'), 'Avocado oil', 2, 'tbsp'),
  ((select id from meals where name='Beef Tacos'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 1, 'lb'),
  ((select id from meals where name='Beef Tacos'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Beef Tacos'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, 'cup'),
  ((select id from meals where name='Beef Tacos'), (select id from stores where name='Aisle'), 'Taco shells', 1, 'box'),
  ((select id from meals where name='Beef Tacos'), (select id from stores where name='Dairy'), 'General cheese', 1, 'cup'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Costco'), 'Kirkland lightly breaded chicken chunks', 1, 'bag'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Aisle'), 'Mission Carb Balance large flour tortillas', 1, 'pkg'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Aisle'), 'Sweet Baby Ray''s buffalo sauce', 1, 'bottle'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Aisle'), 'Ken''s Steakhouse Lite Ranch', 1, 'bottle'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, 'head'),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Veggies/Meat'), 'Tomato', 1, ''),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Veggies/Meat'), 'Red onion', 1, ''),
  ((select id from meals where name='Buffalo Chicken Wraps'), (select id from stores where name='Dairy'), 'Mozzarella', 1, 'cup'),
  ((select id from meals where name='Buffalo Meatball Sub'), (select id from stores where name='Trader Joe''s'), 'Trader Joe''s meatballs', 1, 'bag'),
  ((select id from meals where name='Buffalo Meatball Sub'), (select id from stores where name='Aisle'), 'Sweet Baby Ray''s buffalo sauce', 1, 'bottle'),
  ((select id from meals where name='Buffalo Meatball Sub'), (select id from stores where name='Aisle'), 'Sandwich bread', 1, 'loaf'),
  ((select id from meals where name='Buffalo Meatball Sub'), (select id from stores where name='Dairy'), 'General cheese', 1, 'cup'),
  ((select id from meals where name='Chicken & Potatoes'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1, 'lb'),
  ((select id from meals where name='Chicken & Potatoes'), (select id from stores where name='Veggies/Meat'), 'Russet potatoes', 3, ''),
  ((select id from meals where name='Chicken & Potatoes'), (select id from stores where name='Veggies/Meat'), 'Fresh broccoli', 1, 'head'),
  ((select id from meals where name='Chicken & Potatoes'), (select id from stores where name='Veggies/Meat'), 'Carrots', 1, 'bag'),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1, 'lb'),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, 'head'),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Veggies/Meat'), 'Tomato', 1, ''),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Aisle'), 'Caesar dressing', 1, 'bottle'),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Aisle'), 'Croutons', 1, 'bag'),
  ((select id from meals where name='Chicken Caesar Wrap'), (select id from stores where name='Aisle'), 'Large flour tortillas', 1, 'pkg'),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1, 'lb'),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Aisle'), 'Corn tortillas', 1, 'pkg'),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Aisle'), 'Canned beans', 1, 'can'),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Veggies/Meat'), 'Tomato', 2, ''),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Chicken Nachos'), (select id from stores where name='Dairy'), 'General cheese', 2, 'cups'),
  ((select id from meals where name='Chicken Quesadillas'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1, 'lb'),
  ((select id from meals where name='Chicken Quesadillas'), (select id from stores where name='Veggies/Meat'), 'Red pepper', 1, ''),
  ((select id from meals where name='Chicken Quesadillas'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 1, ''),
  ((select id from meals where name='Chicken Quesadillas'), (select id from stores where name='Aisle'), 'Large flour tortillas', 1, 'pkg'),
  ((select id from meals where name='Chicken Quesadillas'), (select id from stores where name='Dairy'), 'Lucerne RF colby jack', 1, 'cup'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Trader Joe''s'), 'Chicken breast', 1, 'lb'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Aisle'), 'Taco shells', 1, 'box'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, 'head'),
  ((select id from meals where name='Chicken Tacos'), (select id from stores where name='Dairy'), 'General cheese', 1, 'cup'),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 2, 'lb'),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Veggies/Meat'), 'Russet potatoes', 3, ''),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Aisle'), 'Chili packet', 1, 'pkg'),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Aisle'), 'Tomato sauce', 1, 'can'),
  ((select id from meals where name='Chili Cheese Fries'), (select id from stores where name='Dairy'), 'General cheese', 2, 'cups'),
  ((select id from meals where name='Corn Dogs'), (select id from stores where name='Costco'), 'Foster Farms Jumbo corn dogs', 1, 'box'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Costco'), 'Kirkland egg whites', 16, 'oz'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Costco'), 'Frozen broccoli', 0.5, 'lb'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Dairy'), 'Eggs', 7, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Aisle'), 'Sesame oil', 34, 'g'),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 1, ''),
  ((select id from meals where name='Egg Foo Young'), (select id from stores where name='Veggies/Meat'), 'Red pepper', 1, ''),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Aisle'), 'White rice', 1, 'cup dry'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 3, 'tbsp'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Aisle'), 'Sesame oil', 1, 'tbsp'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Costco'), 'Frozen mixed vegetables', 2, 'cups'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Costco'), 'Kirkland egg whites', 1, 'cup'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Costco'), 'Avocado oil', 3, 'tbsp'),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Dairy'), 'Eggs', 3, ''),
  ((select id from meals where name='Fried Rice'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Aisle'), 'White rice', 1, 'cup dry'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Aisle'), 'Low-sodium soy sauce', 3, 'tbsp'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Aisle'), 'Sesame oil', 1, 'tbsp'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Costco'), 'Frozen mixed vegetables', 2, 'cups'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Costco'), 'Kirkland egg whites', 1, 'cup'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Costco'), 'Avocado oil', 3, 'tbsp'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Costco'), 'Kam Yen Jan Chinese sausage', 5, 'links'),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Dairy'), 'Eggs', 3, ''),
  ((select id from meals where name='Fried Rice + Sausage'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 1, 'lb'),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Veggies/Meat'), 'Tomato', 1, ''),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Aisle'), 'Barilla whole wheat rotini', 1, 'lb'),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Aisle'), 'Tomato paste', 1, 'tbsp'),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Dairy'), 'Low fat cottage cheese', 1, 'cup'),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Dairy'), 'Lucerne RF colby jack', 1, 'cup'),
  ((select id from meals where name='Ground Beef Mac & Cheese'), (select id from stores where name='Dairy'), '1% milk', 0.5, 'cup'),
  ((select id from meals where name='Hotdogs'), (select id from stores where name='Veggies/Meat'), 'Chicken sausage', 1, 'pkg'),
  ((select id from meals where name='Hotdogs'), (select id from stores where name='Aisle'), 'Hotdog buns', 1, 'pkg'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 1, 'lb'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 0.75, 'cup'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Veggies/Meat'), 'Garlic', 3, 'cloves'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Veggies/Meat'), 'Fresh parsley', 0.25, 'cup'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Aisle'), 'Lasagna noodles', 9, ''),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Aisle'), 'Olive oil', 1, 'tbsp'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Aisle'), 'Italian seasoning', 1, 'tsp'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Trader Joe''s'), 'Rao''s marinara', 1.5, 'jars'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Dairy'), 'Egg', 1, ''),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Dairy'), 'Ricotta cheese', 15, 'oz'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Dairy'), 'Mozzarella', 16, 'oz'),
  ((select id from meals where name='Lasagna'), (select id from stores where name='Dairy'), 'Parmesan', 0.5, 'cup'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'White rice', 1.5, 'cups'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'Tomato paste', 1, 'tbsp'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'Tomato sauce', 6, 'oz'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'Garlic powder', 1, 'tbsp'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'Onion powder', 1.5, 'tsp'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Aisle'), 'Chicken bouillon', 1, 'tbsp'),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 0.5, ''),
  ((select id from meals where name='Mexican Rice'), (select id from stores where name='Costco'), 'Avocado oil', 1.5, 'tbsp'),
  ((select id from meals where name='Pasta'), (select id from stores where name='Veggies/Meat'), '96% lean ground beef', 1, 'lb'),
  ((select id from meals where name='Pasta'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Pasta'), (select id from stores where name='Costco'), 'Tomato sauce', 4, 'cans'),
  ((select id from meals where name='Pasta'), (select id from stores where name='Aisle'), 'Barilla whole wheat rotini', 1, 'lb'),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Veggies/Meat'), 'Turkey pepperoni', 1, 'pkg'),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, ''),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Trader Joe''s'), 'Rao''s marinara', 1, 'jar'),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Dairy'), 'Mozzarella', 1, 'cup'),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Dairy'), 'Parmesan', 1, 'cup'),
  ((select id from meals where name='Pepperoni Sub'), (select id from stores where name='Aisle'), 'Sandwich bread', 1, 'loaf'),
  ((select id from meals where name='Pizza'), (select id from stores where name='Trader Joe''s'), 'Pizza crust', 1, ''),
  ((select id from meals where name='Pizza'), (select id from stores where name='Aisle'), 'Yeast', 1, 'pkg'),
  ((select id from meals where name='Pizza'), (select id from stores where name='Veggies/Meat'), 'Turkey pepperoni', 1, 'pkg'),
  ((select id from meals where name='Pizza'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 1, ''),
  ((select id from meals where name='Pizza'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Pizza'), (select id from stores where name='Dairy'), 'General cheese', 2, 'cups'),
  ((select id from meals where name='Protein Smoothie'), (select id from stores where name='Costco'), 'Kirkland chocolate whey', 1, 'scoop'),
  ((select id from meals where name='Protein Smoothie'), (select id from stores where name='Costco'), 'Frozen strawberries', 140, 'g'),
  ((select id from meals where name='Protein Smoothie'), (select id from stores where name='Dairy'), '1% milk', 240, 'ml'),
  ((select id from meals where name='Protein Smoothie'), (select id from stores where name='Veggies/Meat'), 'Banana', 1, ''),
  ((select id from meals where name='Rice & Meatballs'), (select id from stores where name='Costco'), 'Teriyaki chicken meatballs', 1, 'bag'),
  ((select id from meals where name='Rice & Meatballs'), (select id from stores where name='Veggies/Meat'), 'Fresh broccoli', 1, 'head'),
  ((select id from meals where name='Rice & Meatballs'), (select id from stores where name='Veggies/Meat'), 'Carrots', 1, 'bag'),
  ((select id from meals where name='Rice & Meatballs'), (select id from stores where name='Aisle'), 'White rice', 1, 'cup'),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Costco'), 'Kirkland Black Forest ham', 130, 'g'),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Veggies/Meat'), 'French roll', 1, ''),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Veggies/Meat'), 'Romaine lettuce', 1, 'cup'),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Veggies/Meat'), 'Tomato', 1, ''),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Veggies/Meat'), 'Red onion', 0.25, ''),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Veggies/Meat'), 'Dill pickles', 1, 'jar'),
  ((select id from meals where name='Sandwich'), (select id from stores where name='Dairy'), 'Lucerne RF colby jack', 1, 'oz'),
  ((select id from meals where name='Sausage & Peppers'), (select id from stores where name='Veggies/Meat'), 'Chicken sausage', 1, 'pkg'),
  ((select id from meals where name='Sausage & Peppers'), (select id from stores where name='Veggies/Meat'), 'Yellow onion', 1, ''),
  ((select id from meals where name='Sausage & Peppers'), (select id from stores where name='Veggies/Meat'), 'Green pepper', 2, ''),
  ((select id from meals where name='Sausage & Peppers'), (select id from stores where name='Veggies/Meat'), 'Red pepper', 2, ''),
  ((select id from meals where name='TJ Meatballs'), (select id from stores where name='Trader Joe''s'), 'Trader Joe''s meatballs', 1, 'bag');

insert into always_buy_items (name, sort_order) values
  ('Milk', 0),
  ('Eggs', 1),
  ('Distilled water', 2),
  ('Bananas', 3)
on conflict (name) do nothing;
