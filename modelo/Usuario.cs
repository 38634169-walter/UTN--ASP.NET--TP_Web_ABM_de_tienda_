using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace modelo
{
    public class Usuario : DatosPersonales
    {
        public DateTime fechaAlta{ get; set; }
        public string usuario { get; set; }
        public string clave { get; set; }

    }
}
