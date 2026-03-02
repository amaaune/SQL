-- Creation de la DB ------------------------------------<>

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

-- Corriger nos mefaits ---------------------------------<>

DROP TABLE "Restaurants";

-- Ajouter une colonne 

ALTER TABLE Employees 
ADD COLUMN hire_date datetime;

-- ajout de colone non null

ALTER TABLE Dishes
ADD COLUMN is_vegan BOOLEAN NULL;

-- Renomer une table 
ALTER TABLE Orders
RENAME TO CustomerOrders;

-- Initialiser les lignes -------------------------------<>

-- exemple restaurants
INSERT INTO Restaurants (Name, Planet, Opening_year)
VALUES ('Le Trou Noir Gourmand', 'Sagittarius A*', 2450);

-- exemple employés
INSERT INTO Employees (Firstname, Lastname, Role, IdRestaurant)
VALUES ('X Æ A-12', 'Musk-Junior', 'Chef de Cuisine', 3);

-- exemple dishes 
INSERT INTO Dishes (Name, Price, Category)
VALUES ('Burger d''Astéroïde Croquant', 45.50, 'Plat');

-- exemple order 
INSERT INTO CustomerOrders (IdRestaurant, Total_amount, Customer_name)
VALUES (1, 150.50, 'Capitaine Kirk');

-- exemple OrderItems
INSERT INTO orderitems (IdOrders, IdDishes, Quantity)
VALUES (1, 1, 2);

-- maniputalion de la DB --------------------------------<>
-- * list all restaurants
SELECT name
FROM Restaurants;

-- * tous les plats classe en decroissant 
SELECT name, Price
FROM Dishes
ORDER BY Price DESC;

-- * list employés par roles
SELECT Firstname || ' ' || Lastname AS Employé, Role
FROM Employees
ORDER BY Role;

-- * List plats vegan
SELECT name AS 'Vegan Dishes'
FROM Dishes
WHERE is_vegan;

-- * plat > moyenne
SELECT name, Price
FROM Dishes
WHERE Price > (SELECT AVG(Price) FROM Dishes);

-- GESTION DES NULLS

-- * vegan NULL
SELECT name
FROM Dishes
WHERE is_vegan IS NULL;

-- * employés sans hire date
SELECT Firstname || ' ' || Lastname As Employés
FROM Employees
WHERE hire_date IS NULL;

-- Creation et gestions des commandes -------------------<>

--* 3 commandes differents restau
INSERT INTO CustomerOrders (IdRestaurant, Total_amount, Customer_name)
VALUES (2, 22.50, 'Marty McFly'), (9, 12.0, 'Katniss Everdeen'), (4, 18.0, 'Luke Skywalker');

--* order item associées 
INSERT INTO orderitems (IdOrders, IdDishes, Quantity)
VALUES (13, 1, 1), (14, 15, 1), (15, 2, 1);

--* Calcul par commande (article/amount)
SELECT 
	CustomerOrders.IdOrders AS ID,
	SUM(OrderItems.Quantity) / CustomerOrders.Total_amount AS Calcul
FROM OrderItems
LEFT JOIN CustomerOrders ON OrderItems.IdOrders = CustomerOrders.IdOrders
GROUP BY OrderItems.IdOrders;

--* List commandes par DESC 
SELECT IdOrders,
	Total_amount,
	Customer_name
FROM CustomerOrders
ORDER BY Total_amount DESC;


-- JOINTURES --------------------------------------------<>
*
*
*

-- Mise a Jours Intelligente ----------------------------<>

--* Plat > 12 reduction de 10% 
UPDATE Dishes
SET Price = Price * 0.9
WHERE Price > 12

--* sinon reduction 5%
UPDATE Dishes
SET Price = Price * 0.95
WHERE Price < 12

-- Supressions ------------------------------------------<>

--* Suppr Plat Prix NULL


--* Suppr comande < 5

-- Mini-Analyse -----------------------------------------<>

--* Prix moyen par categorie
SELECT name,
	AVG(Price) AS 'Prix Moyen',
	Category
FROM Dishes
GROUP BY Category;

--* montant total des ventes

--* les trois plats les plus cher

--* 