using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Prueba
{
    public partial class Pea : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=TOSHIBAI7;Initial Catalog=prueba;Integrated Security=True");
        SqlCommand comando = new SqlCommand();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

                Bind_ddl_materia();
                ddl_materia.Items.Insert(0, new ListItem("Seleccione Materia", "0"));
             

            }
            
        }

        protected void ddl_materia_SelectedIndexChanged(object sender, EventArgs e)
        {
            Mostar_Datos();
        }
        public void Bind_ddl_materia()
        {
            
            con.Open();
            SqlCommand com = new SqlCommand("Select ID_MATERIA, NOM_MATE from TB_MATERIA ", con);
            SqlDataReader dr = com.ExecuteReader();
            ddl_materia.DataSource = dr;
            ddl_materia.Items.Clear();
            ddl_materia.Items.Add("seleccione");
            ddl_materia.DataTextField = "NOM_MATE";
            ddl_materia.DataValueField = "ID_MATERIA";
            ddl_materia.DataBind();
            con.Close();

        }
        


        // mostrar datos en el Grid1
        public void Mostar_Datos()
        {
            //hacemos la consulta a la base de datos
            SqlCommand cmd = new SqlCommand("Select * from TB_PEA where ID_MATERIA ='" + ddl_materia.SelectedValue + "'", con);
            //objeto adapter para hacer el enlace y llenado del dataset
            SqlDataAdapter adapter = new SqlDataAdapter();
            //asignamos la propiedad selectcommand al objeto command para que ejecute consulta
            adapter.SelectCommand = cmd;
            //abrimos la conexion
            con.Open();
            //creamos objeto dataset
            DataSet objdataset = new DataSet();
            //llenamos el datable del dataset
            //el metodo fill obtiene los datos recuperados del dataadapter y los coloca dentro del dataset
            adapter.Fill(objdataset);
            //cerramos conexion
            con.Close();
            //enlazamos los datos al griedvied
            GridView1.DataSource = objdataset;
            GridView1.DataBind();
        }

        

        protected void Button1_Click(object sender, EventArgs e)
        {
         
        }
    }
}