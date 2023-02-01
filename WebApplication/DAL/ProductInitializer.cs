using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using WebApplication.Models;
using WebApplication.DAL;

namespace WebApplication.DAL
{
    public class ProductInitializer : System.Data.Entity.DropCreateDatabaseIfModelChanges<ProductContext>
    {
        protected override void Seed(ProductContext context)
        {
            var product = new List<Product>
            {
        
                new Product { Product_ID = 1, Category = "Furniture", Feature = "Cool", Model = "No", Model_Year = 1993, Seris = "Nistotia", Seris_Info = "No INFO", subCategoryID = 123, Product_Name = "Armchair"},
                new Product { Product_ID = 2, Category = "Electronics", Feature = "Lame", Model = "Yes", Model_Year = 2023, Seris = "Jav", Seris_Info = "Confidential", subCategoryID = 1234, Product_Name = "Cellphone" }
                
            };
            

            product.ForEach(s => context.Products.Add(s));
            context.SaveChanges();
        }
    }
}