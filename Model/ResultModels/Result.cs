using System;
using System.Collections.Generic;
using System.Text;

namespace DB.ResultModels
{
    
    public class Result
    {
        public int Id { get; set; }
        public DateTime Date { get; set; }
        public string Name { get; set; }
        public float Hours { get; set; }
    }
}
