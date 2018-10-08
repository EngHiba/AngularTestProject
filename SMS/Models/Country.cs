using System;
using System.Collections.Generic;

namespace SMS.Models
{
    public partial class Country
    {
        public Country()
        {
            City = new HashSet<City>();
        }

        public int Id { get; set; }
        public string Alpha2Code { get; set; }
        public string Alpha3Code { get; set; }
        public string Title { get; set; }
        public string Nationality { get; set; }

        public ICollection<City> City { get; set; }
    }
}
