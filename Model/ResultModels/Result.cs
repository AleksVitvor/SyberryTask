using System;
using System.ComponentModel.DataAnnotations;

namespace DB.ResultModels
{

    public class Result
    {
        public int Id { get; set; }
        [DataType(DataType.Date)]
        [DisplayFormat(DataFormatString = "{0:MM'/'dd'/'yyyy}", ApplyFormatInEditMode = true)]
        public DateTime Date { get; set; }
        public string Name { get; set; }
        public float Hours { get; set; }
    }
}
