using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Data.Sql;
using System.Configuration;

namespace GyF.net
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        //int presupuesto;
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrid();
        }
        protected void btbuscar_Click(object sender, EventArgs e)
        {
            Productos.DataSource = null;
            Productos.DataBind();

           if(cajaBusqueda.Text != "")
            {
                if (cajaBusqueda.Text == "0")
                {
                    MsjError.Visible = true;
                }
                else
                {
                    var connstring = ConfigurationManager.ConnectionStrings["GyFConnectionString"].ConnectionString;
                    using (SqlConnection sql = new SqlConnection(connstring))
                    {
                        using (SqlCommand cmd = new SqlCommand("Presupuesto", sql))
                        {
                            dt.Clear();
                            cmd.CommandType = CommandType.StoredProcedure;
                            cmd.Parameters.Add(new SqlParameter("@Presupuesto", cajaBusqueda.Text));
                            SqlDataAdapter da = new SqlDataAdapter(cmd);
                            sql.Open();
                            da.Fill(dt);
                            Productos.DataSource = null;
                            Productos.DataBind();
                            Productos.DataSource = dt;
                            Productos.DataBind();
                        }
                    }
                }
            }
        }
        public void CargarGrid()
        {
            var connstring = ConfigurationManager.ConnectionStrings["GyFConnectionString"].ConnectionString;
           // var query = "SELECT * FROM Productos";// este metodo no es recomendado ya que es propenso a inyecciones SQL 
                                                   // lo ulilice para limitara el uso de la base de datos como se pide en el ejercicio 
                                                   // lo correto es usar un Procedimiento almacenado en la base de datos 
            using (SqlConnection sql = new SqlConnection(connstring))
            {
                using (SqlCommand cmd = new SqlCommand("Carga", sql))
                {
                    cmd.CommandType = CommandType.StoredProcedure;
                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    sql.Open();
                    da.Fill(dt);
                    Productos.DataSource = dt;
                    Productos.DataBind();
                }
            }

        }
        public void  BuscarNosql()
        {
            try
            {
                var lst = dt.Select(string.Format("PrecioProd = '{0}'", cajaBusqueda.Text));

                //Declaras un nuevo dataTable para asignarlo a grid y no afectar el original
                var table = new DataTable();
                var column = new DataColumn();

                //Agregas las columnas correspondientes al nuevo dataTable
                column.DataType = System.Type.GetType("System.Int32");
                column.ColumnName = "PrecioProd";
                table.Columns.Add(column);

                column = new DataColumn();
                column.DataType = Type.GetType("System.String");
                column.ColumnName = "IdProducto";
                table.Columns.Add(column);
            
           
            

                    //LLenas el dataTable con el resultado de la busqueda
                     foreach (DataRow row in lst)
                    {
                    table.ImportRow(row);
                    }
                //Asignas el nuevo dataTable al grid
                Productos.DataSource = table;
            }
            catch (Exception ex)
            {
                throw;
            }



        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            BuscarNosql();
        }
    }
}