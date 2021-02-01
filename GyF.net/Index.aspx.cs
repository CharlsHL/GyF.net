using System;
using System.Collections.Generic;
using System.Collections;
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
        DataTable dt2 = new DataTable();
        DataTable dt = new DataTable();
        protected void Page_Load(object sender, EventArgs e)
        {
            CargarGrid();
           crearTabla();
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
        protected void Button1_Click1(object sender, EventArgs e)
        {
            MsjError2.Visible = false;
            if (nodbCaja.Text!= "")
            {
                int control = Convert.ToInt32(nodbCaja.Text);
                if (control < 1 || control > 1000000)
                {
                    MsjError2.Visible = true;
                }
                else
                {
                    dt2.Columns.AddRange(new DataColumn[4] {new DataColumn("Id", typeof(int)),
                            new DataColumn("Precio", typeof(int)),
                            new DataColumn("Fecha",typeof(DateTime)),
                            new DataColumn("Categoria",typeof(string))});
                    dt2.Rows.Add(1, 10, "25/10/2019", "PRODDOS");
                    dt2.Rows.Add(2, 60, "21/10/2019", "PRODUNO");
                    dt2.Rows.Add(3, 05, "22/10/2019 ", "PRODDOS");
                    dt2.Rows.Add(4, 05, "29/10/2019", "PRODUNO");
                    dt2.Rows.Add(5, 15, "11/09/2019", "PRODDOS");
                    DataView dv = new DataView(dt2);
                    dv.Sort = "Precio Desc";

                    dv.RowFilter = string.Format("Convert(Precio, 'System.String') <= '" + nodbCaja.Text + "%'");
                    DataTable filtrada = new DataTable();
                    filtrada = dv.ToTable(true);

                    // Funcion evita que el filtro tome mas de una categoria del mismo producto
                    DataTable NoDuplicado = removerDuplicados(filtrada, "Categoria");

                    DataView nodup = new DataView(NoDuplicado);
                    nodup.RowFilter = string.Format("Convert(Precio, 'System.String') + Precio <= '" + nodbCaja.Text + "%'");
                    GridView1.DataSource = NoDuplicado;
                    GridView1.DataBind();
                }
            }

        }
        public void crearTabla()
        {
            if (!this.IsPostBack)
            {
                //DataTable dt2 = new DataTable();
                dt2.Columns.AddRange(new DataColumn[4] {new DataColumn("Id", typeof(int)),
                            new DataColumn("Precio", typeof(int)),
                            new DataColumn("Fecha",typeof(DateTime)),
                            new DataColumn("Categoria",typeof(string))});
                dt2.Rows.Add(1, 10, "25/10/2019", "PRODDOS");
                dt2.Rows.Add(2, 60, "21/10/2019", "PRODUNO");
                dt2.Rows.Add(3, 05, "22/10/2019 ", "PRODDOS");
                dt2.Rows.Add(4, 05, "29/10/2019", "PRODUNO");
                dt2.Rows.Add(5, 15, "11/09/2019","PRODDOS");
                GridView1.DataSource = dt2;
                GridView1.DataBind();
            }
        }   
        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        public DataTable removerDuplicados(DataTable table, string DistinctColumn)
        {
            try
            {
                ArrayList UniqueRecords = new ArrayList();
                ArrayList DuplicateRecords = new ArrayList();
                foreach (DataRow dRow in table.Rows)
                {
                    if (UniqueRecords.Contains(dRow[DistinctColumn]))
                        DuplicateRecords.Add(dRow);
                    else
                        UniqueRecords.Add(dRow[DistinctColumn]);
                }

                foreach (DataRow dRow in DuplicateRecords)
                {
                    table.Rows.Remove(dRow);
                }

                return table;
            }
            catch (Exception ex)
            {
                return null;
            }
        }
    }
}