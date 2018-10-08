using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class Department
    {
        public Department()
        {
            StudyYear = new HashSet<StudyYear>();
        }

        public int Id { get; set; }
        public string Title { get; set; }

        public ICollection<StudyYear> StudyYear { get; set; }
    }
}
