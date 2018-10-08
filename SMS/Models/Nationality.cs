using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class Nationality
    {
        public Nationality()
        {
            Person = new HashSet<Person>();
        }

        public int Id { get; set; }
        public string Title { get; set; }

        public ICollection<Person> Person { get; set; }
    }
}
