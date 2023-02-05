using DAL;
using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;

namespace BLL
{
    public class BLL_Class
    {
        POC_MarketplaceEntities mdb = new POC_MarketplaceEntities();
        public tblProduct GetTblProduct_bll(int pid)
        {
            return new DAL_Class().GetTblProduct(pid);
        }

        public List<tblProduct> GetTblProductList()
        {
            List<tblProduct> products = new List<tblProduct>();
            foreach (tblProduct p in mdb.tblProducts)
            {
                products.Add(p);
            }

            return products;
        }

    }
}
