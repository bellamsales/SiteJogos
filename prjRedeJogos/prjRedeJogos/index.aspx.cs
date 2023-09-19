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
    public partial class index1 : System.Web.UI.Page
    {
        string linhadeconexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=app_jogos_37277";
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(linhadeconexao);
            try
            {
                conexao.Open();
                string comando = "Select nm_apelido, ds_usuario from usuario order by nm_usuario asc";
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();
                if (dados.HasRows)
                {
                    while (dados.Read())
                    {
                        litUsuarios.Text += $@"
                        <div class='divisao'>
                           <img src='images/icon.png'/>
                            <div class='borda'>
                               <h2>{dados.GetString("nm_apelido")}<h2/>
                                <p>{dados.GetString("ds_usuario")}</p>
                           </div>
                       </div>";
                    }
                }
                if (!dados.IsClosed)
                    dados.Close();
            }
            catch
            {
                throw new Exception("Não foi possivel fazer a consulta de Usuários");
            }
            finally { conexao.Close(); }
        }
    }
    
}