using System;
using System.Data.SqlClient;

namespace AgendaWebApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnInserir_Click(object sender, EventArgs e)
        {
            try
            {
                if(txbNome.Text != "" && txbEmail.Text != "" && txbTeledfone.Text != "")
                {
                    // capturar a 'connectionstring'
                    System.Configuration.Configuration rootWebConfig = System.Web.Configuration.WebConfigurationManager.OpenWebConfiguration("/AgendaDB");

                    System.Configuration.ConnectionStringSettings connString;
                    connString = rootWebConfig.ConnectionStrings.ConnectionStrings[1];

                    // cria um objeto de conexão
                    SqlConnection con = new SqlConnection();
                    con.ConnectionString = connString.ToString();
                    SqlCommand cmd = new SqlCommand();
                    cmd.Connection = con;
                    cmd.CommandText = "INSERT INTO Contato (nome, email, telefone) VALUES (@nome, @email, @telefone)";
                    cmd.Parameters.AddWithValue("nome", txbNome.Text);
                    cmd.Parameters.AddWithValue("email", txbEmail.Text);
                    cmd.Parameters.AddWithValue("telefone", txbTeledfone.Text);
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();

                    gvContatos.DataBind();

                    txbNome.Text = string.Empty;
                    txbEmail.Text = string.Empty;
                    txbTeledfone.Text = string.Empty;
                }
                else
                {
                    throw new Exception("Campos em branco!");
                }

            }
            catch(Exception erro)
            {
                Response.Write("<script>alert('"+ erro.Message + "')</script>");
            }

        }
    }
}