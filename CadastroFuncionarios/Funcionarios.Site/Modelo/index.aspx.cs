using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace Funcionarios.Site.Modelo
{
    public partial class index : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FillGridView();
        }

        protected void btn_limpar_Click(object sender, EventArgs e)
        {
            Clear();
            FillGridView();
        }

        public void Clear()
        {
            hf_id_fun.Value = "";
            txt_nome_fun.Text = txt_foto_fun.Text = txt_sal_fun.Text = txt_dnasc_fun.Text = "";
            btn_cadastrar.Text = "Cadastrar";         
        }

        protected void btn_cadastrar_Click(object sender, EventArgs e)
        {
            var cmd = new SqlCommand();
            cmd.Connection = Conexao.connection;
            cmd.CommandText = "INSERT INTO funcionarios (nome_fun, dnasc_fun, salario_fun, foto_fun)" + 
                              "VALUES (@nome_fun, @dnasc_fun, @salario_fun, @foto_fun)";
            Conexao.Conectar();
            cmd.Parameters.AddWithValue("@id_fun", hf_id_fun.Value==""?0:Convert.ToInt32(hf_id_fun.Value));
            cmd.Parameters.AddWithValue("@nome_fun", txt_nome_fun.Text.Trim());
            cmd.Parameters.AddWithValue("@dnasc_fun", txt_dnasc_fun.Text.Trim());
            cmd.Parameters.AddWithValue("@salario_fun", txt_sal_fun.Text==""?0:Convert.ToDecimal(txt_sal_fun.Text));
            cmd.Parameters.AddWithValue("@foto_fun", txt_foto_fun.Text.Trim());
            cmd.ExecuteNonQuery();
            Conexao.Desconectar();
            Clear();
            if (hf_id_fun.Value=="")
            {
                lblSucesso.Text = "Cadastrado com Sucesso!";
            }
            FillGridView();
        }

        public void FillGridView()
        {
            var cmd = new SqlCommand();
            var c = cmd.Connection = Conexao.connection;
            var select = cmd.CommandText = "SELECT * FROM funcionarios";
            SqlDataAdapter dataAdapter = new SqlDataAdapter(select, c);

            DataTable dtbl = new DataTable();
            dataAdapter.Fill(dtbl);

            gvFuncionario.DataSource = dtbl;
            gvFuncionario.DataBind();
        }

        protected void lnk_deletar_OnClick(object sender, EventArgs e)
        {
            int id_fun = Convert.ToInt32((sender as LinkButton).CommandArgument);

            var cmd = new SqlCommand();
            var c = cmd.Connection = Conexao.connection;
            var delete = cmd.CommandText = "DELETE FROM funcionarios WHERE id_fun = @id_fun";

            SqlDataAdapter dataAdapter = new SqlDataAdapter(delete, c);
            dataAdapter.SelectCommand.Parameters.AddWithValue("@id_fun", id_fun);
            
            DataTable dtbl = new DataTable();
            dataAdapter.Fill(dtbl);

            gvFuncionario.DataSource = dtbl;
            gvFuncionario.DataBind();

            lblSucesso.Text = "Deletado com Sucesso!";
            FillGridView();
        }
    }
}