-- === Nutrition columns + per-serving data for all 17 documented recipes ===

alter table meals add column if not exists servings int;
alter table meals add column if not exists calories_per_serving int;
alter table meals add column if not exists protein_g numeric;
alter table meals add column if not exists carbs_g numeric;
alter table meals add column if not exists fat_g numeric;
alter table meals add column if not exists sat_fat_g numeric;

update meals set servings = 4, calories_per_serving = 550, protein_g = 31.4, carbs_g = 55.6, fat_g = 21.8, sat_fat_g = 6.7 where name = 'Beef & Broccoli';
update meals set servings = 6, calories_per_serving = 218, protein_g = 16.9, carbs_g = 7.1, fat_g = 13.6, sat_fat_g = 4.4 where name = 'Beef Bulgogi';
update meals set servings = 6, calories_per_serving = 407, protein_g = 42.0, carbs_g = 27.9, fat_g = 22.6, sat_fat_g = 8.4 where name = 'Beef n Gravy';
update meals set servings = 4, calories_per_serving = 1303, protein_g = 65.8, carbs_g = 67.3, fat_g = 86.0, sat_fat_g = 53.1 where name = 'Cheesy Scalloped Potatoes';
update meals set servings = 6, calories_per_serving = 1742, protein_g = 66.1, carbs_g = 79.3, fat_g = 130.3, sat_fat_g = 75.7 where name = 'Broccoli Chicken Alfredo';
update meals set servings = 4, calories_per_serving = 1341, protein_g = 80.9, carbs_g = 167.7, fat_g = 31.7, sat_fat_g = 11.0 where name = 'Chicken Parmesan';
update meals set servings = 6, calories_per_serving = 608, protein_g = 28.5, carbs_g = 56.1, fat_g = 30.3, sat_fat_g = 7.4 where name = 'Chicken Tacos';
update meals set servings = 3, calories_per_serving = 435, protein_g = 34.2, carbs_g = 29.4, fat_g = 20.9, sat_fat_g = 6.6 where name = 'Egg Foo Young';
update meals set servings = 6, calories_per_serving = 456, protein_g = 17.2, carbs_g = 42.0, fat_g = 20.5, sat_fat_g = 8.9 where name = 'French Onion Soup';
update meals set servings = 16, calories_per_serving = 99, protein_g = 0.8, carbs_g = 0.6, fat_g = 10.6, sat_fat_g = 6.7 where name = 'Garlic Butter';
update meals set servings = 6, calories_per_serving = 1223, protein_g = 68.9, carbs_g = 137.0, fat_g = 43.0, sat_fat_g = 21.3 where name = 'Lasagna';
update meals set servings = 4, calories_per_serving = 590, protein_g = 12.1, carbs_g = 79.4, fat_g = 25.1, sat_fat_g = 10.7 where name = 'Mom''s Fried Ramen';
update meals set servings = 6, calories_per_serving = 217, protein_g = 26.7, carbs_g = 8.6, fat_g = 7.6, sat_fat_g = 1.5 where name = 'Pan Seared Chicken Breast';
update meals set servings = 3, calories_per_serving = 775, protein_g = 51.6, carbs_g = 57.5, fat_g = 36.7, sat_fat_g = 18.5 where name = 'Philly Cheesesteak';
update meals set servings = 3, calories_per_serving = 807, protein_g = 23.5, carbs_g = 142.6, fat_g = 14.6, sat_fat_g = 2.1 where name = 'Pizza Dough';
update meals set servings = 6, calories_per_serving = 476, protein_g = 13.0, carbs_g = 36.5, fat_g = 31.3, sat_fat_g = 19.5 where name = 'Red Lobster Biscuits';
update meals set servings = 6, calories_per_serving = 75, protein_g = 1.6, carbs_g = 7.0, fat_g = 4.5, sat_fat_g = 0.6 where name = 'Asian Sauce';