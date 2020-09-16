using DB.Context;
using DB.Repository.Implementation;
using DB.Repository.Interface;
using DB.UnitOfWork.Interface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;

namespace DB.UnitOfWork.Implementation
{
    public class UnitOfWork:IUnitOfWork, IDisposable
    {
        private bool disposed;
        private readonly ApplicationContext context = null;
        public Dictionary<Type, object> repositories = new Dictionary<Type, object>();

        public UnitOfWork(ApplicationContext context)
        {
            this.context = context;
        }  
        public void SaveChanges()
        {
            context.SaveChanges();
        }
        public void Dispose()
        {
            Dispose(true);
            GC.SuppressFinalize(this);
        }
        public virtual void Dispose(bool disposing)
        {
            if (!disposed)
            {
                if (disposing)
                {
                    context.Dispose();
                }
            }
            disposed = true;
        }
        public IQueryable<T> SQLQuery<T>(string sql, params object[] parameters) where T:class
        {
            return context.Set<T>().FromSqlRaw(sql, parameters);
        }

        public IRepository<T> Repository<T>() where T : class
        {
            if (repositories.Keys.Contains(typeof(T)) == true)
            {
                return repositories[typeof(T)] as IRepository<T>;
            }
            IRepository<T> repo = new Repository<T>(context);
            repositories.Add(typeof(T), repo);
            return repo;
        }
    }
}
