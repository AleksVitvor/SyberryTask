using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DB.Repository.Interface
{
    public interface IRepository<T> where T:class
    {
        void Create(T item);
        IQueryable<T> Get();
        void Remove(T item);
    }
}
