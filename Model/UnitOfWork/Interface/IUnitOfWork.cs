using DB.Repository.Interface;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DB.UnitOfWork.Interface
{
    public interface IUnitOfWork
    {
        IRepository<T> Repository<T>() where T : class;
        void SaveChanges();
        IQueryable<T> SQLQuery<T>(string sql, params object[] parameters) where T : class;
    }
}
