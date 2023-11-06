using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace AgendaWebApplication
{
    public partial class usuarios : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["AgendaDBConnectionString"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) AS TotalContatos FROM [Contato]", connection))
                    {
                        using (SqlDataReader reader = cmd.ExecuteReader())
                        {
                            if (reader.Read())
                            {
                                int totalContatos = Convert.ToInt32(reader["TotalContatos"]);
                                lblMensagem.Text = "Total de contatos inseridos é: " + totalContatos.ToString();
                            }
                        }
                    }
                }
            }
        }

        public void limparCampos()
        {
            lblMensagem.Text = string.Empty;
        }


        protected void SqlDataSourceU_Inserted(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Response.Write("<script>alert('Inserindo um registro duplicado ou com campos em branco!');</script>");
                //lblMensagem.Text = "Inserindo um registro duplicado ou com campos em branco!";
                e.ExceptionHandled = true;
            }
        }

        protected void SqlDataSourceU_Updated(object sender, SqlDataSourceStatusEventArgs e)
        {
            if (e.Exception != null)
            {
                Response.Write("<script>alert('Alterando um registro sem informar todos os campos!');</script>");
                //lblMensagem.Text = "Alterando um registro sem informar todos os campos!";
                e.ExceptionHandled = true;
            }
        }

        protected void btnLimpar_Click(object sender, EventArgs e)
        {
            limparCampos();
        }

    }
}