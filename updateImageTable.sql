/*==============================Image================================*/
  --hehehehe
  DECLARE @count INT = 61
  DECLARE @i INT = 1
  DECLARE @id INT = 301

WHILE(@count <= 80)
BEGIN
SET @i=1;
WHILE(@i<=5)

BEGIN

UPDATE dbo.image 
  SET image_name ='Measurements/'+CAST(@count AS NVARCHAR(200))+'_'+CAST(@i AS NVARCHAR(200))+'.jpg' WHERE id=@id
UPDATE dbo.image
	SET product_id=@count
  WHERE id=@id
  SET @i = @i + 1;
  SET @id = @id + 1;
END
SET @count = @count + 1;
END




/*insert image*/
GO


  DECLARE @id INT = 151
  DECLARE @i INT = 1

WHILE(@id <= 190)
BEGIN
SET @i=1;
WHILE(@i<=5)

BEGIN

INSERT INTO dbo.image
        ( product_id, image_name, status )
VALUES  (@id,'Home&Garden/'+CAST((@id+50) AS NVARCHAR(200))+'_'+CAST(@i AS NVARCHAR(200))+'.jpg',1)

SET @i =@i+1;
END
SET @id = @id + 1;
END

/*=================================end===============================================*/




/*=====================================Product===================================*/

/*update code of product*/

DECLARE @i INT = 151

WHILE(@i <= 190)

BEGIN

UPDATE dbo.product 
  SET code ='HW-'+CAST(@i AS NVARCHAR(200)) WHERE id=@i;
	SET @i =@i+1;
END



/*update status*/

DECLARE @i INT = 151

DECLARE @a int;
WHILE(@i <= 190)

BEGIN
SET @a = (SELECT 1+(CAST(CEILING(RAND()*10) AS INT)%3) result);

UPDATE dbo.product 
  SET status =@a WHERE id=@i;
	SET @i =@i+1;
END




/*update image of product*/

DECLARE @i INT = 151

WHILE(@i <= 190)

BEGIN

  UPDATE dbo.product 
  SET image ='Home&Garden/'+CAST((@i+50) AS NVARCHAR(200))+'_'+CAST(0 AS NVARCHAR(200))+'.jpg' WHERE id=@i;
	SET @i =@i+1;
END


/*update money of product*/

DECLARE @i INT = 151

WHILE(@i <= 190)

BEGIN
DECLARE @a float;
SET @a = (SELECT ROUND((RAND()*10+RAND()*10+RAND()*10+RAND()*10),2) result);
PRINT @a

UPDATE dbo.product 
  SET price =ROUND(@a,2) WHERE id=@i;
	SET @i =@i+1;
END


/*Random Sale*/

DECLARE @id INT = 1


DECLARE @sale FLOAT
WHILE(@id<=190)
BEGIN

DECLARE @status int = (SELECT status FROM dbo.product WHERE id =@id)
IF(@status =2)
BEGIN
UPDATE [dbo].[product]
   SET [sale] = (SELECT ROUND((0.001+RAND()/5),2))
 WHERE id=@id
END
SET @id = @id +1
END


/*Inssert Product*/
INSERT INTO [dbo].[product]
           ([category_id]
           ,[code]
           ,[name]
           ,[quantity]
           ,[price]
           ,[description]
           ,[status]
           ,[sub_category_id])
     VALUES
           (5,'HW-101',N'Electric Knife',10,20,N'Electric Knife Sharpener Professional Motorized Knife Sharpener Rotating Sharpening Stone Kitchen High-Speed Sharpening Tool',1,14),
(5,'HW-101',N'Calories Microwave',10,20,N'DIY Low Calories Microwave Oven Fat Free Potato Chips Maker Kitchen Bakeware Tools Baking Dishes & Pans Chips Rack',1,14),
(5,'HW-101',N'Kitchen Accessories',10,20,N'Kitchen Accessories Cooking Gadgets Silicone Anti Overflow Lid Holder Soup Funny Man Phone Holder Stand Universial Kitchen Tool',1,14),
(5,'HW-101',N'Ex-large Silicone',10,20,N'Ex-large Silicone Baking Mat for Oven Scale Rolling Dough Mat Baking Rolling Fondant Pastry Mat Non-stick Bakeware Cooking Tool',1,14),
(5,'HW-101',N'3D Skull',10,20,N'3D Skull Ice Silicone Mold Maker Ice Cube Tray Pudding Mold Cake Candy Mould Bar Party Cool Wine Ice Cream Kitchen DIY Accessory',1,14),
(5,'HW-101',N'Sponge Magic',10,20,N'3/20/50/100pcs High Density Melamine Sponge Magic Sponge Eraser Cleaner Nano Sponge for Kitchen Office Bathroom Cleaning',1,14),
(5,'HW-101',N'Kitchen Tools',10,20,N'Kitchen Tools Dumpling Maker Tool Device Easy DIY Hand Pinch Dumpling Mold Dumplings Folder Dessert Mold Maker Tools White',1,14),
(5,'HW-101',N' Cover Liner',10,20,N'Gas Stove Protector Cover Liner Reusable Non Stick Dishwasher Protective Pad Gas Burner Stovetop Protector Kitchen Supplies',1,14),
(5,'HW-101',N'Cake Molds',10,20,N'New 1PCS Chess Shape Silicone Cake Molds Fondant Cake Jelly Candy Chocolate Mold DIY Bakware Decorate 20.5*8.5cm',1,14),
(5,'HW-101',N'Beer Bottle Opener',10,20,N'FIsh Shape Beer Bottle Opener Fishbone Aluminum Alloy Bottle Opener Keychain Ring kitchen Tool Trinket Gifts Color Random',1,14),
(5,'HW-101',N'Water Shovel',10,20,N'Water Shovel Kitchen Accessories Nylon Strainer Scoop Colander Drain Water Leaking Shovel Stainer Gadgets Cooking Tools Droship',1,14),
(5,'HW-101',N'Stainless Steel',10,20,N'Stainless Steel Wine Olive Oil Pourer Dispenser Spout Glass Bottle Wine Bottle Pour Spout Stopper Barware For Bar Dropshipping',1,14),
(5,'HW-101',N'Potato Cutter',10,20,N'ABS+Stainless Steel Potato Cutter Vegetable Slicer Chopper Chips Making Device for Fries Kitchen Cooking Tools',1,14),
(5,'HW-101',N'Straws Reusable',10,20,N'4/6/8pcs Reusable Metal Straws Reusable Drinking Stainless Steel Straws with Cleaner Brush Kits for Mugs Party Bar Accessories',1,14),
(5,'HW-101',N'Carved Pens',10,20,N'4PCS/Set Useful Bakeware Carved Pens Gadgets Simple DIY Flower Modelling Tool Fondant Biscuits Cake Molds Cake Decorating Tools',1,14),
(5,'HW-101',N'Kitchen Scales',10,20,N'Adjustable Kitchen Scales Measure Cups Double-head Cookware Measuring Spoon for Soup Coffee Tea Powder with Scal Kitchen Gadget
',1,14),
(5,'HW-101',N'Cookie Mould',10,20,N'5pcs Stainless Steel Biscuit Mould Cake Tool Cookie Mould Cutters Specialized Multi-function DIY Baking Tools Dropshipping',1,14),
(5,'HW-101',N'Disposable Plastic',10,20,N'50pcs Disposable Plastic Colorful Stick Love Heart Arrow Shape Fruit Fork Picks Set for Party kitchen accessorie',1,14),
(5,'HW-101',N'Drinking Straws',10,20,N'2pcs Reusable Silicone Drinking Straws Home Party Straw with Cleaning Brush for Home Party Wedding Decor Bar Accessories Straws',1,14),
(5,'HW-101',N'Defrost Tray',10,20,N'Defrost Tray Food Meat Pork Thaw Frozen in Minutes Kitchen Defrosting Tools',1,14),
(5,'HW-101',N'Microfiber Duster',10,20,N'Adjustable Stretch Extend Microfiber Duster Static Suction Dusting Brush Clean Up Table Car Dust Anti-Static House Cleaning Tool',1,15),
(5,'HW-101',N'Brush Dust',10,20,N'Soft Microfiber Cleaning Duster Brush Dust Cleaner can not lose hair Static Anti Dusting Brush Household Cleaning Tools',1,15),
(5,'HW-101',N'Feather Duster',10,20,N'Duster Dust Cleaner Adjustable Stretch Extend Microfiber Feather Duster Furniture Dust Brush Household Cleaning Tools',1,15),
(5,'HW-101',N'Disposable Gloves',10,20,N'100pcs Plastic Disposable Gloves Restaurant Home Service Catering Hygiene Home Dining Kitchen Accessories',1,15),
(5,'HW-101',N'Compressed Towel',10,20,N'10Pcs Non Disposable Compressed Towel Non-woven Eco Towel for Outdoor Travel Bath Towel Shower Cleaning Towel',1,15),
(5,'HW-101',N'Bent Straws',10,20,N'3/5pcs Stainless Steel Straight Bent Straws+Cleaning Brush Drinking Tool With Cleaning Brush Dinking Straws Bar Accessories',1,15),
(5,'HW-101',N'Buffing Cloth',10,20,N'10pcs/set T-type Round Polishing Buffing Cloth Electric Grinder Cleaning Wheel Brush Rotary Tool for Power',1,15),
(5,'HW-101',N'Brush Toilet',10,20,N'Household Long Handle Cleaning Brush Toilet Decontamination Brush Set Toilet Brush Wall-Mounted Floor-Standing Cleaning Tools',1,15),
(5,'HW-101',N'Plastic Gloves',10,20,N'100pcs Eco-friendly Disposable Plastic Gloves for Restaurant Hotel Handling Raw Chicken Plastic Multifuctional Gloves Food',1,15),
(5,'HW-101',N'Straws Heart',10,20,N'1/2/3/5Pcs Reusable Drinking Straw Heart Shaped Stainless Steel Metal Straws Reusable Straw w/Cleaning Brush Bar Accessories',1,15),
(5,'HW-101',N'Stainless Steel Straws',10,20,N'1/5Pcs Reusable Drinking Straws Bar Drinking Stainless Steel Straws With Cleaning Brush Party Eco-friendly Drinking Accessories',1,15),
(5,'HW-101',N'Floor Mop',10,20,N'Replacement 360 Rotating Head Easy Microfiber Spinning Floor Mop Head for Housekeeper Home Floor Cleaning Mop',1,15),
(5,'HW-101',N'Toilet Brush',10,20,N'Long Handle Toilet Brush Holder Set Bathroom Lavatory Cleaning Tool Floor-Standing WC Toilet Cleaning Brush Bathroom Accessories',1,15),
(5,'HW-101',N'Solder Iron',10,20,N'High Temperature Resistant Solder Iron Tip Cleaning Sponge PCB Repair Pads Tin Wire Melt Rosin Core Solder Soldering Wire Roll',1,15),
(5,'HW-101',N'Floor Mop Pad',10,20,N'Double Sided Flat Mops Floor Mop Pad with Replacement Cleaning Cloth Head for Household Cleaning Tools Accessories',1,15),
(5,'HW-101',N'Gun Spray',10,20,N'Pneumatic Air Blow Gun Spray Pistol Compressor Dust Blower Cleaner Compressor Dust Blower 8inch Nozzle Cleaning Tool',1,15),
(5,'HW-101',N'Straw Stainless',10,20,N'5pcs/Set Reusable Drinking Straw Stainless Steel Straight Bent Straws+Cleaning Brush Set Bar Coffee Milk Drinking Accessories',1,15),
(5,'HW-101',N'Floor Cleaning',10,20,N'Floor Cleaning Tool Spray Mop 350ML Microfiber Cloth Hand Wash Plate Mop Home Windows Kitchen Mop Sweeper Broom Floor Clean Mops',1,15),
(5,'HW-101',N'Sticky Brush',10,20,N'Reusable Lint Rollers Double Side Clothes Sticky Brush Dust Remover Pet Hair Cleaner Home Clothes Cleaning Tools Random Color',1,15),
(5,'HW-101',N'Groove Cleaning',10,20,N'Window Groove Cleaning Brush Cleaning Tool Sweeping the Small Brush Mini Sill Crevice Sweeping Brush Household Cleaning Tools',1,15)
GO

/*========================================End================================================*/





/*=============================Lấy dữ liệu để vẽ đồ thị===========================================*/
SELECT DAY(create_date) AS [day],DATENAME(dw,create_date) AS [weekday],COUNT(create_date)AS numOfOrder,SUM(total_price) AS totalMoney FROM dbo.[order] WHERE Day(GETDATE())-Day(create_date)<7 GROUP BY create_date,DAY(create_date)

/*==========================================End================================================*/


SELECT COUNT(*) FROM dbo.product GROUP BY category_id ORDER BY category_id ASC

/*===================================================================*/

SELECT ISNULL(SUM(total_price),'0')AS total FROM dbo.[order] WHERE YEAR(create_date)=YEAR(GETDATE()) and MONTH(create_date)=11

SELECT * FROM
(SELECT *,ROW_NUMBER() OVER (ORDER BY ID ASC) as row_num 
FROM dbo.product WHERE name LIKE '%a%' OR description like '%a%') AS product 
WHERE row_num >= (2 - 1)*10 +1 AND row_num<= 2 * 10

SELECT COUNT(*) FROM dbo.product WHERE name LIKE '%a%' OR description LIKE '%a%'


/*=======================================End===================================*/