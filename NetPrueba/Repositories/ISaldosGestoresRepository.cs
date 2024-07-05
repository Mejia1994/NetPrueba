using NetPrueba.Views;

namespace NetPrueba.Repositories
{
    public interface ISaldosGestoresRepository
    {
        Task<IEnumerable<SaldosGestoresView>> GetSaldosGestoresView();
        Task<IEnumerable<SaldosGestoresView>> ExecSaldosGestoresView();
    }
}
