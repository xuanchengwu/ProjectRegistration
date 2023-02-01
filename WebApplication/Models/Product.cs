using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace WebApplication.Models
{
    [Table("POC_Marketplace")]
    public class Product
    {
        [Key]
        public int Product_ID { get; set; }
        public string Product_Name { get; set; }
        public string Category { get; set; }
        public int subCategoryID { get; set; }
        public string Seris { get; set; }
        public string Seris_Info { get; set; }
        public string Feature { get; set; }
        public string Model { get; set; }
        public int Model_Year { get; set; }


    
    }
}