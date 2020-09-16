using DB.Repository.Interface;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DB.Repository.Implementation
{
    class Repository<T> : IRepository<T> where T : class
    {
        DbContext _context;
        DbSet<T> _dbSet;

        public Repository(DbContext context)
        {
            _context = context;
            _dbSet = context.Set<T>();
        }
        public void Create(T item)
        {
            _dbSet.Add(item);
        }

        public IQueryable<T> Get()
        {
            return _dbSet;
        }

        public void Remove(T item)
        {
            _dbSet.Remove(item);
        }
    }
}
