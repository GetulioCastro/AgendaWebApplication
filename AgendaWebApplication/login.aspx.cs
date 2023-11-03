using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AgendaWebApplication
{
    public partial class login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogar_Click(object sender, EventArgs e)
        {
            String email = txbEmail.Text;
            String senha = txbSenha.Text;

            // capturar a 'connectionstring'
            System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/AgendaDB");

            System.Configuration.ConnectionStringSettings connString;
            connString = rootWebConfig.ConnectionStrings.ConnectionStrings[1];

            // cria um objeto de conexão
            SqlConnection con = new SqlConnection();
            con.ConnectionString = connString.ToString();
            SqlCommand cmd = new SqlCommand();
            cmd.Connection = con;
            cmd.CommandText = "SELECT * FROM Usuario  WHERE email = @email AND senha = @senha";
            cmd.Parameters.AddWithValue ("email", email);
            cmd.Parameters.AddWithValue ("senha", senha);
            con.Open();

            SqlDataReader reader = cmd.ExecuteReader();
            if (reader.HasRows)
            {
                //cookie
                HttpCookie login = new HttpCookie("login", txbEmail.Text);
                Response.Cookies.Add (login);
                //direciona para a página principal
                Response.Redirect("~/index.aspx");
            }
            else
            {
                Response.Write("<script>alert('E-mail ou Senha incorretos!')</script>");
                //lblMsg.Text = "E-mail ou Senha incorretos!";
            }

        }
    }
}