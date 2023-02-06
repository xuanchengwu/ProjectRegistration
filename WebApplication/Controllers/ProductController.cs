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
        public ActionResult Index()
        {


            string minYear = Request.Form["MinYear"];
            string maxYear = Request.Form["MaxYear"];
            string brand = Request.Form["Brand"];

            //default
            int MinYear = 0;
            int MaxYear = 2023;
            string Brand = "";


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


            product = (List<tblProduct>)product.Where(p => p.Model_Year >= MinYear).ToList();
            product = (List<tblProduct>)product.Where(p => p.Model_Year <= MaxYear).ToList();
            product = (List<tblProduct>)product.Where(p => p.Product_Name.Contains(Brand)).ToList();


            return View(product);

        }


        public ActionResult Compare(FormCollection f)
        {

            string s = f["compareCB"];
            BLL_Class bll = new BLL_Class();
            int[] arr = StringtoIntArr(s);
            List<tblProduct> l = new List<tblProduct>();


            if (arr.Length <= 1)
            {
                ViewBag.ErrorMessage = "Please select more than one item.";

                return View("Error");
            }
            else {
                foreach (int i in arr)
                {
                    l.Add(bll.GetTblProduct_bll(i));
                }
                return View(l);
            }
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