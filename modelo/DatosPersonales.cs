using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class DatosPersonales
    {
        public int id { get; set; }
        public DateTime fechaNacimiento { get; set; }
        public string nombre {get;set;}
        public string apellido {get;set;}
        public string dni {get;set;}
        public string sexo {get;set;}
        public string email {get;set;}
        public string codigoPostal {get;set;}
    }
}
