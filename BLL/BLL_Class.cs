using DAL.Models;
using DAL;
using System;
using System.Collections.Generic;
using System.Linq;
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
            return new DAL_Class().GetTblProductList();
        }

    }
}
