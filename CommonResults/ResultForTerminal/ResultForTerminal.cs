using System;
using System.Collections.Generic;
using System.Text;

namespace CommonResults.ResultForTerminal
{
    public class ResultForTerminal
    {
        public decimal DailyAverage { get; set; }
        public string Name { get; set; }
        public DayOfWeek DayOfWeek { get; set; }
        public override string ToString()
        {
            return $"{Name}({Math.Round(DailyAverage, 2)})";
        }
    }
}
