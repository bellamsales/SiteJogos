<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="prjRedeJogos.index1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Fira+Sans&family=Noto+Sans+Meroitic&display=swap">


    <link href="style.css" rel="stylesheet" />
    <title>Rede Jogos</title>
</head>
<body>
    <form id="form1" runat="server">
       
        <header>
            <img src="images/logo.png" />
            <input type="text" placeholder=" Pesquisar" />
            <section id="login">
             <a href="entrar">Entrar</a>
             <img src="images/logo.png" class="imagem"/>
            </section>
        </header>

         <h2 class="perfil">Perfis em Destaque</h2>
       <section>
           <%--<div class="divisao">
                   
               <img src="images/icon.png"/>
               <div class="borda">
                   <asp:Literal ID="LitNomeEDesc1" runat="server"></asp:Literal>
               </div>
           </div>--%>
           <asp:Literal ID="litUsuarios" runat="server"></asp:Literal>
       </section>


          <h2 class="jogos">Jogos em Destaque</h2>
       <section>            
<%--           <div class="divisao">
              <img src="images/left4dead.jpg"/>
                <div class="borda">
                   <p>Left 4 Dead</p>
                   <p>Lorem</p>
                </div>
           </div>--%>
           <asp:Literal ID="litJogos" runat="server"></asp:Literal>
       </section>
    </form>
</body>
</html>
