using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using SMS.Models;

namespace MTS.Areas.api.Controllers
{
    [Produces("application/json")]
    [Route("api/Nationality")]
    public class NationalityController : Controller
    {
        private readonly StudentContext _context;

        public NationalityController(StudentContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetNationalities()
        {
            var list = _context.Nationality.ToList();
            return Json(list);
        }

    }
}