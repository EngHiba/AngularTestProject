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
    [Route("api/City")]
    public class CityController : Controller
    {
        private readonly StudentContext _context;

        public CityController(StudentContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetCities()
        {
            var list = _context.City.ToList();
            return Json(list);
        }

        [HttpGet("{id}")]
        public IActionResult GetCities(int id)
        {
            var list = _context.City.Where(t=>t.CountryId == id).ToList();
            return Json(list);
        }
            
    }
}