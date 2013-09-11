using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace EmployeesApp.Models
{
    public class EmployeeModel
    {
        [JsonProperty("photo")]
        public byte[] Photo { get; set; }

        [JsonProperty("phone")]
        public string Phone { get; set; }

        [JsonProperty("email")]
        public string Email { get; set; }

        [JsonProperty("address")]
        public string Address { get; set; }

        [JsonProperty("notes")]
        public string Notes { get; set; }
    }
}