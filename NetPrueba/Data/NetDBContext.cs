using System.Collections.Generic;
using Microsoft.EntityFrameworkCore;
using NetPrueba.Views;

namespace NetPrueba.Context
{
    public class NetDBContext : DbContext
    {
        public DbSet<SaldosGestoresView> saldosGestoresView { get; set; }

        public NetDBContext(DbContextOptions<NetDBContext> options): base(options)
        {
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            base.OnModelCreating(modelBuilder);

            modelBuilder.Entity<SaldosGestoresView>().ToView("saldosGestoresView");
            modelBuilder.Entity<SaldosGestoresView>().HasNoKey();
        }
    }
}
