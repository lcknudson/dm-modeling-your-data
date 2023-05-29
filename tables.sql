
CREATE TABLE users (
  user_id SERIAL PRIMARY KEY
  ,	user_email VARCHAR(100) NOT NULL
  ,	user_password VARCHAR(50) NOT NULL
  , username VARCHAR(50) 
  ,	display_name varchar(50)
);

CREATE TABLE ingredients (
	ing_id SERIAL PRIMARY KEY
  , ing_name VARCHAR(150) NOT NULL
);

CREATE TABLE occasion (
	occ_id SERIAL PRIMARY KEY
	, occ_date DATE
	, location VARCHAR(100)
);

CREATE TABLE store (
	store_id SERIAL PRIMARY KEY
	, store_name VARCHAR(50) NOT NULL
	, store_location VARCHAR(150) null
);

CREATE TABLE shopping_list (
	list_id SERIAL PRIMARY KEY
	, list_name VARCHAR(100) NULL
	, list_active BOOLEAN NULL
    , ingredient_id INTEGER REFERENCES ingredients(ing_id) 
     , store_id INTEGER REFERENCES store(store_id) 
);


CREATE TABLE recipe_view (
	recipe_id SERIAL PRIMARY KEY
	, user_id INTEGER
  	REFERENCES users(user_id) NOT NULL
	, recipe_name VARCHAR(100) NOT NULL
	, recipe_privacy BOOLEAN
	, add_to_list INTEGER 
  	REFERENCES shopping_list(list_id) NULL
  , occassion INTEGER REFERENCES occasion(occ_id) NULL
);

CREATE TABLE recipe_ingredients (
    recipe_id INTEGER REFERENCES recipe_view(recipe_id),
    recipe_ingredient_id INTEGER REFERENCES ingredients(ing_id)  
);

CREATE TABLE recipe_instructions (
    recipe_id INTEGER REFERENCES recipe_view(recipe_id),
    instructions TEXT,
    amount_ing INTEGER,
    ingredient_description TEXT
);