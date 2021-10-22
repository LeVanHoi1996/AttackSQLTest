using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AttackSQL
{
     public class SetupDB
    {
        //data
        public string Namedatabase { get; set; }
        public string FILENAME { get; set; }
        public string SIZE { get; set; }
        public string MAXSIZE { get; set; }
        public string FILEGROWTH { get; set; }
        //log
        public string Namedatabase_log { get; set; }
        public string FILENAME_log { get; set; }
        public string SIZE_log { get; set; }
        public string MAXSIZE_log { get; set; }
        public string FILEGROWTH_log { get; set; }

    }
}
