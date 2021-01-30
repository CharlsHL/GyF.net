using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;


namespace GyF.net
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        int presupuesto;
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void btbuscar_Click(object sender, EventArgs e)
        {
            
            if (cajaBusqueda.Text != "")
            {
               presupuesto = Convert.ToInt32(cajaBusqueda.Text);
            }
            MsjError.Visible = false;
            // Compararia con el menor de los valores de la base de datos, pero para hacer el menor uso posible de la BD lo hice con el menor conocido  
            if (presupuesto < 5)
            {         
                SqlDataSource1.SelectCommand = "SELECT * FROM Productos WHERE(PrecioProd = 0)";
                MsjError.Visible = true;              
            }
            else
            {
            
                SqlDataSource1.SelectCommand = "SELECT DISTINCT Categoría, IdProducto, PrecioProd, FechaCarga FROM  Productos WHERE PrecioProd <" + presupuesto + "";
                SqlDataSource1.SelectCommand = "SELECT TOP 2 * FROM Productos";
                SqlDataSource1.DataBind();
            } 
                           
        }
        protected void cajaBusqueda_TextChanged(object sender, EventArgs e)
        {

        }
        protected void gridCatalogo_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void SqlDataSource1_Selecting(object sender, SqlDataSourceSelectingEventArgs e)
        {

        }
    }
}