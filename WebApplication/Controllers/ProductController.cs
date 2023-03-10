using BLL;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Optimization;

namespace Marketplace.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product

        BLL_Class bll = new BLL_Class();

        [HttpGet]
        public ActionResult Index(List<tblProduct> products)
        {

            return View(products);
        }


        //apply filters
        [HttpPost]
        public ActionResult Index(FormCollection f)
        {


            string minYear = Request.Form["MinYear"];
            string maxYear = Request.Form["MaxYear"];
            string brand = Request.Form["Brand"];
            string info = Request.Form["Series_Info"];

            //default
            int MinYear = 0;
            int MaxYear = 2023;
            string Brand = "";
            string Info = "";


            List<tblProduct> product = bll.GetTblProductList();

            if (!string.IsNullOrEmpty(minYear) || !string.IsNullOrEmpty(maxYear))
            {
                MinYear = int.Parse(minYear);
                MaxYear = int.Parse(maxYear);

            }

            if (!string.IsNullOrEmpty(brand))
            {
                Brand = brand;
            }

            if (!string.IsNullOrEmpty(info))
            {
                Info = info;
            }


            product = (List<tblProduct>)product.Where(p => p.Model_Year >= MinYear).ToList();
            product = (List<tblProduct>)product.Where(p => p.Model_Year <= MaxYear).ToList();
            product = (List<tblProduct>)product.Where(p => p.Product_Name.Contains(Brand)).ToList();
            product = (List<tblProduct>)product.Where(p => p.Series_Info.Contains(Info)).ToList();






            return View(product);

        }



        //[HttpGet]
        //public ActionResult Compare(List<tblProduct> product)
        //{
        //    return View(product);
        //}

        public ActionResult Compare(FormCollection f, List<tblProduct> product, int? selectedCategoryID, int? selectedSubCategoryID, string query)
        {
            POC_MarketplaceEntities objPOC_MarketplaceEntities = new POC_MarketplaceEntities();
            ViewBag.Categories = new SelectList(objPOC_MarketplaceEntities.tblCategories, "Category_ID", "Category_Name", selectedCategoryID);
            ViewBag.Subcategories = new SelectList(objPOC_MarketplaceEntities.tblSubCategories.Where(t => t.Catagory_ID == selectedCategoryID), "SubCategory_ID", "SubCategory_Name", selectedSubCategoryID);
            string s = f["compareCB"];
            BLL_Class bll = new BLL_Class();
            int[] arr = StringtoIntArr(s);
            product = new List<tblProduct>();
            if (arr.Length <= 1)
            {
                ViewBag.ErrorMessage = "Please select more than one item.";

                return View("Error");
            }
            else 
            {
                foreach (int i in arr)
            {
                product.Add(bll.GetTblProduct_bll(i));
            }
            return View(product);
        }

        public int[] StringtoIntArr(String s)
        {
            if (s != null)
            {
                var fooArray = s.Split(',');
                int[] ar = new int[fooArray.Length];
                for (int i = 0; i < fooArray.Length; i++)
                {
                    ar[i] = Convert.ToInt32(fooArray[i]);
                }

                return ar;
            }
            else
            {
                return new int[0];
            }
        }

    }
}