-- 1. Show customers with no loyalty program who bought more than 5 times
SELECT 
    c.Customer_Fname,
    c.Customer_Lname,
    COUNT(o.Order_ID) AS Total_Purchases
FROM Customer c
JOIN `Order` o ON c.Customer_ID = o.Customer_ID
WHERE c.Loyalty_Program_ID IS NULL
GROUP BY c.Customer_ID
HAVING Total_Purchases > 5;

-- 2. Show ingredients that have less stock than their supplier’s stock
SELECT 
    i.Ingredient_Name,
    i.Quantity_In_Stock,
    s.Supplier_Stock
FROM Ingredient i
JOIN Inventory inv ON i.Inventory_ID = inv.Inventory_ID
JOIN Supplier s ON inv.Supplier_ID = s.Supplier_ID
WHERE i.Quantity_In_Stock < s.Supplier_Stock;

-- 3. Show each employee and how many orders they handled
SELECT 
    e.Employee_Fname,
    e.Employee_Lname,
    COUNT(o.Order_ID) AS Orders_Handled
FROM Employee e
JOIN Package p ON e.Employee_ID = p.Employee_ID
JOIN `Order` o ON p.Package_ID = o.Package_ID
GROUP BY e.Employee_ID;

-- 4. Show total spent per supplier
SELECT 
    s.Supplier_Name,
    SUM(i.Store_Amount) AS Total_Spent
FROM Supplier s
JOIN Invoice i ON s.Supplier_ID = i.Supplier_ID
GROUP BY s.Supplier_ID;

-- 5. Show average rating for each product
SELECT 
    p.Product_ID,
    AVG(r.Rating_ID) AS Avg_Rating
FROM Product p
JOIN Review r ON p.Product_ID = r.Product_ID
GROUP BY p.Product_ID;

-- 6. Show how many times each discount was used
SELECT 
    d.Discount_Type,
    COUNT(o.Order_ID) AS Times_Used
FROM Discount d
JOIN `Order` o ON d.Discount_ID = o.Discount_ID
GROUP BY d.Discount_ID;

-- 7. Show total revenue for each catering event
SELECT 
    ce.Event_Name,
    SUM(o.Total_Amount) AS Total_Revenue
FROM Catering_Event ce
JOIN Catering c ON ce.Catering_ID = c.Catering_ID
JOIN `Order` o ON c.Order_ID = o.Order_ID
GROUP BY ce.Event_Name;

-- 8. Show products missing nutrition or allergy info
SELECT 
    p.Product_ID
FROM Product p
LEFT JOIN Nutritional_Info ni ON p.Nutrional_Info_ID = ni.Nutritional_Info_ID
LEFT JOIN Allergy_Log al ON p.Product_ID = al.Product_ID
WHERE ni.Last_Update_Date IS NULL
   OR al.Last_Updated IS NULL;

-- 9. Show how many deliveries each supplier made
SELECT 
    s.Supplier_Name,
    COUNT(d.Delivery_ID) AS Deliveries_Made
FROM Supplier s
JOIN Inventory inv ON s.Supplier_ID = inv.Supplier_ID
JOIN Delivery d ON inv.Store_Loc_ID = d.Store_Location
GROUP BY s.Supplier_ID;

-- 10. Show employees who have not completed training
SELECT 
    e.Employee_Fname,
    e.Employee_Lname
FROM Employee e
LEFT JOIN Training t ON e.Employee_ID = t.Employee_ID
WHERE t.Completion_Date IS NULL;

-- 11. Show revenue by product category
SELECT 
    p.Category,
    SUM(o.Total_Amount) AS Revenue
FROM Product p
JOIN `Order` o ON p.Product_ID = o.Product_ID
GROUP BY p.Category;

-- 12. Show how many times each ingredient was logged as waste
SELECT 
    i.Ingredient_Name,
    COUNT(w.WasteLog_ID) AS Waste_Count
FROM Ingredient i
JOIN Inventory inv ON i.Inventory_ID = inv.Inventory_ID
JOIN Waste_Log w ON inv.Inventory_ID = w.Inventory_ID
GROUP BY i.Ingredient_ID, i.Ingredient_Name;
