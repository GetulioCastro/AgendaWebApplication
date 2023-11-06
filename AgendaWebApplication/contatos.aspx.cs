using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

namespace AgendaWebApplication
{
    public partial class WebForm1 : System.Web.UI.Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Session["TotalContatosInseridos"] = 0;
            }
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

        protected void gvContatos_RowInserted(object sender, GridViewRowEventArgs e)
        {
            int totalContatosInseridos = (int)Session["TotalContatosInseridos"];
            totalContatosInseridos++;
            Session["TotalContatosInseridos"] = totalContatosInseridos;
        }

        protected void gvContatos_SelectedIndexChanged(object sender, EventArgs e)
        {
            foreach (GridViewRow row in gvContatos.Rows)
            {
                if (row.RowIndex == gvContatos.SelectedIndex)
                {
                    row.CssClass = "selected-row"; // Aplica a classe de estilo aos itens selecionados
                }
                else
                {
                    row.CssClass = string.Empty; // Remove a classe de estilo dos outros itens
                }
            }
        }

    }
}