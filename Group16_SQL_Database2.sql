-- Bakery Management System SQL File - Group 16

-- ===================== DATABASE SETUP =====================
CREATE DATABASE IF NOT EXISTS cis4365springdb;
USE cis4365springdb;

-- ===================== TABLE DEFINITIONS =====================

-- Table: test
CREATE TABLE IF NOT EXISTS test (
    id INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    fname VARCHAR(20) NOT NULL
);

-- Table: Supplier
CREATE TABLE Supplier (
    Supplier_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_Name VARCHAR(100) NOT NULL,
    Supplier_Zip VARCHAR(10) NOT NULL,
    Supplier_State CHAR(2) NOT NULL,
    Supplier_Address VARCHAR(150) NOT NULL,
    Store_City VARCHAR(50) NOT NULL,
    Supplier_Email VARCHAR(100),
    Supplier_Stock INT CHECK (Supplier_Stock >= 0),
    CHECK (Supplier_Zip REGEXP '^[0-9]{5}(-[0-9]{4})?$')
);

-- Table: Recipe
CREATE TABLE Recipe (
    Recipe_ID INT AUTO_INCREMENT PRIMARY KEY,
    Cook_Time INT NOT NULL CHECK (Cook_Time >= 0),
    Prep_Time INT NOT NULL CHECK (Prep_Time >= 0)
);

-- Table: Equipment
CREATE TABLE Equipment (
    Equipment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Equipment_Name VARCHAR(100) NOT NULL,
    Date_of_Purchase DATE,
    Equipment_Condition VARCHAR(50) NOT NULL,
    Inventory_ID INT,
    Date_Of_Maintenance DATE,
    FOREIGN KEY (Inventory_ID) REFERENCES Inventory(Inventory_ID)
);

-- Table: Ingredient
CREATE TABLE Ingredient (
    Ingredient_ID INT AUTO_INCREMENT PRIMARY KEY,
    Ingredient_Name VARCHAR(100) NOT NULL,
    Quantity_in_Stock INT DEFAULT 0 CHECK (Quantity_in_Stock >= 0)
);

-- Table: Inventory
CREATE TABLE Inventory (
    Inventory_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_ID INT NOT NULL,
    Ingredient_ID INT NOT NULL,
    Inventory_Type VARCHAR(50),
    Last_Updated DATETIME DEFAULT CURRENT_TIMESTAMP,
    Inventory_Quantity INT DEFAULT 0 CHECK (Inventory_Quantity >= 0),
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID)
);

-- Table: Waste_Log
CREATE TABLE Waste_Log (
    WasteLog_ID INT AUTO_INCREMENT PRIMARY KEY,
    Ingredient_ID INT NOT NULL,
    Date_of_Waste DATE NOT NULL,
    Amount_Wasted INT NOT NULL CHECK (Amount_Wasted > 0),
    FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID)
);

-- Table: Invoice (using second definition with Store_Loc_ID)
CREATE TABLE Invoice (
    Invoice_ID INT AUTO_INCREMENT PRIMARY KEY,
    Supplier_ID INT NOT NULL,
    Store_Loc_ID INT NOT NULL,
    Store_Amount DECIMAL(10,2) DEFAULT 0.00 CHECK (Store_Amount >= 0),
    Invoice_Date DATE NOT NULL,
    FOREIGN KEY (Supplier_ID) REFERENCES Supplier(Supplier_ID),
    FOREIGN KEY (Store_Loc_ID) REFERENCES Store_Location(Store_Loc_ID)
);

-- Table: Equipment_List (associative entity linking Equipment and Recipe)
CREATE TABLE Equipment_List (
    Equipment_List_ID INT AUTO_INCREMENT PRIMARY KEY,
    Recipe_ID INT NOT NULL,
    Equipment_ID INT NOT NULL,
    FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),
    FOREIGN KEY (Equipment_ID) REFERENCES Equipment(Equipment_ID)
);

-- Table: Ingredient_List (associative entity linking Ingredient and Recipe)
CREATE TABLE Ingredient_List (
    Ingredient_List_ID INT AUTO_INCREMENT PRIMARY KEY,
    Recipe_ID INT NOT NULL,
    Ingredient_ID INT NOT NULL,
    Quantity_Required INT NOT NULL DEFAULT 1 CHECK (Quantity_Required > 0),
    FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),
    FOREIGN KEY (Ingredient_ID) REFERENCES Ingredient(Ingredient_ID)
);

-- Table: Store_Location
CREATE TABLE Store_Location (
    Store_Loc_ID INT AUTO_INCREMENT PRIMARY KEY,
    Store_Name VARCHAR(100) NOT NULL,
    Store_Zip VARCHAR(10) NOT NULL,
    Store_State CHAR(2) NOT NULL,
    Store_Address VARCHAR(150) NOT NULL,
    Store_City VARCHAR(50) NOT NULL,
    Store_Phone VARCHAR(15) NOT NULL,
    CHECK (Store_Zip REGEXP '^[0-9]{5}(-[0-9]{4})?$')
);

-- Table: Gift_Card
CREATE TABLE Gift_Card (
    Gift_Card_ID INT AUTO_INCREMENT PRIMARY KEY,
    Gift_Card_Name VARCHAR(100) NOT NULL,
    Amount DECIMAL(10,2) NOT NULL
);

-- Table: Customer
CREATE TABLE Customer (
    Customer_ID INT AUTO_INCREMENT PRIMARY KEY,
    Loyalty_Program_ID INT,
    Customer_Lname VARCHAR(100),
    Customer_Fname VARCHAR(100),
    Customer_Email VARCHAR(100),
    Customer_Zip VARCHAR(10),
    Customer_State CHAR(2),
    Customer_Address VARCHAR(255),
    Customer_City VARCHAR(100),
    Join_Date DATE
);

-- Table: Loyalty_Program
CREATE TABLE Loyalty_Program (
    Loyalty_Program_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Program_Name VARCHAR(100),
    Points_Earned INT,
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID)
);

-- Table: Gift_Card_Log (associative entity linking Customer and Gift_Card)
CREATE TABLE Gift_Card_Log (
    Customer_Gift_Card_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Gift_Card_ID INT,
    Purchase_Date DATE,
    Expiration_Date DATE,
    Balance DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Gift_Card_ID) REFERENCES Gift_Card(Gift_Card_ID)
);

-- Table: Package
CREATE TABLE Package (
    Package_ID INT AUTO_INCREMENT PRIMARY KEY,
    Employee_ID INT,
    Package_Type VARCHAR(50),
    Package_Cost DECIMAL(10,2),
    FOREIGN KEY (Employee_ID) REFERENCES Employee(Employee_ID)
);

-- Table: Delivery
CREATE TABLE Delivery (
    Delivery_ID INT AUTO_INCREMENT PRIMARY KEY,
    Packaging_ID INT,
    Delivery_Date DATE,
    Delivery_Status VARCHAR(50),
    Delivery_Zip VARCHAR(10),
    Delivery_State CHAR(2),
    Delivery_Address VARCHAR(255),
    Delivery_City VARCHAR(100),
    Delivery_Cost DECIMAL(10,2),
    Store_Location INT,
    FOREIGN KEY (Packaging_ID) REFERENCES Package(Package_ID),
    FOREIGN KEY (Store_Location) REFERENCES Store_Location(Store_Loc_ID)
);

-- Table: Product
CREATE TABLE Product (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Recipe_ID INT,
    Nutritional_Info_ID INT,
    Inventory_ID INT,
    Price DECIMAL(10,2),
    Stock_Quantity INT,
    Category VARCHAR(50),
    FOREIGN KEY (Recipe_ID) REFERENCES Recipe(Recipe_ID),
    FOREIGN KEY (Nutritional_Info_ID) REFERENCES Nutritional_Info(Nutritional_Info_ID),
    FOREIGN KEY (Inventory_ID) REFERENCES Inventory(Inventory_ID)
);

-- Table: Payment
CREATE TABLE Payment (
    Payment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Tax_ID INT,
    Order_ID INT,
    Payment_Date DATE,
    Payment_Method VARCHAR(50),
    Amount_Paid DECIMAL(10,2),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Tax_ID) REFERENCES Tax(Tax_ID),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID)
);

-- Add the GiftCard_ID column (nullable)
ALTER TABLE Payment
ADD COLUMN GiftCard_ID INT;

-- Add a foreign key constraint linking to the GiftCard table
ALTER TABLE Payment
ADD CONSTRAINT fk_payment_giftcard
FOREIGN KEY (GiftCard_ID) REFERENCES Gift_Card(Gift_Card_ID);

-- Table: Tax
CREATE TABLE Tax (
    Tax_ID INT AUTO_INCREMENT PRIMARY KEY,
    Tax_Amount DECIMAL(10,2) NOT NULL
);

-- Table: Order
CREATE TABLE `Order` (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_ID INT,
    Payment_ID INT,
    Product_ID INT,
    Discount_ID INT,
    Package_ID INT,
    Catering_ID INT,
    Order_Date DATE,
    Total_Amount DECIMAL(10,2),
    Order_Status VARCHAR(50),
    Order_Type VARCHAR(50),
    FOREIGN KEY (Customer_ID) REFERENCES Customer(Customer_ID),
    FOREIGN KEY (Payment_ID) REFERENCES Payment(Payment_ID),
    FOREIGN KEY (Product_ID) REFERENCES Product(Product_ID),
    FOREIGN KEY (Discount_ID) REFERENCES Discount(Discount_ID),
    FOREIGN KEY (Package_ID) REFERENCES Package(Package_ID),
    FOREIGN KEY (Catering_ID) REFERENCES Catering(Catering_ID)
);

-- Table: Nutritional_Info
CREATE TABLE Nutritional_Info (
    Nutritional_Info_ID INT AUTO_INCREMENT PRIMARY KEY,
    Calories INT,
    Fat DECIMAL(5,2),
    Carbohydrates DECIMAL(5,2),
    Protein DECIMAL(5,2),
    Last_Update_Date DATE
);

-- Table: Catering
CREATE TABLE Catering (
    Catering_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT,
    Catering_Detail VARCHAR(255),
    FOREIGN KEY (Order_ID) REFERENCES `Order`(Order_ID)
);

-- Table: Catering_Event
CREATE TABLE Catering_Event (
    Event_ID INT AUTO_INCREMENT PRIMARY KEY,
    Event_Name VARCHAR(100),
    Event_Date DATE,
    Catering_ID INT,
    FOREIGN KEY (Catering_ID) REFERENCES Catering(Catering_ID)
);

-- Table: Discount
CREATE TABLE Discount (
    Discount_ID INT AUTO_INCREMENT PRIMARY KEY,
    Discount_Amount DECIMAL(10,2) NOT NULL,
    Discount_Type VARCHAR(100)
);

-- ===================== DATA INSERTION STATEMENTS =====================

-- Insert data into Gift_Card
INSERT INTO Gift_Card VALUES (1, 'GiftCard1', 50.00);
INSERT INTO Gift_Card VALUES (2, 'GiftCard2', 50.00);
INSERT INTO Gift_Card VALUES (3, 'GiftCard3', 100.00);
INSERT INTO Gift_Card VALUES (4, 'GiftCard4', 75.00);
INSERT INTO Gift_Card VALUES (5, 'GiftCard5', 80.00);
INSERT INTO Gift_Card VALUES (6, 'GiftCard6', 200.00);
INSERT INTO Gift_Card VALUES (7, 'GiftCard7', 50.00);
INSERT INTO Gift_Card VALUES (8, 'GiftCard8', 200.00);
INSERT INTO Gift_Card VALUES (9, 'GiftCard9', 75.00);
INSERT INTO Gift_Card VALUES (10, 'GiftCard10', 40.00);

-- Insert data into Customer
INSERT INTO Customer VALUES (1, 1, 'Smith', 'John', 'john.smith@example.com', '77001', 'TX', '1231 Main St', 'Houston', '2022-05-27');
INSERT INTO Customer VALUES (2, NULL, 'Johnson', 'Emily', 'emily.johnson@example.com', '77002', 'TX', '1232 Main St', 'Houston', '2023-02-23');
INSERT INTO Customer VALUES (3, 2, 'Brown', 'David', 'david.brown@example.com', '77003', 'TX', '1233 Main St', 'Houston', '2020-02-05');
INSERT INTO Customer VALUES (4, NULL, 'Williams', 'Sophia', 'sophia.williams@example.com', '77004', 'TX', '1234 Main St', 'Houston', '2020-02-08');
INSERT INTO Customer VALUES (5, 3, 'Jones', 'Michael', 'michael.jones@example.com', '77005', 'TX', '1235 Main St', 'Houston', '2023-10-04');
INSERT INTO Customer VALUES (6, NULL, 'Garcia', 'Olivia', 'olivia.garcia@example.com', '77006', 'TX', '1236 Main St', 'Houston', '2022-06-19');
INSERT INTO Customer VALUES (7, NULL, 'Miller', 'Daniel', 'daniel.miller@example.com', '77007', 'TX', '1237 Main St', 'Houston', '2021-10-13');
INSERT INTO Customer VALUES (8, NULL, 'Davis', 'Emma', 'emma.davis@example.com', '77008', 'TX', '1238 Main St', 'Houston', '2020-03-06');
INSERT INTO Customer VALUES (9, 4, 'Martinez', 'James', 'james.martinez@example.com', '77009', 'TX', '1239 Main St', 'Houston', '2021-06-25');
INSERT INTO Customer VALUES (10, 5, 'Lopez', 'Ava', 'ava.lopez@example.com', '770010', 'TX', '12310 Main St', 'Houston', '2023-06-06');

-- Insert data into Loyalty_Program
INSERT INTO Loyalty_Program VALUES (1, 1, 'Gold', 508);
INSERT INTO Loyalty_Program VALUES (2, 3, 'Silver', 470);
INSERT INTO Loyalty_Program VALUES (3, 5, 'Platinum', 324);
INSERT INTO Loyalty_Program VALUES (4, 9, 'Bronze', 241);
INSERT INTO Loyalty_Program VALUES (5, 10, 'Elite', 621);

-- Insert data into Gift_Card_Log
INSERT INTO Gift_Card_Log VALUES (1, 1, 1, '2021-02-14', '2024-07-04', 25.0);
INSERT INTO Gift_Card_Log VALUES (2, 2, 2, '2022-04-16', '2024-10-22', 25.0);
INSERT INTO Gift_Card_Log VALUES (3, 3, 3, '2022-07-04', '2024-04-08', 50.0);
INSERT INTO Gift_Card_Log VALUES (4, 4, 4, '2021-05-08', '2024-12-26', 37.5);
INSERT INTO Gift_Card_Log VALUES (5, 5, 5, '2022-01-23', '2024-02-05', 40.0);
INSERT INTO Gift_Card_Log VALUES (6, 6, 6, '2021-03-22', '2024-01-24', 100.0);
INSERT INTO Gift_Card_Log VALUES (7, 7, 7, '2022-07-20', '2024-12-04', 25.0);
INSERT INTO Gift_Card_Log VALUES (8, 8, 8, '2021-10-28', '2024-04-26', 100.0);
INSERT INTO Gift_Card_Log VALUES (9, 9, 9, '2022-10-06', '2024-05-28', 37.5);
INSERT INTO Gift_Card_Log VALUES (10, 10, 10, '2022-09-26', '2024-02-10', 20.0);

-- Insert data into Supplier
INSERT INTO Supplier VALUES (1, 'FreshFarm', '78001', 'TX', '7891 Supplier St', 'Houston', 'contact@freshfarm.com', 422);
INSERT INTO Supplier VALUES (2, 'BakersSupply', '78002', 'TX', '7892 Supplier St', 'Houston', 'contact@bakerssupply.com', 171);
INSERT INTO Supplier VALUES (3, 'DailyGoods', '78003', 'TX', '7893 Supplier St', 'Houston', 'contact@dailygoods.com', 215);
INSERT INTO Supplier VALUES (4, 'FoodMart', '78004', 'TX', '7894 Supplier St', 'Houston', 'contact@foodmart.com', 147);
INSERT INTO Supplier VALUES (5, 'BakePlus', '78005', 'TX', '7895 Supplier St', 'Houston', 'contact@bakeplus.com', 43);
INSERT INTO Supplier VALUES (6, 'ChefSource', '78006', 'TX', '7896 Supplier St', 'Houston', 'contact@chefsource.com', 177);
INSERT INTO Supplier VALUES (7, 'GourmetPro', '78007', 'TX', '7897 Supplier St', 'Houston', 'contact@gourmetpro.com', 99);
INSERT INTO Supplier VALUES (8, 'TastyLine', '78008', 'TX', '7898 Supplier St', 'Houston', 'contact@tastyline.com', 351);
INSERT INTO Supplier VALUES (9, 'NutriSupply', '78009', 'TX', '7899 Supplier St', 'Houston', 'contact@nutrisupply.com', 246);
INSERT INTO Supplier VALUES (10, 'MegaFoods', '78001', 'TX', '78910 Supplier St', 'Houston', 'contact@megafoods.com', 240);

-- Insert data into Role
INSERT INTO Role VALUES (1, 'Bakery Manager', 'Manages bakery operations and staff');
INSERT INTO Role VALUES (2, 'Assistant Baker', 'Assists head baker with dough and baking tasks');
INSERT INTO Role VALUES (3, 'Pastry Chef', 'Prepares pastries and specialty desserts');
INSERT INTO Role VALUES (4, 'Front Counter Staff', 'Takes orders and handles customer service at the front');
INSERT INTO Role VALUES (5, 'Dishwasher', 'Washes dishes and keeps the kitchen clean');
INSERT INTO Role VALUES (6, 'Packaging Clerk', 'Packages baked goods for display and delivery');
INSERT INTO Role VALUES (7, 'Order Coordinator', 'Coordinates online and in-store orders');
INSERT INTO Role VALUES (8, 'Barista', 'Prepares coffee and beverages for customers');
INSERT INTO Role VALUES (9, 'Delivery Driver', 'Delivers orders to customers and events');
INSERT INTO Role VALUES (10, 'Bakery Cleaner', 'Maintains cleanliness of the bakery and equipment');

-- Insert data into Employee
INSERT INTO Employee VALUES (1, 1, 'Gideon', 'Dimaano', 'gideon.dimaano@company.com', '123-456-7801', '2019-05-27');
INSERT INTO Employee VALUES (2, 2, 'Julian-Angelo', 'Garcia', 'julianangelo.bantoggarcia@company.com', '123-456-7802', '2022-06-01');
INSERT INTO Employee VALUES (3, 3, 'Eric', 'Salgado', 'eric.salgado@company.com', '123-456-7803', '2022-07-24');
INSERT INTO Employee VALUES (4, 4, 'Syed', 'Shakil', 'syed.shakil@company.com', '123-456-7804', '2019-12-17');
INSERT INTO Employee VALUES (5, 5, 'Cole', 'Stillwell', 'cole.stillwell@company.com', '123-456-7805', '2021-12-29');
INSERT INTO Employee VALUES (6, 6, 'Jose', 'Tijerina', 'jose.tijerina@company.com', '123-456-7806', '2023-02-02');
INSERT INTO Employee VALUES (7, 7, 'Kevin', 'Zavala', 'kevin.zavala@company.com', '123-456-7807', '2020-05-16');
INSERT INTO Employee VALUES (8, 8, 'Alex', 'Bennett', 'alex.bennett@company.com', '123-456-7808', '2019-12-01');
INSERT INTO Employee VALUES (9, 9, 'Riley', 'Morris', 'riley.morris@company.com', '123-456-7809', '2021-08-04');
INSERT INTO Employee VALUES (10, 10, 'Taylor', 'Sanders', 'taylor.sanders@company.com', '123-456-7810', '2021-02-16');

-- Insert data into Store_Location
INSERT INTO Store_Location VALUES (1, 'Mamas Little Bakery', '77001', 'TX', '1001 Sugar St', 'Houston', '713-555-1234');

-- Insert data into Waste_Log
INSERT INTO Waste_Log VALUES (1, 1, '2023-09-10');
INSERT INTO Waste_Log VALUES (2, 2, '2023-02-16');
INSERT INTO Waste_Log VALUES (3, 3, '2024-01-22');
INSERT INTO Waste_Log VALUES (4, 4, '2023-01-25');
INSERT INTO Waste_Log VALUES (5, 5, '2024-03-16');
INSERT INTO Waste_Log VALUES (6, 6, '2023-02-26');
INSERT INTO Waste_Log VALUES (7, 7, '2023-03-20');
INSERT INTO Waste_Log VALUES (8, 8, '2023-11-18');
INSERT INTO Waste_Log VALUES (9, 9, '2023-03-23');
INSERT INTO Waste_Log VALUES (10, 10, '2024-02-10');

-- Insert data into Ingredient
INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (1, 'Mixed Produce', 120, 201);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (2, 'All-Purpose Flour', 80, 202);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (3, 'Whole Milk', 90, 203);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (4, 'Wheat Berries', 100, 204);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (5, 'Frozen Berries', 60, 205);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (6, 'Ketchup', 40, 206);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (7, 'Brewed Coffee', 150, 207);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (8, 'Active Dry Yeast', 1, 208);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (9, 'Salted Butter', 30, 209);

INSERT INTO Ingredient (Ingredient_ID, Ingredient_Name, Quantity_in_Stock, Inventory_ID)
VALUES (10, 'Mixed Spices', 55, 210);

-- Insert data into Inventory
INSERT INTO Inventory VALUES (1, 1, 1, 'All-Purpose Flour', '2023-01-08', 54);
INSERT INTO Inventory VALUES (2, 2, 2, 'Unsalted Butter', '2023-04-06', 70);
INSERT INTO Inventory VALUES (3, 3, 3, 'Dutch Cocoa Powder', '2023-09-12', 32);
INSERT INTO Inventory VALUES (4, 4, 4, 'Rolled Oats', '2023-10-18', 68);
INSERT INTO Inventory VALUES (5, 5, 5, 'Apple Filling', '2023-06-07', 31);
INSERT INTO Inventory VALUES (6, 6, 6, 'Instant Yeast', '2023-02-09', 89);
INSERT INTO Inventory VALUES (7, 7, 7, 'Cream Cheese', '2023-01-09', 38);
INSERT INTO Inventory VALUES (8, 8, 8, 'Vanilla Extract', '2023-08-26', 58);
INSERT INTO Inventory VALUES (9, 9, 9, 'Peanut Butter', '2023-09-26', 91);
INSERT INTO Inventory VALUES (10, 10, 10, 'Cherry Filling', '2023-04-04', 94);

-- Insert data into Equipment
INSERT INTO Equipment VALUES (1, 'Stand Mixer', '2023-04-11', 201, '2024-03-01');
INSERT INTO Equipment VALUES (2, 'Oven', '2022-09-03', 202, '2024-01-15');
INSERT INTO Equipment VALUES (3, 'Rolling Pin', '2022-10-26', 203, '2024-02-10');
INSERT INTO Equipment VALUES (4, 'Mixing Bowl', '2022-12-23', 204, '2024-03-05');
INSERT INTO Equipment VALUES (5, 'Measuring Cups', '2020-11-18', 205, '2024-02-20');
INSERT INTO Equipment VALUES (6, 'Baking Sheet', '2022-11-02', 206, '2024-01-28');
INSERT INTO Equipment VALUES (7, 'Cooling Rack', '2020-10-15', 207, '2023-02-06');
INSERT INTO Equipment VALUES (8, 'Whisk', '2022-11-25', 208, '2023-02-07');
INSERT INTO Equipment VALUES (9, 'Spatula', '2022-05-27', 209, '2023-04-03');
INSERT INTO Equipment VALUES (10, 'Piping Bag', '2020-06-17', 210, '2023-11-02');

-- Insert data into Recipe
INSERT INTO Recipe VALUES (1, 20, 10);
INSERT INTO Recipe VALUES (2, 45, 20);
INSERT INTO Recipe VALUES (3, 15, 5);
INSERT INTO Recipe VALUES (4, 30, 15);
INSERT INTO Recipe VALUES (5, 60, 30);
INSERT INTO Recipe VALUES (6, 25, 12);
INSERT INTO Recipe VALUES (7, 10, 8);
INSERT INTO Recipe VALUES (8, 50, 25);
INSERT INTO Recipe VALUES (9, 35, 18);
INSERT INTO Recipe VALUES (10, 40, 20);

-- Insert data into Equipment_List
INSERT INTO Equipment_List VALUES (1, 1, 1);
INSERT INTO Equipment_List VALUES (2, 2, 2);
INSERT INTO Equipment_List VALUES (3, 3, 3);
INSERT INTO Equipment_List VALUES (4, 4, 4);
INSERT INTO Equipment_List VALUES (5, 5, 5);
INSERT INTO Equipment_List VALUES (6, 6, 6);
INSERT INTO Equipment_List VALUES (7, 7, 7);
INSERT INTO Equipment_List VALUES (8, 8, 8);
INSERT INTO Equipment_List VALUES (9, 9, 9);
INSERT INTO Equipment_List VALUES (10, 10, 10);

-- Insert data into Ingredient_List
INSERT INTO Ingredient_List VALUES (1, 1, 1, 5);
INSERT INTO Ingredient_List VALUES (2, 2, 2, 1);
INSERT INTO Ingredient_List VALUES (3, 3, 3, 2);
INSERT INTO Ingredient_List VALUES (4, 4, 4, 4);
INSERT INTO Ingredient_List VALUES (5, 5, 5, 1);
INSERT INTO Ingredient_List VALUES (6, 6, 6, 5);
INSERT INTO Ingredient_List VALUES (7, 7, 7, 2);
INSERT INTO Ingredient_List VALUES (8, 8, 8, 5);
INSERT INTO Ingredient_List VALUES (9, 9, 9, 5);
INSERT INTO Ingredient_List VALUES (10, 10, 10, 1);

-- Insert data into Store_Location
INSERT INTO Store_Location VALUES (1, 'Mamas Little Bakery', '77001', 'TX', '1001 Sugar St', 'Houston', '713-555-1234');

-- Insert data into Invoice (second definition)
INSERT INTO Invoice VALUES (1, 1, 1, 0.00, '2023-05-01');
INSERT INTO Invoice VALUES (2, 2, 1, 0.00, '2023-06-15');
INSERT INTO Invoice VALUES (3, 3, 1, 0.00, '2023-07-20');
INSERT INTO Invoice VALUES (4, 4, 1, 0.00, '2023-08-10');
INSERT INTO Invoice VALUES (5, 5, 1, 0.00, '2023-09-05');
INSERT INTO Invoice VALUES (6, 6, 1, 0.00, '2023-10-12');
INSERT INTO Invoice VALUES (7, 7, 1, 0.00, '2023-11-18');
INSERT INTO Invoice VALUES (8, 8, 1, 0.00, '2023-12-25');
INSERT INTO Invoice VALUES (9, 9, 1, 0.00, '2024-01-30');
INSERT INTO Invoice VALUES (10, 10, 1, 0.00, '2024-03-15');

-- Insert data into Product
INSERT INTO Product VALUES (1, 1, 1, 1, 7.04, 16, 'Bread');
INSERT INTO Product VALUES (2, 2, 2, 2, 6.80, 26, 'Pastry');
INSERT INTO Product VALUES (3, 3, 3, 3, 5.51, 45, 'Cake');
INSERT INTO Product VALUES (4, 4, 4, 4, 5.25, 36, 'Cookie');
INSERT INTO Product VALUES (5, 5, 5, 5, 11.31, 67, 'Pie');
INSERT INTO Product VALUES (6, 6, 6, 6, 6.99, 77, 'Bread');
INSERT INTO Product VALUES (7, 7, 7, 7, 10.75, 76, 'Pastry');
INSERT INTO Product VALUES (8, 8, 8, 8, 7.95, 42, 'Cake');
INSERT INTO Product VALUES (9, 9, 9, 9, 3.46, 66, 'Cookie');
INSERT INTO Product VALUES (10, 10, 10, 10, 11.99, 22, 'Pie');

-- Insert data into Payment
INSERT INTO Payment VALUES (1, 1, 1, 1, '2023-11-21', 'Credit Card', 87.41);
INSERT INTO Payment VALUES (2, 2, 2, 2, '2024-03-28', 'Debit Card', 74.48);
INSERT INTO Payment VALUES (3, 3, 3, 3, '2023-07-31', 'Cash', 65.37);
INSERT INTO Payment VALUES (4, 4, 4, 4, '2024-02-16', 'Online Payment', 31.24);
INSERT INTO Payment VALUES (5, 5, 5, 5, '2024-01-21', 'Credit Card', 78.89);
INSERT INTO Payment VALUES (6, 6, 6, 6, '2023-06-19', 'Cash', 41.24);
INSERT INTO Payment VALUES (7, 7, 7, 7, '2023-06-20', 'Credit Card', 32.12);
INSERT INTO Payment VALUES (8, 8, 8, 8, '2024-01-14', 'Online Payment', 24.05);
INSERT INTO Payment VALUES (9, 9, 9, 9, '2023-08-25', 'Debit Card', 52.66);
INSERT INTO Payment VALUES (10, 10, 10, 10, '2024-02-18', 'Credit Card', 66.09);

-- Insert data into Tax
INSERT INTO Tax VALUES (1, 6.66);
INSERT INTO Tax VALUES (2, 5.68);
INSERT INTO Tax VALUES (3, 4.98);
INSERT INTO Tax VALUES (4, 2.38);
INSERT INTO Tax VALUES (5, 6.01);
INSERT INTO Tax VALUES (6, 3.14);
INSERT INTO Tax VALUES (7, 2.45);
INSERT INTO Tax VALUES (8, 1.83);
INSERT INTO Tax VALUES (9, 4.01);
INSERT INTO Tax VALUES (10, 5.04);

-- Insert data into Order
INSERT INTO `Order` VALUES (1, 1, 1, 1, 1, 1, 1, '2024-01-12', 80.75, 'Completed', 'In-Store');
INSERT INTO `Order` VALUES (2, 2, 2, 2, 2, 2, 2, '2023-10-14', 68.80, 'Processing', 'Online');
INSERT INTO `Order` VALUES (3, 3, 3, 3, 3, 3, 3, '2023-07-14', 60.39, 'Shipped', 'In-Store');
INSERT INTO `Order` VALUES (4, 4, 4, 4, 4, 4, 4, '2024-03-10', 28.86, 'Completed', 'Online');
INSERT INTO `Order` VALUES (5, 5, 5, 5, 5, 5, 5, '2023-12-28', 72.88, 'Cancelled', 'Online');
INSERT INTO `Order` VALUES (6, 6, 6, 6, 6, 6, 6, '2023-10-30', 38.10, 'Processing', 'In-Store');
INSERT INTO `Order` VALUES (7, 7, 7, 7, 7, 7, 7, '2024-03-09', 29.67, 'Completed', 'Online');
INSERT INTO `Order` VALUES (8, 8, 8, 8, 8, 8, 8, '2023-10-05', 22.22, 'Shipped', 'In-Store');
INSERT INTO `Order` VALUES (9, 9, 9, 9, 9, 9, 9, '2023-10-17', 48.65, 'Pending', 'Online');
INSERT INTO `Order` VALUES (10, 10, 10, 10, 10, 10, 10, '2023-12-05', 61.05, 'Completed', 'In-Store');

-- Insert data into Package
INSERT INTO Package VALUES (1, 1, 'Birthday Box', 20.0);
INSERT INTO Package VALUES (2, 2, 'Wedding Tray', 49.24);
INSERT INTO Package VALUES (3, 3, 'Breakfast Box', 29.19);
INSERT INTO Package VALUES (4, 4, 'Dessert Sampler', 17.17);
INSERT INTO Package VALUES (5, 5, 'Mini Pastry Set', 42.45);
INSERT INTO Package VALUES (6, 6, 'Holiday Platter', 46.88);
INSERT INTO Package VALUES (7, 7, 'Cookie Tin', 25.58);
INSERT INTO Package VALUES (8, 8, 'Cupcake Crate', 33.19);
INSERT INTO Package VALUES (9, 9, 'Bread Basket', 34.59);
INSERT INTO Package VALUES (10, 10, 'Corporate Box', 40.10);

-- Insert data into Delivery
INSERT INTO Delivery VALUES (1, 1, '2024-03-04', 'Delivered', '77010', 'TX', '100 Bake Ave', 'Houston', 16.61, 1);
INSERT INTO Delivery VALUES (2, 2, '2024-02-26', 'In Transit', '77011', 'TX', '101 Bake Ave', 'Houston', 19.62, 2);
INSERT INTO Delivery VALUES (3, 3, '2024-03-08', 'Out for Delivery', '77012', 'TX', '102 Bake Ave', 'Houston', 12.86, 3);
INSERT INTO Delivery VALUES (4, 4, '2024-02-10', 'Delivered', '77013', 'TX', '103 Bake Ave', 'Houston', 14.36, 4);
INSERT INTO Delivery VALUES (5, 5, '2024-01-24', 'Cancelled', '77014', 'TX', '104 Bake Ave', 'Houston', 7.41, 5);
INSERT INTO Delivery VALUES (6, 6, '2024-02-03', 'Delivered', '77015', 'TX', '105 Bake Ave', 'Houston', 14.21, 6);
INSERT INTO Delivery VALUES (7, 7, '2024-01-06', 'Pending', '77016', 'TX', '106 Bake Ave', 'Houston', 11.40, 7);
INSERT INTO Delivery VALUES (8, 8, '2024-02-18', 'Delivered', '77017', 'TX', '107 Bake Ave', 'Houston', 15.24, 8);
INSERT INTO Delivery VALUES (9, 9, '2024-03-04', 'Rescheduled', '77018', 'TX', '108 Bake Ave', 'Houston', 11.73, 9);
INSERT INTO Delivery VALUES (10, 10, '2024-04-04', 'Delivered', '77019', 'TX', '109 Bake Ave', 'Houston', 9.25, 10);

-- Insert data into Nutritional_Info
INSERT INTO Nutritional_Info VALUES (1, 238, 20.96, 32.34, 3.10, '2023-01-19');
INSERT INTO Nutritional_Info VALUES (2, 114, 21.40, 41.45, 14.78, '2023-12-27');
INSERT INTO Nutritional_Info VALUES (3, 312, 21.78, 21.50, 7.61, '2023-03-29');
INSERT INTO Nutritional_Info VALUES (4, 267, 16.59, 16.08, 11.35, '2023-10-25');
INSERT INTO Nutritional_Info VALUES (5, 391, 13.15, 41.91, 8.01, '2023-09-13');
INSERT INTO Nutritional_Info VALUES (6, 190, 10.39, 26.15, 3.65, '2023-10-08');
INSERT INTO Nutritional_Info VALUES (7, 116, 11.29, 39.79, 4.14, '2023-01-01');
INSERT INTO Nutritional_Info VALUES (8, 216, 22.12, 10.04, 7.88, '2023-05-27');
INSERT INTO Nutritional_Info VALUES (9, 322, 23.41, 23.30, 10.14, '2024-02-25');
INSERT INTO Nutritional_Info VALUES (10, 119, 24.39, 26.14, 4.53, '2023-03-21');

-- Insert data into Catering
INSERT INTO Catering VALUES (1, 1, 'Corporate breakfast platter');
INSERT INTO Catering VALUES (2, 2, 'Wedding dessert table');
INSERT INTO Catering VALUES (3, 3, 'Birthday party cupcakes');
INSERT INTO Catering VALUES (4, 4, 'Bridal shower treats');
INSERT INTO Catering VALUES (5, 5, 'Office holiday pastries');
INSERT INTO Catering VALUES (6, 6, 'Retirement luncheon');
INSERT INTO Catering VALUES (7, 7, 'Baby shower sweets');
INSERT INTO Catering VALUES (8, 8, 'Engagement cake buffet');
INSERT INTO Catering VALUES (9, 9, 'Non-profit event snacks');
INSERT INTO Catering VALUES (10, 10, 'Team building cookie bar');

-- Insert data into Catering_Event
INSERT INTO Catering_Event VALUES (1, 'Houston Tech Summit', '2025-04-15', 1);
INSERT INTO Catering_Event VALUES (2, 'Smith-Jones Wedding', '2025-04-22', 2);
INSERT INTO Catering_Event VALUES (3, 'Ella''s 10th Birthday', '2025-04-29', 3);
INSERT INTO Catering_Event VALUES (4, 'Sophia''s Bridal Bash', '2025-05-06', 4);
INSERT INTO Catering_Event VALUES (5, 'Holiday Staff Party', '2025-05-13', 5);
INSERT INTO Catering_Event VALUES (6, 'John''s Retirement', '2025-05-20', 6);
INSERT INTO Catering_Event VALUES (7, 'Emily''s Baby Shower', '2025-05-27', 7);
INSERT INTO Catering_Event VALUES (8, 'Taylor-Pat Engagement', '2025-06-03', 8);
INSERT INTO Catering_Event VALUES (9, 'Community Outreach Fair', '2025-06-10', 9);
INSERT INTO Catering_Event VALUES (10, 'Company Retreat', '2025-06-17', 10);

-- Insert data into Discount
INSERT INTO Discount VALUES (1, 5.0, 'Referral');
INSERT INTO Discount VALUES (2, 10.0, 'Summer Discount');
INSERT INTO Discount VALUES (3, 10.0, 'Spring Discount');
INSERT INTO Discount VALUES (4, 10.0, 'First Time');
INSERT INTO Discount VALUES (5, 10.0, 'Holiday');
INSERT INTO Discount VALUES (6, 10.0, 'Winter Discount');
INSERT INTO Discount VALUES (7, 10.0, 'Birthday');
INSERT INTO Discount VALUES (8, 10.0, 'Fall Discount');
INSERT INTO Discount VALUES (9, 10.0, 'Back to School');
INSERT INTO Discount VALUES (10, 10.0, 'Weekend Special');

-- Insert data into Payment
INSERT INTO Payment VALUES (1, 1, 1, 1, '2023-11-21', 'Credit Card', 87.41);
INSERT INTO Payment VALUES (2, 2, 2, 2, '2024-03-28', 'Debit Card', 74.48);
INSERT INTO Payment VALUES (3, 3, 3, 3, '2023-07-31', 'Cash', 65.37);
INSERT INTO Payment VALUES (4, 4, 4, 4, '2024-02-16', 'Online Payment', 31.24);
INSERT INTO Payment VALUES (5, 5, 5, 5, '2024-01-21', 'Credit Card', 78.89);
INSERT INTO Payment VALUES (6, 6, 6, 6, '2023-06-19', 'Cash', 41.24);
INSERT INTO Payment VALUES (7, 7, 7, 7, '2023-06-20', 'Credit Card', 32.12);
INSERT INTO Payment VALUES (8, 8, 8, 8, '2024-01-14', 'Online Payment', 24.05);
INSERT INTO Payment VALUES (9, 9, 9, 9, '2023-08-25', 'Debit Card', 52.66);
INSERT INTO Payment VALUES (10, 10, 10, 10, '2024-02-18', 'Credit Card', 66.09);

-- Insert data into Tax
INSERT INTO Tax VALUES (1, 6.66);
INSERT INTO Tax VALUES (2, 5.68);
INSERT INTO Tax VALUES (3, 4.98);
INSERT INTO Tax VALUES (4, 2.38);
INSERT INTO Tax VALUES (5, 6.01);
INSERT INTO Tax VALUES (6, 3.14);
INSERT INTO Tax VALUES (7, 2.45);
INSERT INTO Tax VALUES (8, 1.83);
INSERT INTO Tax VALUES (9, 4.01);
INSERT INTO Tax VALUES (10, 5.04);

-- Insert data into Order
INSERT INTO `Order` VALUES (1, 1, 1, 1, 1, 1, 1, '2024-01-12', 80.75, 'Completed', 'In-Store');
INSERT INTO `Order` VALUES (2, 2, 2, 2, 2, 2, 2, '2023-10-14', 68.80, 'Processing', 'Online');
INSERT INTO `Order` VALUES (3, 3, 3, 3, 3, 3, 3, '2023-07-14', 60.39, 'Shipped', 'In-Store');
INSERT INTO `Order` VALUES (4, 4, 4, 4, 4, 4, 4, '2024-03-10', 28.86, 'Completed', 'Online');
INSERT INTO `Order` VALUES (5, 5, 5, 5, 5, 5, 5, '2023-12-28', 72.88, 'Cancelled', 'Online');
INSERT INTO `Order` VALUES (6, 6, 6, 6, 6, 6, 6, '2023-10-30', 38.10, 'Processing', 'In-Store');
INSERT INTO `Order` VALUES (7, 7, 7, 7, 7, 7, 7, '2024-03-09', 29.67, 'Completed', 'Online');
INSERT INTO `Order` VALUES (8, 8, 8, 8, 8, 8, 8, '2023-10-05', 22.22, 'Shipped', 'In-Store');
INSERT INTO `Order` VALUES (9, 9, 9, 9, 9, 9, 9, '2023-10-17', 48.65, 'Pending', 'Online');
INSERT INTO `Order` VALUES (10, 10, 10, 10, 10, 10, 10, '2023-12-05', 61.05, 'Completed', 'In-Store');

-- ===================== SELECT/UTILITY STATEMENTS =====================
SELECT * FROM Supplier;
SELECT * FROM Recipe;
SELECT * FROM Equipment;
SELECT * FROM Ingredient;
SELECT * FROM Inventory;
SELECT * FROM Waste_Log;
SELECT * FROM Invoice;
SELECT * FROM Equipment_List;
SELECT * FROM Ingredient_List;
SELECT * FROM Store_Location;
SELECT * FROM Gift_Card;
SELECT * FROM Customer;
SELECT * FROM Loyalty_Program;
SELECT * FROM Gift_Card_Log;
SELECT * FROM Role;
SELECT * FROM Employee;
SELECT * FROM Package;
SELECT * FROM Delivery;
SELECT * FROM Product;
SELECT * FROM Payment;
SELECT * FROM Tax;
SELECT * FROM `Order`;
SELECT * FROM Nutritional_Info;
SELECT * FROM Catering;
SELECT * FROM Catering_Event;



-- 3. Functional Queries (12 Requirements)

-- 1. Customer Loyalty Analysis
SELECT 
    c.Customer_Fname,
    c.Customer_Lname,
    COUNT(o.Order_ID) AS Total_Purchases
FROM Customer c
JOIN `Order` o ON c.Customer_ID = o.Customer_ID
WHERE c.Loyalty_Program_ID IS NULL
GROUP BY c.Customer_ID
HAVING Total_Purchases > 5;

-- 2. Inventory Shortage Alert
SELECT 
    i.Ingredient_Name,
    i.Quantity_In_Stock,
    s.Supplier_Stock
FROM Ingredient i
JOIN Inventory inv ON i.Inventory_ID = inv.Inventory_ID
JOIN Supplier s ON inv.Supplier_ID = s.Supplier_ID
WHERE i.Quantity_In_Stock < s.Supplier_Stock;

-- 3. Employee Performance
SELECT 
    e.Employee_Fname,
    e.Employee_Lname,
    COUNT(o.Order_ID) AS Orders_Handled
FROM Employee e
JOIN Package p ON e.Employee_ID = p.Employee_ID
JOIN `Order` o ON p.Package_ID = o.Package_ID
GROUP BY e.Employee_ID;

-- 4. Supplier Expenses
SELECT 
    s.Supplier_Name,
    SUM(i.Store_Amount) AS Total_Spent
FROM Supplier s
JOIN Invoice i ON s.Supplier_ID = i.Supplier_ID
GROUP BY s.Supplier_ID;

-- 5. Product Review Insights
SELECT 
    p.Product_ID,
    AVG(r.Rating_ID) AS Avg_Rating
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID;

-- 6. Promotion Effectiveness
SELECT 
    d.Discount_Type,
    COUNT(o.Order_ID) AS Times_Used
FROM Discount d
JOIN `Order` o ON d.Discount_ID = o.Discount_ID
GROUP BY d.Discount_ID;

-- 7. Catering Revenue
SELECT 
    ce.Event_Name,
    SUM(o.Total_Amount) AS Total_Revenue
FROM Catering_Event ce
JOIN Catering c ON ce.Catering_ID = c.Catering_ID
JOIN `Order` o ON c.Order_ID = o.Order_ID
GROUP BY ce.Event_Name;

-- 8. Nutritional Info Compliance
SELECT 
    p.Product_ID
FROM Product p
LEFT JOIN Nutritional_Info ni ON p.Nutrional_Info_ID = ni.Nutritional_Info_ID
LEFT JOIN Allergy_Log al ON p.Product_ID = al.Product_ID
WHERE ni.Last_Update_Date IS NULL OR al.Last_Updated IS NULL;

-- 9. Supplier Delivery Count
SELECT 
    s.Supplier_Name,
    COUNT(d.Delivery_ID) AS Deliveries_Made
FROM Supplier s
JOIN Inventory inv ON s.Supplier_ID = inv.Supplier_ID
JOIN Delivery d ON inv.Store_Loc_ID = d.Store_Location
GROUP BY s.Supplier_ID;

-- 10. Employee Training Status
SELECT 
    e.Employee_Fname,
    e.Employee_Lname
FROM Employee e
LEFT JOIN Training t ON e.Employee_ID = t.Employee_ID
WHERE t.Completion_Date IS NULL;

-- 11. Sales by Product Category
SELECT 
    p.Category,
    SUM(o.Total_Amount) AS Revenue
FROM Product p
JOIN `Order` o ON p.Product_ID = o.Product_ID
GROUP BY p.Category;

-- 12. Waste Management Metrics
SELECT 
    i.Ingredient_Name,
    COUNT(w.WasteLog_ID) AS Waste_Count
FROM Ingredient i
JOIN Inventory inv ON i.Inventory_ID = inv.Inventory_ID
JOIN Waste_Log w ON inv.Inventory_ID = w.Inventory_ID
GROUP BY i.Ingredient_ID, i.Ingredient_Name;

