using BLL;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Marketplace.Models
{
    public class YearRangeFilterAttribute : ActionFilterAttribute
    {
     /*   public int MinYear { get; set; }
        public int MaxYear { get; set; }

     
*/
        [HttpPost]
        public override void OnActionExecuting(ActionExecutingContext filterContext)
        {

            
            var minYear = filterContext.HttpContext.Request.QueryString["minYear"];
            var maxYear = filterContext.HttpContext.Request.QueryString["maxYear"];

            int MinYear = 1000;
            int MaxYear = 2000;



            BLL_Class bll = new BLL_Class();
          
            List<tblProduct> product = bll.GetTblProductList();

            if (!string.IsNullOrEmpty(minYear))
            {
                

                product = (List<tblProduct>)product.Where(p => p.Model_Year >= MinYear);
            }
            if (!string.IsNullOrEmpty(maxYear))
            {
                product = (List<tblProduct>)product.Where(p => p.Model_Year <= MaxYear);
            }
       //     product = (List<tblProduct>)filterContext.Controller.ViewData["Products"];

          //  var products = product?.Where(p => p.Model_Year >= MinYear && p.Model_Year <= MaxYear) ?? new List<tblProduct>();

            filterContext.ActionParameters["Products"] = product;

            base.OnActionExecuting(filterContext);
        }
    }

}