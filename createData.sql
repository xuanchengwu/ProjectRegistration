

delete from tblProduct;
delete from tblSubCategory;


insert into tblCategory values(1, 'Mechanical')
insert into tblCategory values(2, 'Electrical')
insert into tblCategory values(3, 'Stationary')
insert into tblCategory values(4, 'Furniture')

insert into tblSubCategory values(1, 2, 'Fan');
Insert into tblSubCategory values(2,2,'Vaccums')
Insert into tblSubCategory values(3,1,'Hammer')
Insert into tblSubCategory values(4,3,'Pen')
Insert into tblSubCategory values(5,4,'Chair')
Insert into tblSubCategory values(6,4,'Table')

set identity_insert tblProduct ON;





Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(1,'FanA', 'Series250', 'ModelA', 2022, 'Series info1', 'Cartoon', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanA.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(2,'FanB', 'Series250', 'ModelB', 2023, 'Series info2', 'Cartoon', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanB.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(3,'FanC', 'Series350', 'ModelC', 2005, 'Series info3', 'Ceiling', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanC.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(4,'FanD', 'Series380', 'ModelC', 2007, 'Series info4', 'Ceiling', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanD.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(5,'FanE', 'Series100', 'ModelD', 2012, 'Series info5', 'Stand', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanE.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(6,'FanF', 'Series110', 'ModelE', 2015, 'Series info6', 'Stand', 1, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\FanF.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(7,'ChairA', 'Series10', 'ModelA', 2005, 'Series info7', 'Wooden', 5, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\ChairA.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(8,'TableA', 'Series50', 'ModelB', 2009, 'Series info8', 'Wooden', 6, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\ChairA.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(9,'VacuumA', 'Series1000', 'ModelE', 2010, 'Series info9', 'Light', 2, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\VacuumA.jpg', Single_Blob) as Image))

Insert into tblProduct
(Product_ID, Product_Name, Series, Model, Model_Year, Series_Info, Feature, SubCategory_ID, Product_Image)
values(10,'PenA', 'Series1', 'ModelA', 2000, 'Series info10', 'Black', 4, 
(Select BulkColumn
from Openrowset (Bulk 'D:\source\ProjectRegistration\WebApplication\Image\PenA.jpg', Single_Blob) as Image))


set identity_insert tblProduct off;


