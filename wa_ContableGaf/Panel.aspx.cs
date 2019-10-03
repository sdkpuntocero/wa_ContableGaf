using System;
using System.Data;
using System.Linq;
using System.Web.UI.WebControls;

namespace wa_ContableGaf
{
    public partial class Panel : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (!IsPostBack)
                {
                    InfUser();
                }
                else
                {
                    ProcesoReloj();
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
        }

        private void ProcesoReloj()
        {
            DateTime dtFiltro = DateTime.Today.AddDays(-1);
            DateTime dtFCartera = DateTime.Today.AddDays(0);

            lbl_reloj.Text = Global.reloj;

     

            ValidaPreOper();
        }

        private void ValidaPreOper()
        {
            DateTime dtFechaAnt = DateTime.Today.AddDays(-1);
            DateTime dtFechaAct = DateTime.Today.AddDays(0);


            using (DEV_CalcEntities md_fb = new DEV_CalcEntities())
            {
                var dCarteraAnt = (from i_u in md_fb.tblCartera
                                   where i_u.FechaOper == dtFechaAnt
                                   select i_u).ToList();

                if (dCarteraAnt.Count == 0)
                {
                    iPreOper.Attributes["style"] = "color: #bf474e";
                    iCarteraAnt.Attributes["style"] = "color: #bf474e";
                }
                else
                {
                    iPreOper.Attributes["style"] = "color: green";
                    iCarteraAnt.Attributes["style"] = "color: green";

                }

                var dDerEfe = (from i_u in md_fb.tblDE
                               where i_u.FechaOper == dtFechaAct
                               select i_u).ToList();

                if (dDerEfe.Count == 0)
                {
                    iDerEfeAct.Attributes["style"] = "color: #bf474e";
                    iDerEspAct.Attributes["style"] = "color: #bf474e";

                }
                else
                {
                    iDerEfeAct.Attributes["style"] = "color: green";
                    iDerEspAct.Attributes["style"] = "color: green";

                }

                if (dCarteraAnt.Count == 0 && dDerEfe.Count == 0)
                {
                    iPreOper.Attributes["style"] = "color: #bf474e";
                }
                else if (dCarteraAnt.Count != 0 && dDerEfe.Count != 0)
                {
                    iPreOper.Attributes["style"] = "color: green";
                }
                else
                {
                    iPreOper.Attributes["style"] = "color: orange";
                }


                upCarteraAnt.Update();
                upDerEfeAct.Update();
                upDerEspAct.Update();
                upPreOper.Update();
            }
        }

        private void InfUser()
        {
            string NombreUsuarioFirmado, UsuarioLDAP;

            NombreUsuarioFirmado = (string)(Session["s_usuario"]);
            UsuarioLDAP = (string)(Session["UsuarioLDAP"]);

            using (DEV_StagingEntities m_usuario = new DEV_StagingEntities())
            {
                var i_usuario = (from i_CatUsr in m_usuario.tblUsuarios
                                 join i_CatUsrOper in m_usuario.catRelUsuOper on i_CatUsr.ClaveUsuarioID equals i_CatUsrOper.ClaveUsuarioID
                                 join i_CatOper in m_usuario.catOperadoras on i_CatUsrOper.ClaveOperadoraID equals i_CatOper.ClaveOperadoraID
                                 join i_CatUniNeg in m_usuario.catRelUniNegOper on i_CatOper.ClaveOperadoraID equals i_CatUniNeg.ClaveOperadoraID
                                 join i_CatNeg in m_usuario.tblUnidadNegocio on i_CatUniNeg.ClaveUnidadNegocioID equals i_CatNeg.ClaveUnidadNegocioID
                                 where i_CatUsr.Usuario == UsuarioLDAP
                                 select new
                                 {
                                     i_CatUsr.Usuario,
                                     i_CatOper.ClaveOperadora,
                                     i_CatNeg.UnidadNegocio
                                 }).FirstOrDefault();

                lblNombreUsuario.Text = NombreUsuarioFirmado;
                lblUnidadNegocio.Text = i_usuario.UnidadNegocio;
                lblOperadora.Text = i_usuario.ClaveOperadora;


                i_EstatusUsuario.Attributes["style"] = "color: green";
                lbl_EstatusUsuario.Text = "Conectado";
            }
        }

        protected void lkb_NAV_Click(object sender, EventArgs e)
        {
            lblEncabezado.Text = "NAV";

            DateTime dtNAV = DateTime.Today.AddDays(0);

            using (DEV_CalcEntities md_fb = new DEV_CalcEntities())
            {
                var i_f_b = (from i_u in md_fb.fntblNAV(dtNAV, 17)
                             select i_u).ToList();

                if (i_f_b.Count == 0)
                {
                }
                else
                {
                    gvFondos.DataSource = i_f_b;
                    gvFondos.DataBind();
                    gvFondos.Visible = true;
                }
            }

            gvInstrumentos.Visible = false;
            divNAV.Visible = true;
            divCatOperativos.Visible = false;
            UpdatePanel2.Update();
            UpdatePanel4.Update();

        }

        protected void lkb_salir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("acceso.aspx");
        }

        protected void gvFondos_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "btnFondoFiltra")
            {
                //try
                //{
                GridViewRow gvr = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);

                int ClaveFondoID = int.Parse(gvr.Cells[0].Text.ToString().Trim());
                DateTime dtNAV = DateTime.Today.AddDays(0);

                using (DEV_CalcEntities m_usrf = new DEV_CalcEntities())
                {
                    var filtrofondo = (from i_u in m_usrf.fntblNAV(dtNAV, 17)
                                       where i_u.ClaveFondoID == ClaveFondoID
                                       select i_u).ToList();

                    if (filtrofondo.Count == 0)
                    {
                    }
                    else
                    {
                        gvFondos.DataSource = filtrofondo;
                        gvFondos.DataBind();
                        gvFondos.Visible = true;
                    }

                    var filtroInst = (from i_u in m_usrf.fntblNAVInst(dtNAV, ClaveFondoID)
                                      select i_u).ToList();

                    if (filtroInst.Count == 0)
                    {
                        gvInstrumentos.DataSource = filtroInst;
                        gvInstrumentos.DataBind();
                        gvInstrumentos.Visible = true;
                    }
                    else
                    {
                        gvInstrumentos.DataSource = filtroInst;
                        gvInstrumentos.DataBind();
                        gvInstrumentos.Visible = true;
                    }
                }
                //}
                //catch
                //{ }
            }
        }

        protected void lkbNAV_Click(object sender, EventArgs e)
        {
            DateTime dtNAV = DateTime.Today.AddDays(0);

            using (DEV_CalcEntities md_fb = new DEV_CalcEntities())
            {
                var i_f_b = (from i_u in md_fb.fntblNAV(dtNAV, 17)
                             select i_u).ToList();

                if (i_f_b.Count == 0)
                {
                }
                else
                {
                    gvFondos.DataSource = i_f_b;
                    gvFondos.DataBind();
                    gvFondos.Visible = true;
                }
            }

            gvInstrumentos.Visible = false;
            divNAV.Visible = true;
            divCatOperativos.Visible = false;
        }

        protected void gvFondos_Sorting(object sender, GridViewSortEventArgs e)
        {


        }

        protected void lkbCatalogos_Click(object sender, EventArgs e)
        {
            divNAV.Visible = false;
            divCatOperativos.Visible = true;
        }
    }
}