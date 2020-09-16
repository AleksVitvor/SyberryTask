using CommonResults.ResultForTerminal;
using DB.ResultModels;
using DB.UnitOfWork.Interface;
using Services.SearchService.Interface;
using System;
using System.Collections.Generic;
using System.Linq;

namespace Services.SearchService.Service
{
    public class SearchService : ISearchService
    {
        private DayOfWeek _day;
        private int _id;
        private IUnitOfWork _unitOfWork;
        public SearchService(IUnitOfWork unitOfWork)
        {
            _unitOfWork = unitOfWork;
        }

        public IEnumerable<ResultForTerminal> GetResults()
        {
            var resultForTerminal = new List<ResultForTerminal>();
            var result = GetSample();

            while (result.Count > 0) 
            {
                _day = result[0].Date.DayOfWeek;
                _id = result[0].Id;
                var list = result.Where(u => u.Id == result[0].Id && u.Date.DayOfWeek == result[0].Date.DayOfWeek);
                ResultForTerminal resultFor = new ResultForTerminal();
                resultFor.DayOfWeek = result[0].Date.DayOfWeek;
                resultFor.Name = result[0].Name;
                resultFor.DailyAverage = (decimal)(list.Average(u => u.Hours));
                resultForTerminal.Add(resultFor);
                result.RemoveAll(IsIdAndDayOfWeek);
            }
            return resultForTerminal;
        }

        public List<List<ResultForTerminal>> GetResultsOrderDays(IEnumerable<ResultForTerminal> results)
        {
            List<List<ResultForTerminal>> finalResult = new List<List<ResultForTerminal>>();
            for (int i = 1; i < 7; i++)
            {
                var addingList = results.Where(u => u.DayOfWeek == (DayOfWeek)i).ToList();
                addingList=addingList.OrderByDescending(u => u.DailyAverage).ToList();
                finalResult.Add(addingList);
            }
            var addingListSunday = results.Where(u => u.DayOfWeek == (DayOfWeek)0).ToList();
            addingListSunday = addingListSunday.OrderByDescending(u => u.DailyAverage).ToList();
            finalResult.Add(addingListSunday);
            return finalResult;
        }

        private List<Result> GetSample()
        {
            return _unitOfWork.SQLQuery<Result>("exec SyberryTest_GetAllUsersWithTimeReports").ToList();
        }
        private bool IsIdAndDayOfWeek(Result result)
        {
            return result.Date.DayOfWeek == _day && result.Id == _id;
        }
    }
}
