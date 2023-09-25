<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="PRJRedeJogos_37277.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" media="(max-width: 800px)" href="example.css" />
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mooli&display=swap" rel="stylesheet">
        <link href="frufru.css" rel="stylesheet"/>
            <title>Rede Jogos</title>
</head>
<body>
        <form id="form1" runat="server">
       
            <header>
                <a href="index.aspx"><img src="images/logo.png" class="logo"/></a>
                <input type="text" placeholder=" Pesquisar" />
                <section id="login">
                 <a href="entrar"><p class="linkagem">Entrar</p></a>
                </section>
            </header>

             <h2 class="H2DoUsuario">Perfis em Destaque</h2>
           <section>
               <%--<div class="divisao1">
                   
                   <img src="images/icon.png"/>
                   <div class="fundousuario">
                       <asp:Literal ID="LitNomeEDesc1" runat="server"></asp:Literal>
                   </div>
               </div>--%>
               <asp:Literal ID="litUsuarios" runat="server"></asp:Literal>
           </section>
            <img src="images/reticencias.png" class="Pontinhos"/>


              <h2 class="jogos">Jogos em Destaque</h2>
           <section>            
    <%--           <div class="divisao2">
                  <img src="images/left4dead.jpg"/>
                    <div class="borda">
                       <p>Left 4 Dead</p>
                       <p>Lorem</p>
                    </div>
               </div>--%>
               <asp:Literal ID="litJogos" runat="server"></asp:Literal>
           </section>
           <img src="images/reticencias.png" class="Pontinhos"/>

        </form>
</body>
</html>
