using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using DAL.Models;

namespace WebApplication.Controllers
{
    public class HomeController : Controller
    {
        POC_MarketplaceEntities objPOC_MarketplaceEntities = new POC_MarketplaceEntities();
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }

        public ActionResult SearchProduct()
        {
            //IEnumerable<SelectListItem> items = objPOC_MarketplaceEntities.tblCategories.Select(c => new SelectListItem
            //{
            //    Value = c.Category_Name,
            //    Text = c.Category_Name
            //});
            //ViewBag.CategoryTitle = items;

            //return View();
            ViewBag.Categories = new SelectList(objPOC_MarketplaceEntities.tblCategories, "Category_ID", "Category_Name");
            ViewBag.Subcategories = new SelectList(Enumerable.Empty<tblSubCategory>(), "SubCategory_ID", "SubCategory_Name");
            return View();

        }

        [HttpPost]
        public ActionResult SearchProduct(int? selectedCategoryID, int? selectedSubCategoryID, string query)
        {
            ViewBag.Categories = new SelectList(objPOC_MarketplaceEntities.tblCategories, "Category_ID", "Category_Name", selectedCategoryID);
            ViewBag.Subcategories = new SelectList(objPOC_MarketplaceEntities.tblSubCategories.Where(s => s.Catagory_ID == selectedCategoryID), "SubCategory_ID", "SubCategory_Name", selectedSubCategoryID);
            var x = selectedCategoryID;
            var y = selectedSubCategoryID;
            var products = objPOC_MarketplaceEntities.tblProducts.AsQueryable();

            // Filter by selected category
            if (selectedSubCategoryID.HasValue)
            {
                products = products.Where(p => p.SubCategory_ID == selectedSubCategoryID.Value);
            }

            //// Filter by selected subcategory
            //if (subcategoryId.HasValue)
            //{
            //    products = products.Where(p => p.SubcategoryId == subcategoryId.Value);
            //}

            // Search by query
            if (!string.IsNullOrEmpty(query))
            {
                products = products.Where(p => p.Product_Name.Contains(query) || p.Model.Contains(query) || p.Series_Info.Contains(query));
            }

            return View("Result", products.ToList());
        }
            
        
        public ActionResult getSubCategories(int categoryID) 
        {
            var subCategories = objPOC_MarketplaceEntities.tblSubCategories.Where(s => s.Catagory_ID == categoryID).Select(s => new { Id = s.SubCategory_ID, Name = s.SubCategory_Name });
            return Json(subCategories, JsonRequestBehavior.AllowGet);
        }
    }
    
}