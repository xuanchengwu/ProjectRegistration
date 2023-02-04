using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DAL;

namespace WebApplication.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Compare(List<tblProduct> lst)
        {
            BLL_Class bll = new BLL_Class();
            tblProduct A = bll.GetTblProduct_bll(1);
            tblProduct B = bll.GetTblProduct_bll(2);
            tblProduct C = bll.GetTblProduct_bll(3);
            List<tblProduct> l = new List<tblProduct>();
            l.Add(A);
            l.Add(B);
            l.Add(C);


            return View(l);
        }
    }
}