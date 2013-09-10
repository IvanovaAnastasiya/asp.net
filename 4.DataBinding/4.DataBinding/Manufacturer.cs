using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace _4.DataBinding
{
    public class Manufacturer
    {
        public Manufacturer(string name)
        {
            this.Name = name;
        }
        public string Name { get; set; }
        public List<Model> Models { get; set; }
    }
}