-- Création de la table Restaurants

CREATE TABLE "Restaurants" (
    "IdRestaurant" INTEGER,
    "Name" VARCHAR(50),
    "Planet" VARCHAR(50),
    "Opening_year" INTEGER
);

-- Création de la table employés

CREATE TABLE "Employees" (
	"IdEmployees" INTEGER,
	"Firstname" VARCHAR(50),
	"Lastname" VARCHAR(50),
	"Role" VARCHAR(50),
	"IdRestaurant" INTEGER
);

-- Creation de la table des plats

CREATE TABLE "Dishes" (
	"IdDishes" INTEGER,
	"Name" VARCHAR(50),
	"Price" INTEGER,
	"Category" VARCHAR(50)
);

-- Creation orders

CREATE TABLE "Orders" (
	"IdOrders" INTEGER,
	"IdRestaurant" INTEGER,
	"Total_amount" INTEGER,
	"Customer_name" VARCHAR(50)
);

-- creation orderitems

CREATE TABLE "OrderItems" (
	"IdOrderItems" INTEGER,
	"IdOrders" INTEGER,
	"IdDishes" INTEGER,
	"Quantity" INTEGER
);

-- Corriger nos mefaits 

DROP TABLE "Restaurants";

-- Ajouter une colonne 

ALTER TABLE Employees 
ADD COLUMN hire_date datetime

-- ajout de colone non null

ALTER TABLE Dishes
ADD COLUMN is_vegan BOOLEAN NULL

