using DAL.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DAL
{
    public class DAL_Class
    {
        POC_MarketplaceEntities mdb = new POC_MarketplaceEntities();

        public tblProduct GetTblProduct(int pid)
        {
            return mdb.tblProducts.Find(pid);
        }

        public List<tblProduct> GetTblProductList()
        {
            List < tblProduct > products= new List<tblProduct>();
            foreach (tblProduct p in mdb.tblProducts)
            {
                products.Add(p);
            }

            return products;
        }

    }
}
