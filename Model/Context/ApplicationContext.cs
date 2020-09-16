using DB.ResultModels;
using Microsoft.EntityFrameworkCore;
using Model.Models;
using System.ComponentModel.DataAnnotations.Schema;

namespace DB.Context
{
    public class ApplicationContext:DbContext
    {
        [NotMapped]
        public DbSet<Result> Results { get; set; }
        public DbSet<Employee> Employees { get; set; }
        public DbSet<TimeReports> TimeReports { get; set; }
        public ApplicationContext():base()
        {
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder builder)
        {
            builder.Entity<Result>((pc =>
            {
                pc.HasNoKey();
            }));
        }
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(ResourceFile.ConnectionString);
        }
    }
}
