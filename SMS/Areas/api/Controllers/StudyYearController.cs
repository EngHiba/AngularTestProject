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
    [Route("api/StudyYear")]
    public class StudyYearController : Controller
    {
        private readonly StudentContext _context;

        public StudyYearController(StudentContext context)
        {
            _context = context;
        }

        [HttpGet]
        public IActionResult GetStudyYears()
        {
            var list = _context.StudyYear.ToList();
            return Json(list);
        }

        [HttpGet("{id}")]
        public IActionResult GetStudyYears(int Id)
        {
            var list = _context.StudyYear.Where(t=>t.DepartmentId == Id).ToList();
            return Json(list);
        }

    }
}