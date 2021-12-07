using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


namespace modelo
{
    public class SubCategoria
    {
        public int id { get; set; }
        public string nombre { get; set; }
        public Categoria categoria { get; set; }
    }
}
