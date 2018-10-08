using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using SMS.Models;

namespace MTS.Areas.api.Controllers
{
    [Produces("application/json")]
    [Route("api/Student")]
    public class StudentController : Controller
    {
        private readonly StudentContext _context;

        public StudentController(StudentContext context)
        {
            _context = context;
        }

        // GET: api/ConfigLinks
        [HttpGet]
        public dynamic GetStudents()
        {
           return _context.Student.Select(t => new { t.Person, t.Address, t.CityId, t.Id, t.Mobile, t.Phone, t.YearId, t.Email }).ToList();
        }

        // GET: api/ConfigLinks/5
        [HttpGet("{id}")]
        public dynamic GetStudent(int id)
        {
        
            var student = _context.Student.Find(id);
            var Person = _context.Person.Find(student.PersonId);
            var DepartmentId = _context.StudyYear.Find(student.YearId).DepartmentId;

            return new { Person, student.Address, student.CityId, student.Id, student.Mobile, student.Phone, student.YearId, student.Email , DepartmentId };
        }

        // PUT: api/ConfigLinks/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutStudent([FromRoute] int id, [FromBody] Student student)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != student.Id)
            {
                return BadRequest();
            }

            _context.Entry(student).State = EntityState.Modified;
            _context.Entry(student.Person).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!StudentExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/ConfigLinks
        [HttpPost]
        public async Task<IActionResult> PostStudent([FromBody] Student student)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IDbContextTransaction transaction = _context.Database.BeginTransaction();
            try
            {

                Person p=  _context.Person.Add(student.Person).Entity;
                student.PersonId = p.Id;
                student.CityId = 1;
                _context.Student.Add(student);
                await _context.SaveChangesAsync();
                _context.Database.CommitTransaction();
            }
            catch (DbUpdateException)
            {
               throw;
            }

            return CreatedAtAction("GetStudent", new { id = student.Id }, student);
        }

        // DELETE: api/ConfigLinks/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeleteStuden([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var student = await _context.Student.SingleOrDefaultAsync(m => m.Id == id);
            if (student == null)
            {
                return NotFound();
            }

            _context.Student.Remove(student);
            await _context.SaveChangesAsync();

            return Ok(student);
        }

        private bool StudentExists(int id)
        {
            return _context.Student.Any(e => e.Id == id);
        }
    }
}