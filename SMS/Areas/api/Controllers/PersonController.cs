using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Cors;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Storage;
using SMS.Models;

namespace MTS.Areas.api.Controllers
{
    [Produces("application/json")]
    [Route("api/Person")]
    [EnableCors("CorsPolicy")]
    public class PersonController : Controller
    {
        private readonly StudentContext _context;

        public PersonController(StudentContext context)
        {
            _context = context;
        }

        // GET: api/ConfigLinks
        [HttpGet]
        public IEnumerable<Person> GetPersons()
        {
            return _context.Person;
        }

        // GET: api/ConfigLinks/5
        [HttpGet("{id}")]
        public IActionResult GetPerson([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var student = _context.Person.Find(id);

            if (student == null)
            {
                return NotFound();
            }

            return Ok(student);
        }

        [HttpGet("{IdentityNo}")]
        public IActionResult GetPerson([FromRoute] string IdentityNo)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var student = _context.Person.Where(t=>t.IdentityNo == IdentityNo).FirstOrDefault();

            if (student == null)
            {
                return NotFound();
            }

            return Ok(student);
        }

        // PUT: api/ConfigLinks/5
        [HttpPut("{id}")]
        public async Task<IActionResult> PutPerson([FromRoute] int id, [FromBody] Student person)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != person.Id)
            {
                return BadRequest();
            }

            _context.Entry(person).State = EntityState.Modified;

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
        public async Task<IActionResult> PostPerson([FromBody] Student person)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            IDbContextTransaction transaction = _context.Database.BeginTransaction();
            try
            {

                _context.Student.Add(person);
                await _context.SaveChangesAsync();
                _context.Database.CommitTransaction();
            }
            catch (DbUpdateException)
            {
                throw;
            }

            return CreatedAtAction("GetPerson", new { id = person.Id }, person);
        }

        // DELETE: api/ConfigLinks/5
        [HttpDelete("{id}")]
        public async Task<IActionResult> DeletePerson([FromRoute] int id)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            var person = await _context.Person.SingleOrDefaultAsync(m => m.Id == id);
            if (person == null)
            {
                return NotFound();
            }

            _context.Person.Remove(person);
            await _context.SaveChangesAsync();

            return Ok(person);
        }

        private bool StudentExists(int id)
        {
            return _context.Student.Any(e => e.Id == id);
        }
    }
}