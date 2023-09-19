using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;

namespace prjRedeJogos
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string linhadeconexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=app_jogos";
            MySqlConnection conexao = new MySqlConnection(linhadeconexao);
            try
            {
                conexao.Open();
                string comando = "Select nm_apelido, ds_usuario from usuario order by nm_usuario asc";
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();
                while (dados.Read())
                {
                    LitNomeEDesc1.Text += dados.GetString(0);
                    LitNomeEDesc2.Text += dados.GetString(0);
                    LitNomeEDesc3.Text += dados.GetString(0);
                    LitNomeEDesc4.Text += dados.GetString(0);
                    LitNomeEDesc5.Text += dados.GetString(0);
                }
            }
            catch
            {
            }
            conexao.Close();
        }
    }
}