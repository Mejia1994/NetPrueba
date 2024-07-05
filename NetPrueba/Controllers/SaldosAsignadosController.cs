using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using NetPrueba.Context;
using NetPrueba.Repositories;

namespace NetPrueba.Controllers
{
    [ApiController]
    public class SaldosAsignadosController : Controller
    {
        private readonly ISaldosGestoresRepository saldosGestoresRepository;

        public SaldosAsignadosController(ISaldosGestoresRepository repo)
        {
            saldosGestoresRepository = repo;
        }

        [HttpGet("/SaldosGestores")]
        public async Task<IActionResult> SaldosGestoresGet()
        {
            var customerOrderViews = await saldosGestoresRepository.GetSaldosGestoresView();
            return Json(new { data = customerOrderViews, message = "ok" });
        }

        [HttpPost("/SaldosGestores")]
        public async Task<IActionResult> SaldosGestoresPost()
        {
            var customerOrderViews = await saldosGestoresRepository.ExecSaldosGestoresView();
            return Json(new { data = customerOrderViews, message = "ok" });
        }
    }
}
