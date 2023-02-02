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
        public tblProduct GetTblProduct_bll(int pid)
        {
            return new DAL_Class().GetTblProduct(pid);
        }


    }
}
