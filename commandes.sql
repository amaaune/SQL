-- Création de la table Restaurants

CREATE TABLE "Restaurants" (
    "IdRestaurant" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Name" VARCHAR(50) NOT NULL,
    "Planet" VARCHAR(50),
    "Opening_year" INTEGER
);

-- Création de la table employés

CREATE TABLE "Employees" (
	"IdEmployees" INTEGER PRIMARY KEY AUTOINCREMENT,
	"Firstname" VARCHAR(50),
	"Lastname" VARCHAR(50),
	"Role" VARCHAR(50),
	"IdRestaurant" INTEGER,
	FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

-- Creation de la table des plats

CREATE TABLE "Dishes" (
	"IdDishes" INTEGER PRIMARY KEY AUTOINCREMENT,
	"Name" VARCHAR(50),
	"Price" INTEGER,
	"Category" VARCHAR(50)
);

-- Creation orders

CREATE TABLE "Orders" (
	"IdOrders" INTEGER PRIMARY KEY AUTOINCREMENT,
	"IdRestaurant" INTEGER,
	"Total_amount" INTEGER,
	"Customer_name" VARCHAR(50),
	FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

-- creation orderitems

CREATE TABLE "OrderItems" (
	"IdOrderItems" INTEGER PRIMARY KEY AUTOINCREMENT,
	"IdOrders" INTEGER,
	"IdDishes" INTEGER,
	"Quantity" INTEGER,
	FOREIGN KEY (IdOrders) REFERENCES Orders(IdOrders),
    FOREIGN KEY (IdDishes) REFERENCES Dishes(IdDishes)
);

-- Corriger nos mefaits 

DROP TABLE "Restaurants";

-- Ajouter une colonne 

ALTER TABLE Employees 
ADD COLUMN hire_date datetime

-- ajout de colone non null

ALTER TABLE Dishes
ADD COLUMN is_vegan BOOLEAN NULL

-- Initialiser les lignes 

-- exemple restaurants
INSERT INTO Restaurants (Name, Planet, Opening_year)
VALUES ('Le Trou Noir Gourmand', 'Sagittarius A*', 2450);

-- exemple employés
INSERT INTO Employees (Firstname, Lastname, Role, IdRestaurant)
VALUES ('X Æ A-12', 'Musk-Junior', 'Chef de Cuisine', 3);

-- exemple dishes 
INSERT INTO Dishes (Name, Price, Category)
VALUES ('Burger d''Astéroïde Croquant', 45.50, 'Plat');
