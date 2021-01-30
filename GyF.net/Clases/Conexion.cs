using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace GyF.net
{
    public class Class1
    {
        public string stGetConexion()
        {
            // Se toma la cadena de conexion del Web config, para que en una futura actualizacion de la base de datos
            //no se deba modificar mas que la cadena de conexion 

            return ConfigurationManager.ConnectionStrings["GyFConnectionString"].ToString();

        }
    }
}