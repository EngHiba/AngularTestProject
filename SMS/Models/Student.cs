using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class Student
    {
        public int Id { get; set; }
        public int PersonId { get; set; }
        public int YearId { get; set; }
        public int CityId { get; set; }
        public string Address { get; set; }
        public string Mobile { get; set; }
        public string Phone { get; set; }
        public string Email { get; set; }
        public bool IsCanceled { get; set; }

        public City City { get; set; }
        public Person Person { get; set; }
        public StudyYear Year { get; set; }
    }
}
