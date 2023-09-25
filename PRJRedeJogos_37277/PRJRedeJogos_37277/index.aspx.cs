using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using MySql.Data.MySqlClient;
using MySqlX.XDevAPI;


namespace PRJRedeJogos_37277
{
    public partial class index : System.Web.UI.Page
    {
        string linhadeconexao = "SERVER=localhost;UID=root;PASSWORD=root;DATABASE=app_jogos_37277";
        protected void Page_Load(object sender, EventArgs e)
        {
            MySqlConnection conexao = new MySqlConnection(linhadeconexao);

            //Lit de Usuários
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
                        <div class='DivisaoUsuario'>
                           <img src='images/bandeira.png'/ class='Favoritos'>
                           <img src='images/icon.png'/ class='iconperfil'>
                               <h3>{dados.GetString("nm_apelido")}<h3/>
                                <p class='txtUsuario'>{dados.GetString("ds_usuario")}</p>
                                <div class='Estrelinhas'>
                                    <img src='images/estrela.png' class='FotoEstrelinha'/>
                                    <img src='images/estrela.png' class='FotoEstrelinha'/>
                                    <img src='images/estrela.png' class='FotoEstrelinha'/>
                                    <img src='images/estrela.png' class='FotoEstrelinha'/>
                                    <img src='images/estrela.png' class='FotoEstrelinha'/>
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


            //Lit de Jogos
            try
            {
                conexao.Open();
                string comando = "Select nm_jogo, cd_jogo from jogo order by nm_jogo asc";
                MySqlCommand cSQL = new MySqlCommand(comando, conexao);
                MySqlDataReader dados = cSQL.ExecuteReader();
                if (dados.HasRows)
                {
                    while (dados.Read())
                    {
                        litJogos.Text += $@"
                        <div class='DivisaoJogos'>
                            <img src='images/{dados.GetInt32("cd_jogo")}.jpg'/>
                                <p>{dados.GetString("nm_jogo")}</p>
                        </div>";
                    }
                }
                if (!dados.IsClosed)
                    dados.Close();
            }
            catch
            {
                throw new Exception("Não foi possivel fazer a consulta de Jogos");
            }
            finally { conexao.Close(); }
        }
    }
}