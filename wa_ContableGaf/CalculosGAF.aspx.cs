using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wa_ContableGaf
{
    public partial class CalculosGAF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //try
            //{
            //if (!IsPostBack)
            //{
            //    InfUser();
            //}
            //else
            {
            }
            //}
            //catch
            //{
            //    Response.Redirect("acceso.aspx");
            //}
        }
        private void InfUser()
        {
            string NombreUsuarioFirmado, UsuarioLDAP;

            NombreUsuarioFirmado = (string)(Session["s_usuario"]);
            UsuarioLDAP = (string)(Session["UsuarioLDAP"]);

            using (BD_StagingGAFEntities m_usuario = new BD_StagingGAFEntities())
            {
                var i_usuario = (from i_CatUsr in m_usuario.CatalogoUsuario
                                 join i_CatOper in m_usuario.CatalogoOperadora on i_CatUsr.ClaveOperadoraID equals i_CatOper.ClaveOperadoraID
                                 join i_CatProv in m_usuario.CatalogoProveedor on i_CatUsr.ClaveProveedorID equals i_CatProv.ClaveProveedorID
                                 where i_CatUsr.Usuario == UsuarioLDAP
                                 select new
                                 {
                                     i_CatUsr.UsuarioID,
                                     i_CatOper.ClaveOperadora,
                                     i_CatProv.ClaveProveedor
                                 }).FirstOrDefault();

                LinkButton1.Text = "Usuario: " + NombreUsuarioFirmado;
                //LinkButton2.Text = "Operadora: " + i_usuario.ClaveOperadora;
                //LinkButton3.Text = "Proveedor: " + i_usuario.ClaveProveedor;
                ddlArea.Items.Clear();
                ddlOperadora.Items.Clear();
                ddlFondos.Items.Clear();
                ddlSeries.Items.Clear();
                using (DB_TestNAVEntities m_est = new DB_TestNAVEntities())
                {

                    //var tbl_areas = (from c in m_est
                    //                   select c).ToList();

                    var tbl_fondos = (from c in m_est.catFondos
                                       select c).ToList();

                    ddlFondos.DataSource = tbl_fondos;

                    ddlFondos.DataTextField = "ClaveFondo";
                    ddlFondos.DataValueField = "ClaveFondo";
                    ddlFondos.DataBind();
                    ddlFondos.Items.Insert(0, new ListItem("Fondo", "0"));
                    ddlSeries.Items.Insert(0, new ListItem("Serie", "0"));

                }



            }
        }

        protected void lkb_salir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("acceso.aspx");
        }

        protected void ddlFondos_SelectedIndexChanged(object sender, EventArgs e)
        {
            string filtro = ddlFondos.SelectedValue;
            ddlSeries.Items.Clear();
            using (DB_TestNAVEntities m_est = new DB_TestNAVEntities())
            {


                var tbl_sepomex = (from c in m_est.catFondoSeries
                                   where c.ClaveFondo == filtro
                                   select c).ToList();

                ddlSeries.DataSource = tbl_sepomex;

                ddlSeries.DataTextField = "ClaveSerie";
                ddlSeries.DataValueField = "ClaveSerie";
                ddlSeries.DataBind();

                ddlSeries.Items.Insert(0, new ListItem("Serie", "0"));

                DateTime dtFechaOperacionT = DateTime.Parse("2019-05-27");
                DateTime dtFechaOperacionT_1 = DateTime.Parse("2019-05-24");

                //var i_RelacionInsumoVAL = (from i_u in m_est.clcNAV_v01(dtFechaOperacionT, dtFechaOperacionT_1)

                //                           select i_u).ToList();

                //foreach (var item in i_RelacionInsumoVAL)
                //{
                //    string st_ValorMercado = string.Format("{0:C2}", decimal.Parse(i_RelacionInsumoVAL[0].ValorCarteraMTM.ToString()));
                //    lblValorMercado.Text = st_ValorMercado;
                //    string st_ValorRazonable = string.Format("{0:C2}", decimal.Parse(i_RelacionInsumoVAL[0].ValorRazonableMTM.ToString()));
                //    lblValorRazonable.Text = st_ValorRazonable;
                //    string st_Intereses = string.Format("{0:C2}", decimal.Parse(i_RelacionInsumoVAL[0].InteresesMTM.ToString()));
                //    lblIntereses.Text = st_Intereses;

                //}

            }

        }

        protected void ddlArea_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void ddlOperadora_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}