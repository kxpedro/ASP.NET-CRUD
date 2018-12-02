<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="index.aspx.cs" Inherits="Funcionarios.Site.Modelo.index" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>   
    <title>Cadastro de Funcionarios</title>
    <link href="../Content/bootstrap.css" rel="stylesheet" />
</head>    
<body>
    <div class="container">
        <div class="row">
            <div class="col-12">
				<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow p-3 mb-5">                    
                    <a class="navbar-brand" href="index.php">Cadastro de Funcionarios</a>
				</nav>
            </div>
            <div class="col-12">
                <form id="form1" name="form1" method="post" runat="server">
                    <div class="form-group">  
                        <asp:HiddenField ID="hf_id_fun" runat="server"/>
                        <asp:Label ID="lbl_nome_fun" runat="server" Text="Nome Completo"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txt_nome_fun" runat="server"></asp:TextBox>           
                        
                        <asp:Label ID="lbl_dnasc_fun" runat="server" Text="Data de Nascimento"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txt_dnasc_fun" TextMode="Date" runat="server"></asp:TextBox>
                        
                        <asp:Label ID="lbl_sal_fun" runat="server" Text="Salário"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txt_sal_fun" TextMode="Number" runat="server"></asp:TextBox>

                        <asp:Label ID="lbl_foto_fun" runat="server" Text="Foto de Perfil"></asp:Label>
                        <asp:TextBox CssClass="form-control" ID="txt_foto_fun" runat="server"></asp:TextBox>                        
                        <br/>                         
                        
                        <asp:Button CssClass="btn" ID="btn_cadastrar" runat="server" Text="Cadastrar" OnClick="btn_cadastrar_Click"/>
                        <asp:Button CssClass="btn" ID="btn_limpar" runat="server" Text="Limpar" OnClick="btn_limpar_Click"/>  
                        <br /> 
                        <br /> 
                        <asp:Label CssClass="col-form-label" ID="lblSucesso" runat="server" Text=""></asp:Label>
                        <br />
                        <br />
                        <asp:GridView CssClass="table" ID="gvFuncionario" runat="server" AutoGenerateColumns="false">
                            <Columns>
                                <asp:BoundField DataField="nome_fun" HeaderText="Nome Completo"/>
                                <asp:BoundField DataField="dnasc_fun" HeaderText="Data de Nascimento"/>
                                <asp:BoundField DataField="salario_fun" HeaderText="Salário"/>
                                <asp:BoundField DataField="foto_fun" HeaderText="Foto"/>                                
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lnkView" runat="server" CommandArgument='<%# Eval("id_fun") %>' OnClick="lnk_deletar_OnClick">Deletar</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>


                    </div>
                </form>

            </div>
        </div>
    </div>
</body>
</html>
