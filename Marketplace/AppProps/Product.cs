using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppProps
{
    internal class Product
    {
        int product_ID;
        string product_name;
        byte[] product_data;
        string series;
        string model;
        Nullable<int> model_year;
        string series_info;
        string feature;
        int subCategory_id;

        public int Product_ID { get; set; }
        public string Product_Name { get; set; }
        public byte[] Product_Image { get; set; }
        public string Series { get; set; }
        public string Model { get; set; }
        public Nullable<int> Model_Year { get; set; }
        public string Series_Info { get; set; }
        public string Feature { get; set; }
        public int SubCategory_ID { get; set; }

        public virtual tblSubCategory tblSubCategory { get; set; }
    }
}
