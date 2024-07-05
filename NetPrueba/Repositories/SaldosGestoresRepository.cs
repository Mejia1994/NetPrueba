using Microsoft.EntityFrameworkCore;
using NetPrueba.Context;
using NetPrueba.Views;

namespace NetPrueba.Repositories
{
    public class SaldosGestoresRepository : ISaldosGestoresRepository
    {
        private readonly NetDBContext _dbContext;

        public SaldosGestoresRepository(NetDBContext dbContext)
        {
            _dbContext = dbContext;
        }
        public async Task<IEnumerable<SaldosGestoresView>> GetSaldosGestoresView()
        {
            return await _dbContext.saldosGestoresView.ToListAsync();
        }

        public async Task<IEnumerable<SaldosGestoresView>> ExecSaldosGestoresView()
        {
            return await _dbContext.saldosGestoresView
                .FromSqlRaw("exec dbo.AsignarSaldosGestores")
                .ToListAsync();
        }
    }
}
