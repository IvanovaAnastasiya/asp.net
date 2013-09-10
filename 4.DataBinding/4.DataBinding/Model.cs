using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace _4.DataBinding
{
    public class Model
    {
        public string Name { get; set; }
        public int Year { get; set; }

        public List<Extra> Extras { get; set; }
    }
}
