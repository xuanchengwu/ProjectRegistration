using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using DAL;

namespace BLL
{
    public class BLL_Class
    {
        public tblProduct GetTblProduct_bll(int pid)
        {
            return new DAL_Class().GetTblProduct(pid);
        }
    }
}
