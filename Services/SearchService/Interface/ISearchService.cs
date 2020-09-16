using System.Collections.Generic;
using CommonResults.ResultForTerminal;
using DB.ResultModels;

namespace Services.SearchService.Interface
{
    public interface ISearchService
    {
        IEnumerable<ResultForTerminal> GetResults();
        List<List<ResultForTerminal>> GetResultsOrderDays(IEnumerable<ResultForTerminal> results);
    }
}
