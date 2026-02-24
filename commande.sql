Create table "Restaurants" (
    "IdRestaurant" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Name" VARCHAR(50),  
    "Planet" VARCHAR(50),
    "Opening-year" INTEGER
);
Create table "Employees" (
    "IdEmployees" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Firstname" VARCHAR(50),
    "Lastname" VARCHAR(50),
    "Role" VARCHAR(50),
    "IdRestaurant" INTEGER, 
    FOREIGN KEY (IdRestaurant) REFERENCES Restaurants(IdRestaurant)
);

Create table "Dishes" (
    "IdDishes" INTEGER PRIMARY KEY AUTOINCREMENT,
    "Name" VARCHAR(50),
    "Price" INTEGER,
    "Category" VARCHAR(50)
);

Create table "Orders" (
	"IdOrders" INTEGER PRIMARY KEY AUTOINCREMENT,
	"IdRestaurant" INTEGER,
	"Total_amount" INTEGER,
	"Customer_name" VARCHAR(50)
);

Create table "OrderItems" (
    "IdOrderItems" INTEGER PRIMARY KEY AUTOINCREMENT,
    "IdOrders" INTEGER,
    "IdDishes" INTEGER,
    "Quantity" INTEGER,
    FOREIGN KEY (IdOrders) REFERENCES Orders(IdOrders)
    FOREIGN KEY (IdDishes) REFERENCES Dishes(IdDishes)
);

ALTER TABLE Employees
ADD hire_date INTEGER

ALTER TABLE Dishes
ADD is_vegan BOOLEAN NULL,

ALTER TABLE Orders
RENAME TO CustomerOrders;

INSERT INTO Restaurants (Name, Planet, Opening_year)
VALUES
('Milky Way Diner', 'Terre', 2301),
('Saturn Rings Grill', 'Saturne', 2410),
('Nebula Snack Bar', 'Alpha Centauri', 2455),
('Quasar QuickBite', 'Proxima B', 2472),
('Black Hole BBQ', 'Gargantua', 2480);

INSERT INTO Employees (Firstname, Lastname, Role, IdRestaurant, hire_date)
VALUES
('Zorglub', 'Xen', 'Chef cuisinier', 1, '2478-05-12'),
('Mira', 'Solari', 'Serveuse', 1, '2480-03-20'),
('Kroth', 'Varn', 'Manager', 2, '2470-11-02'),
('Lunara', 'Vex', 'Cuisinière', 3, '2483-01-14'),
('Tork', 'Blenn', 'Serveur', 4, '2485-09-03'),
('Ishara', 'Kel', 'Responsable hygiène', 5, '2484-12-22');

INSERT INTO Dishes (Name, Price, Category, is_vegan)
VALUES
('Burger d’Astéroïde', 12.50, 'Burgers', FALSE),
('Pizza Antimatière Douce', 18.90, 'Pizzas', FALSE),
('Smoothie de Nébuleuse', 9.20, 'Boissons', TRUE),
('Tacos Ionisés', 14.00, 'Tacos', FALSE),
('Soupe de Comète', 11.30, 'Soupes', TRUE),
('Salade Quantique', 10.50, 'Salades', TRUE),
('Wrap Photoniques', 13.40, 'Wraps', TRUE),
('Steak de Météorite', 22.80, 'Plats', FALSE);*

INSERT INTO CustomerOrders (IdRestaurant, Total_amount, Customer_name)
VALUES
(1, 34.70, 'John Stellar'),
(2, 18.90, 'Luna Vega'),
(3, 45.10, 'Orion Pax'),
(4, 27.80, 'Nova Helix'),
(5, 22.80, 'Gamma Flux');

INSERT INTO CustomerOrders (IdOrders, IdDishes, Quantity)
VALUES
(1, 1, 2),  -- 2 Burgers d’Astéroïde
(1, 3, 1),  -- 1 Smoothie de Nébuleuse

(2, 2, 1),  -- 1 Pizza antimatière

(3, 4, 2),  -- 2 Tacos Ionisés
(3, 6, 1),  -- 1 Salade Quantique

(4, 5, 2),  -- 2 Soupes de Comète

(5, 8, 1);  -- 1 Steak de Météorite 

SELECT * FROM Restaurants;

SELECT Price,
FROM table Dishes
ORDER BY Prive DESC,

SELECT Role
FROM table Employees
ORDER BY Role

SELECT *
FROM Dishes
WHERE Price > (SELECT AVG(Price) FROM Dishes);
