using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class StudyYear
    {
        public StudyYear()
        {
            Student = new HashSet<Student>();
        }

        public int Id { get; set; }
        public int DepartmentId { get; set; }
        public string Title { get; set; }

        public Department Department { get; set; }
        public ICollection<Student> Student { get; set; }
    }
}
