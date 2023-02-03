using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using BLL;
using DAL;
using DAL.Models;

namespace WebApplication.Controllers
{
    public class ProductController : Controller
    {
        // GET: Product
        public ActionResult Index()
        {
            return View();
        }

        public ActionResult Display()
        {
            BLL_Class bll = new BLL_Class();
            tblProduct A = bll.GetTblProductbyID_bll(1);
            tblProduct B = bll.GetTblProductbyID_bll(2);
            tblProduct C = bll.GetTblProductbyID_bll(3);
            List<tblProduct> l = new List<tblProduct>();
            l.Add(A);
            l.Add(B);
            l.Add(C);
            return View(l);
        }
        
        public ActionResult Compare(FormCollection f)
        {

            string s = f["compareCB"];
            BLL_Class bll = new BLL_Class();
            int[] arr = StringtoIntArr(s);
            List<tblProduct> l = new List<tblProduct>();

            foreach (int i in arr)
            {
                l.Add(bll.GetTblProductbyID_bll(i));
            }

            return View(l);

            
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