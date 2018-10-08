using Newtonsoft.Json;
using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class Person
    {
        public Person()
        {
            Student = new HashSet<Student>();
        }

        public int Id { get; set; }
        public string IdentityNo { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string MiddelName { get; set; }
        public DateTime BirthDate { get; set; }
        public int NationalityId { get; set; }
        public int GenderId { get; set; }

        public Nationality Nationality { get; set; }

        [JsonIgnore]
        public ICollection<Student> Student { get; set; }
    }
}
