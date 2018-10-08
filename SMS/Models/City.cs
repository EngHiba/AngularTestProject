using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class City
    {
        public City()
        {
            Student = new HashSet<Student>();
        }

        public int Id { get; set; }
        public int CountryId { get; set; }
        public string Title { get; set; }

        public Country Country { get; set; }
        public ICollection<Student> Student { get; set; }
    }
}
