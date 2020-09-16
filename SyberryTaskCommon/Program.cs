using DB.Context;
using DB.UnitOfWork.Implementation;
using DB.UnitOfWork.Interface;
using Services.SearchService.Service;
using System;
using System.Linq;

namespace SyberryTaskCommon
{
    class Program
    {
        static void Main(string[] args)
        {
            ApplicationContext context = new ApplicationContext();
            using UnitOfWork uow = new UnitOfWork(context);
            SearchService service = new SearchService(uow);
            var result = service.GetResultsOrderDays(service.GetResults());
            foreach(var res in result)
            {
                Console.Write("| {0} | ", res.First().DayOfWeek);
                for (int i = 0; i < 3 && i < res.Count; i++)
                {
                    if (i != 2 && i != res.Count - 1)
                        Console.Write($"{res[i]}, ");
                    else
                        Console.WriteLine($"{res[i]} |");
                }
            }
        }
    }
}
