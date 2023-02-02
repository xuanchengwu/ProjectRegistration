using DAL.Models;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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

    }
}
