using System;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web.UI.WebControls;

namespace wa_ContableGaf
{
    public partial class PanelDeControl : System.Web.UI.Page
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
                }
            }
            catch
            {
                Response.Redirect("acceso.aspx");
            }
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
                LinkButton2.Text = "Operadora: " + i_usuario.ClaveOperadora;
                LinkButton3.Text = "Proveedor: " + i_usuario.ClaveProveedor;

                lkb_AC.Attributes["style"] = "color:#CD5C5C";
                lkb_AP.Attributes["style"] = "color:#CD5C5C";
                lkb_PV.Attributes["style"] = "color:#CD5C5C";
                lkb_MD.Attributes["style"] = "color:#CD5C5C";
                lkb_AC.Attributes["style"] = "color:#CD5C5C";
                lkb_TE.Attributes["style"] = "color:#CD5C5C";
                //lkb_76.Attributes["style"] = "color:#CD5C5C";
                //lkb_77.Attributes["style"] = "color:#CD5C5C";
            }
        }

        protected void lkb_MV_Click(object sender, EventArgs e)
        {
            gv_de.Visible = false;
            gv_AC.Visible = false;
            gv_ErrDE.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;

            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.MV_ThroughVAL
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        gv_mv.DataSource = i_f_b;
                        gv_mv.DataBind();
                        gv_mv.Visible = true;

                        lbl_EstatusInsumos.Text = "MV#.txt Sin Datos";
                    }
                    else
                    {
                        gv_mv.DataSource = i_f_b;
                        gv_mv.DataBind();
                        gv_mv.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 16
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.MV_ThroughPIP
                                 select i_u).ToList();
                    if (i_f_b.Count == 0)
                    {
                        gv_mv.DataSource = i_f_b;
                        gv_mv.DataBind();
                        gv_mv.Visible = true;

                        lbl_EstatusInsumos.Text = "MV#.txt Sin Datos";
                    }
                    else
                    {
                        gv_mv.DataSource = i_f_b;
                        gv_mv.DataBind();
                        gv_mv.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 16
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();

            card_usr.Visible = true;
        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {
            i4.Attributes["style"] = "color:#CD5C5C";
            i5.Attributes["style"] = "color:#CD5C5C";
            i6.Attributes["style"] = "color:#CD5C5C";

            
            lbl_reloj.Text = Global.reloj;
            UpdatePanel1.Update();
            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities m_RelacionInsumo = new BD_StagingGAFEntities())
                {
                    var i_SemPreOperC = (from i_u in m_RelacionInsumo.RelacionInsumos
                                         where i_u.EstatusProcedo == 1
                                         where i_u.ClaveOperadoraID == 1
                                         where i_u.EstatusCargaID == 1
                                         select i_u).ToList();

                    var i_SemPreOperE = (from i_u in m_RelacionInsumo.RelacionInsumos
                                         where i_u.EstatusProcedo == 1
                                         where i_u.ClaveOperadoraID == 1
                                         where i_u.EstatusCargaID == 2
                                         select i_u).ToList();

                    if (i_SemPreOperC.Count == 1 && i_SemPreOperE.Count == 0)
                    {
                        i4.Attributes["style"] = "color:#008080";
                    }
                    else if (i_SemPreOperC.Count == 0 && i_SemPreOperE.Count == 0)
                    {
                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                        i4.Attributes["style"] = "color:#CD5C5C";
                    }
                    else
                    {
                        i4.Attributes["style"] = "color:#ffd700";
                    }
                    var i_SemPreOperC2 = (from i_u in m_RelacionInsumo.RelacionInsumos
                                          where i_u.EstatusProcedo == 2
                                          where i_u.ClaveOperadoraID == 1
                                          where i_u.EstatusCargaID == 1
                                          select i_u).ToList();

                    var i_SemPreOperE2 = (from i_u in m_RelacionInsumo.RelacionInsumos
                                          where i_u.EstatusProcedo == 2
                                          where i_u.ClaveOperadoraID == 1
                                          where i_u.EstatusCargaID == 2
                                          select i_u).ToList();

                    if (i_SemPreOperC2.Count == 6 && i_SemPreOperE2.Count == 0)
                    {
                        i5.Attributes["style"] = "color:#008080";
                    }
                    else if (i_SemPreOperC2.Count == 0 && i_SemPreOperE2.Count == 0)
                    {
                        lbl_AC.Text = "AC#.txt";
                        lkb_AC.Attributes["style"] = "color:#CD5C5C";
                        lbl_VectoresArchivos.Text = "#.val";
                        lkb_VectoresArchivos.Attributes["style"] = "color:#CD5C5C";
                        lbl_AP.Text = "AP#.csv";
                        lkb_AP.Attributes["style"] = "color:#CD5C5C";
                        lbl_PV.Text = "PV#.csv";
                        lkb_PV.Attributes["style"] = "color:#CD5C5C";
                        lbl_MD.Text = "MD#.csv";
                        lkb_MD.Attributes["style"] = "color:#CD5C5C";
                        lbl_MV.Text = "MV#.csv";
                        lkb_MV.Attributes["style"] = "color:#CD5C5C";
                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                        i5.Attributes["style"] = "color:#CD5C5C";
                    }
                    else
                    {
                        i5.Attributes["style"] = "color:#ffd700";
                    }
                    up_nav.Update();

                    var i_SemArchivo = (from i_u in m_RelacionInsumo.RelacionInsumos
                                        where i_u.EstatusProcedo == 1
                                        where i_u.ClaveOperadoraID == 1
                                        where i_u.EstatusCargaID >= 1
                                        select i_u).ToList();

                    if (i_SemArchivo.Count != 0)
                    {
                        foreach (var item in i_SemArchivo)
                        {
                            FileInfo fi = new FileInfo(item.RutaArchivo);
                            int InsumoID = int.Parse(item.InsumoID.ToString());
                            int OperadoraID = int.Parse(item.ClaveOperadoraID.ToString());
                            int EstatusCargaID = int.Parse(item.EstatusCargaID.ToString());
                            string NombreArchivo = fi.Name;

                            switch (InsumoID)
                            {


                                case 17:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = fi.Name;
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#008080";
                                    }
                                    else if (EstatusCargaID == 2)
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = fi.Name;
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#ffd700";
                                    }
                                    else
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                default:
                                    Console.WriteLine("Default case");
                                    break;
                            }
                        }
                    }

                    var i_RelInsumo = (from i_u in m_RelacionInsumo.RelacionInsumos
                                       where i_u.EstatusProcedo == 2
                                       where i_u.ClaveOperadoraID == 1
                                       where i_u.EstatusCargaID == 1
                                       select i_u).ToList();
                    lkb_TE.Visible = false;
                    lkb_076.Visible = false;
                    lkb_077.Visible = false;
                    lkb_078.Visible = false;
                    lkb_079.Visible = false;
                    lkb_VIA.Visible = false;
                    lkb_VIASol.Visible = false;

                    if (i_RelInsumo.Count != 0)
                    {
                        foreach (var item in i_RelInsumo)
                        {
                            FileInfo fi = new FileInfo(item.RutaArchivo);
                            int InsumoID = int.Parse(item.InsumoID.ToString());
                            int OperadoraID = int.Parse(item.ClaveOperadoraID.ToString());
                            int EstatusCargaID = int.Parse(item.EstatusCargaID.ToString());
                            string NombreArchivo = fi.Name;

                            switch (InsumoID)
                            {
                                case 1:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_AC.Text = fi.Name;
                                        lkb_AC.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_AC.Text = "AC#.txt";
                                        lkb_AC.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    up_usr.Update();
                                    break;

                                case 2:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_VectoresArchivos.Text = fi.Name;
                                        lkb_VectoresArchivos.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_VectoresArchivos.Text = "#.val";
                                        lkb_VectoresArchivos.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 13:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_AP.Text = fi.Name;
                                        lkb_AP.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_AP.Text = "AP#.csv";
                                        lkb_AP.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 14:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_PV.Text = fi.Name;
                                        lkb_PV.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_PV.Text = "PV#.csv";
                                        lkb_PV.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 15:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_MD.Text = fi.Name;
                                        lkb_MD.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_MD.Text = "MD#.csv";
                                        lkb_MD.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 16:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_MV.Text = fi.Name;
                                        lkb_MV.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_MV.Text = "MV#.csv";
                                        lkb_MV.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;



                                default:
                                    Console.WriteLine("Default case");
                                    break;
                            }
                        }
                    }



                }
            }
            else
            {
                using (BD_StagingGAFEntities m_RelacionInsumo = new BD_StagingGAFEntities())
                {
                    var i_SemPreOperC_ = (from i_u in m_RelacionInsumo.RelacionInsumos
                                          where i_u.EstatusProcedo == 1
                                          where i_u.ClaveOperadoraID == 6
                                          where i_u.EstatusCargaID == 1
                                          select i_u).ToList();

                    var i_SemPreOperE_ = (from i_u in m_RelacionInsumo.RelacionInsumos
                                          where i_u.EstatusProcedo == 1
                                          where i_u.ClaveOperadoraID == 6
                                          where i_u.EstatusCargaID == 2
                                          select i_u).ToList();


                    if (i_SemPreOperC_.Count == 1 && i_SemPreOperE_.Count == 0)
                    {
                        i4.Attributes["style"] = "color:#008080";
                    }
                    else if (i_SemPreOperC_.Count == 0 && i_SemPreOperE_.Count == 0)
                    {
                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                        i4.Attributes["style"] = "color:#CD5C5C";
                    }
                    else
                    {
                        i4.Attributes["style"] = "color:#ffd700";
                    }
                    up_nav.Update();

                    var i_SemPreOperC2_ = (from i_u in m_RelacionInsumo.RelacionInsumos
                                           where i_u.EstatusProcedo == 2
                                           where i_u.ClaveOperadoraID == 6
                                           where i_u.EstatusCargaID == 1
                                           select i_u).ToList();

                    var i_SemPreOperE2_ = (from i_u in m_RelacionInsumo.RelacionInsumos
                                           where i_u.EstatusProcedo == 2
                                           where i_u.ClaveOperadoraID == 6
                                           where i_u.EstatusCargaID == 2
                                           select i_u).ToList();

                    if (i_SemPreOperC2_.Count == 13 && i_SemPreOperE2_.Count == 0)
                    {
                        i5.Attributes["style"] = "color:#008080";
                    }
                    else if (i_SemPreOperC2_.Count == 0 && i_SemPreOperE2_.Count == 0)
                    {
                        lbl_AC.Text = "AC#.txt";
                        lkb_AC.Attributes["style"] = "color:#CD5C5C";
                        lbl_VectoresArchivos.Text = "#.val";
                        lkb_VectoresArchivos.Attributes["style"] = "color:#CD5C5C";
                        lbl_AP.Text = "AP#.csv";
                        lkb_AP.Attributes["style"] = "color:#CD5C5C";
                        lbl_PV.Text = "PV#.csv";
                        lkb_PV.Attributes["style"] = "color:#CD5C5C";
                        lbl_MD.Text = "MD#.csv";
                        lkb_MD.Attributes["style"] = "color:#CD5C5C";
                        lbl_MV.Text = "MV#.csv";
                        lkb_MV.Attributes["style"] = "color:#CD5C5C";
                        lbl_076.Text = "#.076";
                        lkb_076.Attributes["style"] = "color:#CD5C5C";
                        lbl_077.Text = "#.077";
                        lkb_077.Attributes["style"] = "color:#CD5C5C";
                        lbl_078.Text = "#.078";
                        lkb_078.Attributes["style"] = "color:#CD5C5C";
                        lbl_079.Text = "#.079";
                        lkb_079.Attributes["style"] = "color:#CD5C5C";

                        lbl_TE.Text = "TE#.csv";
                        lkb_TE.Attributes["style"] = "color:#CD5C5C";
                        lbl_VIA.Text = "VIA#.csv";
                        lkb_VIA.Attributes["style"] = "color:#CD5C5C";
                        lbl_VIASol.Text = "VIA#_SOL.csv";
                        lkb_VIASol.Attributes["style"] = "color:#CD5C5C";
                        i5.Attributes["style"] = "color:#CD5C5C";
                    }
                    else
                    {
                        i5.Attributes["style"] = "color:#ffd700";
                    }
                    up_nav.Update();

                    var i_SemArchivo = (from i_u in m_RelacionInsumo.RelacionInsumos
                                        where i_u.EstatusProcedo == 1
                                        where i_u.ClaveOperadoraID == 6
                                        where i_u.EstatusCargaID >= 1
                                        select i_u).ToList();

                    if (i_SemArchivo.Count != 0)
                    {
                        foreach (var item in i_SemArchivo)
                        {
                            FileInfo fi = new FileInfo(item.RutaArchivo);
                            int InsumoID = int.Parse(item.InsumoID.ToString());
                            int OperadoraID = int.Parse(item.ClaveOperadoraID.ToString());
                            int EstatusCargaID = int.Parse(item.EstatusCargaID.ToString());
                            string NombreArchivo = fi.Name;

                            switch (InsumoID)
                            {


                                case 17:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = fi.Name;
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#008080";
                                    }
                                    else if (EstatusCargaID == 2)
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = fi.Name;
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#ffd700";
                                    }
                                    else
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                default:
                                    Console.WriteLine("Default case");
                                    break;
                            }
                        }
                    }
                    var i_SemArchivo_ = (from i_u in m_RelacionInsumo.RelacionInsumos
                                         where i_u.EstatusProcedo == 2
                                         where i_u.ClaveOperadoraID == 6
                                         where i_u.EstatusCargaID >= 1
                                         select i_u).ToList();


                    if (i_SemArchivo_.Count != 0)
                    {
                        foreach (var item in i_SemArchivo_)
                        {
                            FileInfo fi = new FileInfo(item.RutaArchivo);
                            int InsumoID = int.Parse(item.InsumoID.ToString());
                            int OperadoraID = int.Parse(item.ClaveOperadoraID.ToString());
                            int EstatusCargaID = int.Parse(item.EstatusCargaID.ToString());
                            string NombreArchivo = fi.Name;

                            switch (InsumoID)
                            {


                                case 1:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_AC.Text = fi.Name;
                                        lkb_AC.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_AC.Text = "AC#.txt";
                                        lkb_AC.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    up_usr.Update();
                                    break;

                                case 3:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_VectoresArchivos.Text = fi.Name;
                                        lkb_VectoresArchivos.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_VectoresArchivos.Text = "#.pip";
                                        lkb_VectoresArchivos.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 5:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_076.Text = fi.Name;
                                        lkb_076.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_076.Text = "#.076";
                                        lkb_076.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 6:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_077.Text = fi.Name;
                                        lkb_077.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_077.Text = "#.077";
                                        lkb_077.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 7:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_078.Text = fi.Name;
                                        lkb_078.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_078.Text = "#.078";
                                        lkb_078.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 8:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_079.Text = fi.Name;
                                        lkb_079.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_079.Text = "#.079";
                                        lkb_079.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 9:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_TE.Text = fi.Name;
                                        lkb_TE.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_TE.Text = "TE#.csv";
                                        lkb_TE.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 11:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_VIA.Text = fi.Name;
                                        lkb_VIA.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_VIA.Text = "VIA#.csv";
                                        lkb_VIA.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 12:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_VIASol.Text = fi.Name;
                                        lkb_VIASol.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_VIASol.Text = "VIA#_SOL.csv";
                                        lkb_VIASol.Attributes["style"] = "color:#CD5C5C";
                                    }
                                    break;

                                case 13:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_AP.Text = fi.Name;
                                        lkb_AP.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_AP.Text = "AP#.csv";
                                        lkb_AP.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 14:

                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_PV.Text = fi.Name;
                                        lkb_PV.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_PV.Text = "PV#.csv";
                                        lkb_PV.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 15:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_MD.Text = fi.Name;
                                        lkb_MD.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_MD.Text = "MD#.csv";
                                        lkb_MD.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 16:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_MV.Text = fi.Name;
                                        lkb_MV.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_MV.Text = "MV#.csv";
                                        lkb_MV.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                case 17:
                                    if (EstatusCargaID == 1)
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = fi.Name;
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#008080";
                                    }
                                    else
                                    {
                                        lbl_DerechosDecretadosArchivos.Text = "DE#.csv";
                                        lkb_DerechosDecretadosArchivos.Attributes["style"] = "color:#CD5C5C";
                                    }

                                    break;

                                default:
                                    Console.WriteLine("Default case");
                                    break;
                            }
                        }
                    }
                }
            }
        }

        protected void lkb_DerechosDecretadosArchivos_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
            {


                if (LinkButton2.Text == "Operadora: ACTINVER")
                {

                    var DE_f = (from i_u in md_fb.RelacionInsumos
                                where i_u.EstatusProcedo == 1
                                where i_u.ClaveOperadoraID == 1
                                where i_u.InsumoID == 17
                                select i_u).ToList();

                    if (DE_f.Count == 0)
                    {
                        gv_de.DataSource = DE_f;
                        gv_de.DataBind();
                        gv_de.Visible = true;

                        lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                    }
                    else
                    {
                        if (DE_f[0].EstatusCargaID == 1)
                        {
                            var i_f_b = (from i_u in md_fb.DE_ThroughVAL
                                         select i_u).OrderBy(x => x.DEThroughID).ToList();

                            if (i_f_b.Count == 0)
                            {
                                gv_de.DataSource = i_f_b;
                                gv_de.DataBind();
                                gv_de.Visible = true;

                                lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                            }
                            else
                            {
                                gv_de.DataSource = i_f_b;
                                gv_de.DataBind();
                                gv_de.Visible = true;

                                var f_lbl = (from i_u in md_fb.RelacionInsumos
                                             where i_u.InsumoID == 17
                                             select i_u).First();

                                FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                                lbl_EstatusInsumos.Text = fi.Name;
                            }
                        }
                        else
                        {
                            var i_f_b = (from i_u in md_fb.TablaErrDE_VAL
                                         select i_u).OrderBy(x => x.DEThroughID).ToList();

                            if (i_f_b.Count == 0)
                            {
                                gv_ErrDE.DataSource = i_f_b;
                                gv_ErrDE.DataBind();
                                gv_ErrDE.Visible = true;

                                lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                            }
                            else
                            {
                                gv_ErrDE.DataSource = i_f_b;
                                gv_ErrDE.DataBind();
                                gv_ErrDE.Visible = true;

                                var f_lbl = (from i_u in md_fb.RelacionInsumos
                                             where i_u.InsumoID == 17
                                             select i_u).First();

                                FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                                lbl_EstatusInsumos.Text = fi.Name + ": contiene " + i_f_b.Count.ToString() + " Registros con Errores";
                            }

                        }

                    }
                }
                else
                {
                    var DE_f = (from i_u in md_fb.RelacionInsumos
                                where i_u.EstatusProcedo == 1
                                where i_u.ClaveOperadoraID == 6
                                where i_u.InsumoID == 17
                                select i_u).ToList();

                    if (DE_f.Count == 0)
                    {
                        gv_de.DataSource = DE_f;
                        gv_de.DataBind();
                        gv_de.Visible = true;

                        lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                    }
                    else
                    {
                        if (DE_f[0].EstatusCargaID == 1)
                        {
                            var i_f_b = (from i_u in md_fb.DE_ThroughPIP
                                         select i_u).OrderBy(x => x.DEThroughID).ToList();

                            if (i_f_b.Count == 0)
                            {
                                gv_de.DataSource = i_f_b;
                                gv_de.DataBind();
                                gv_de.Visible = true;

                                lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                            }
                            else
                            {
                                gv_de.DataSource = i_f_b;
                                gv_de.DataBind();
                                gv_de.Visible = true;

                                var f_lbl = (from i_u in md_fb.RelacionInsumos
                                             where i_u.InsumoID == 17
                                             select i_u).First();

                                FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                                lbl_EstatusInsumos.Text = fi.Name;
                            }
                        }
                        else
                        {
                            var i_f_b = (from i_u in md_fb.TablaErrDE_PIP
                                         select i_u).OrderBy(x => x.DEThroughID).ToList();

                            if (i_f_b.Count == 0)
                            {
                                gv_ErrDE.DataSource = i_f_b;
                                gv_ErrDE.DataBind();
                                gv_ErrDE.Visible = true;

                                lbl_EstatusInsumos.Text = "DE#.csv Sin Datos";
                            }
                            else
                            {
                                gv_ErrDE.DataSource = i_f_b;
                                gv_ErrDE.DataBind();
                                gv_ErrDE.Visible = true;

                                var f_lbl = (from i_u in md_fb.RelacionInsumos
                                             where i_u.InsumoID == 17
                                             select i_u).First();

                                FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                                lbl_EstatusInsumos.Text = fi.Name + ": contiene " + i_f_b.Count.ToString() + " Registros con Errores";
                            }

                        }

                    }

                }





            }

            up_usr.Update();

            card_usr.Visible = true;
        }

        protected void lkb_AP_Click(object sender, EventArgs e)
        {
            gv_de.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaAP_VAL
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "AP#.txt Sin Datos";
                    }
                    else
                    {
                        gv_AP.DataSource = i_f_b;
                        gv_AP.DataBind();
                        gv_AP.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 13
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaAP_PIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "AP#.txt Sin Datos";
                    }
                    else
                    {
                        gv_AP.DataSource = i_f_b;
                        gv_AP.DataBind();
                        gv_AP.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 13
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_PV_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_de.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.PV_ThroughVAL
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "PV#.txt Sin Datos";
                    }
                    else
                    {
                        gv_PV.DataSource = i_f_b;
                        gv_PV.DataBind();
                        gv_PV.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 14
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.PV_ThroughPIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "PV#.txt Sin Datos";
                    }
                    else
                    {
                        gv_PV.DataSource = i_f_b;
                        gv_PV.DataBind();
                        gv_PV.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 14
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_MD_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_de.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaMD_VAL  
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "MD#.txt Sin Datos";
                    }
                    else
                    {
                        gv_md.DataSource = i_f_b;
                        gv_md.DataBind();
                        gv_md.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 15
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaMD_PIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "MD#.txt Sin Datos";
                    }
                    else
                    {
                        gv_md.DataSource = i_f_b;
                        gv_md.DataBind();
                        gv_md.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 15
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_TE_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_de.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.TE_ThroughPIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "TE#.txt Sin Datos";
                    }
                    else
                    {
                        gv_TE.DataSource = i_f_b;
                        gv_TE.DataBind();
                        gv_TE.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 9
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_AC_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_de.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.AC_ThroughVAL
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "AC#.txt Sin Datos";
                    }
                    else
                    {
                        gv_AC.DataSource = i_f_b;
                        gv_AC.DataBind();
                        gv_AC.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 1
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.AC_ThroughPIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "AC#.txt Sin Datos";
                    }
                    else
                    {
                        gv_AC.DataSource = i_f_b;
                        gv_AC.DataBind();
                        gv_AC.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 1
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_76_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_de.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.Vista_076
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "076#.txt Sin Datos";
                    }
                    else
                    {
                        gv_076.DataSource = i_f_b;
                        gv_076.DataBind();
                        gv_076.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 5
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_77_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_de.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.Vista_077
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "077#.txt Sin Datos";
                    }
                    else
                    {
                        gv_077.DataSource = i_f_b;
                        gv_077.DataBind();
                        gv_077.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 6
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_78_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_de.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.Vista_078
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "087#.txt Sin Datos";
                    }
                    else
                    {
                        gv_078.DataSource = i_f_b;
                        gv_078.DataBind();
                        gv_078.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 7
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_79_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_de.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.C079_Through
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "078#.txt Sin Datos";
                    }
                    else
                    {
                        gv_079.DataSource = i_f_b;
                        gv_079.DataBind();
                        gv_079.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 8
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_PreOperativos_Click(object sender, EventArgs e)
        {
            lkb_PreOperativos.Attributes["style"] = "color:#CD5C5C";
            lkb_Operativos.Attributes["style"] = "color:#fff";
            lkb_PosOperativos.Attributes["style"] = "color:#fff";
            card_usr.Visible = false;
            up_usr.Update();
            upPreOperativos.Update();
            div_preoperativos.Visible = true;
            div_operativos.Visible = false;
            div_postoperativos.Visible = false;
        }

        protected void lkb_Operativos_Click(object sender, EventArgs e)
        {
            lkb_PreOperativos.Attributes["style"] = "color:#fff";
            lkb_Operativos.Attributes["style"] = "color:#CD5C5C";
            lkb_PosOperativos.Attributes["style"] = "color:#fff";
            card_usr.Visible = false;
            up_usr.Update();
            upPreOperativos.Update();
            div_preoperativos.Visible = false;
            div_operativos.Visible = true;
            div_postoperativos.Visible = false;
        }

        protected void lkb_PosOperativos_Click(object sender, EventArgs e)
        {
            lkb_PreOperativos.Attributes["style"] = "color:#fff";
            lkb_Operativos.Attributes["style"] = "color:#fff";
            lkb_PosOperativos.Attributes["style"] = "color:#CD5C5C";
            card_usr.Visible = false;
            up_usr.Update();
            upPreOperativos.Update();
            div_preoperativos.Visible = false;
            div_operativos.Visible = false;
            div_postoperativos.Visible = true;
        }

        protected void lkb_salir_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("acceso.aspx");
        }

        protected void lkb_VIA_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_de.Visible = false;
            gv_viasol.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VIA_Through
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "VIA#.txt Sin Datos";
                    }
                    else
                    {
                        gv_via.DataSource = i_f_b;
                        gv_via.DataBind();
                        gv_via.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 11
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_VIASol_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_de.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VIA_SOL_Through
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "VIA#_SOL.txt Sin Datos";
                    }
                    else
                    {
                        gv_viasol.DataSource = i_f_b;
                        gv_viasol.DataBind();
                        gv_viasol.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 12
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void lkb_VectoresArchivos_Click(object sender, EventArgs e)
        {
            gv_AP.Visible = false;
            gv_AC.Visible = false;
            gv_mv.Visible = false;
            gv_PV.Visible = false;
            gv_md.Visible = false;
            gv_pip.Visible = false;
            gv_076.Visible = false;
            gv_077.Visible = false;
            gv_078.Visible = false;
            gv_079.Visible = false;
            gv_TE.Visible = false;
            gv_val.Visible = false;
            gv_via.Visible = false;
            gv_de.Visible = false;
            gv_ErrDE.Visible = false;

            if (LinkButton2.Text == "Operadora: INBURSA")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaPIP
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "#.PIP Sin Datos";
                    }
                    else
                    {
                        gv_pip.DataSource = i_f_b;
                        gv_pip.DataBind();
                        gv_pip.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 3
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }
            else if (LinkButton2.Text == "Operadora: ACTINVER")
            {
                using (BD_StagingGAFEntities md_fb = new BD_StagingGAFEntities())
                {
                    var i_f_b = (from i_u in md_fb.VistaVal
                                 select i_u).ToList();

                    if (i_f_b.Count == 0)
                    {
                        lbl_EstatusInsumos.Text = "#.PIP Sin Datos";
                    }
                    else
                    {
                        gv_val.DataSource = i_f_b;
                        gv_val.DataBind();
                        gv_val.Visible = true;

                        var f_lbl = (from i_u in md_fb.RelacionInsumos
                                     where i_u.InsumoID == 2
                                     select i_u).First();

                        FileInfo fi = new FileInfo(f_lbl.RutaArchivo);
                        lbl_EstatusInsumos.Text = fi.Name;
                    }
                }
            }

            up_usr.Update();
            card_usr.Visible = true;
        }

        protected void gv_ErrDE_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            try

            {
                string PaisTrans = e.Row.Cells[5].Text;
                string MonedaTrans = e.Row.Cells[7].Text;
                string Pactado = e.Row.Cells[11].Text;
                string TipoDividendo = e.Row.Cells[13].Text;
                string IsrMonId = e.Row.Cells[16].Text;
                string IsrPactId = e.Row.Cells[19].Text;
                string IsrMonPro = e.Row.Cells[23].Text;
                string IsrPactPr = e.Row.Cells[26].Text;

                string ValidaPaisTrans = e.Row.Cells[6].Text;
                string ValidaMonedaTrans = e.Row.Cells[8].Text;
                string ValidaPactado = e.Row.Cells[12].Text;
                string ValidaTipoDividendo = e.Row.Cells[14].Text;
                string ValidaIsrMonId = e.Row.Cells[17].Text;
                string ValidaIsrPactId = e.Row.Cells[20].Text;
                string ValidaIsrMonPro = e.Row.Cells[24].Text;
                string ValidaIsrPactPr = e.Row.Cells[27].Text;

                if (e.Row.RowType == DataControlRowType.Header)
                {
                   
                }
                else
                {
                    if (PaisTrans == ValidaPaisTrans)
                    {

                        e.Row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");
                        
                    }
                    else
                    {
                        e.Row.Cells[6].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }
                    if (MonedaTrans == ValidaMonedaTrans)
                    {

                        e.Row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[8].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }

                    if (Pactado == ValidaPactado)
                    {

                        e.Row.Cells[12].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[12].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }

                    if (TipoDividendo == ValidaTipoDividendo)
                    {

                        e.Row.Cells[14].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[14].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }

                    if (IsrMonId == ValidaIsrMonId)
                    {

                        e.Row.Cells[17].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[17].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }
                    if (IsrPactId == ValidaIsrPactId)
                    {

                        e.Row.Cells[20].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[20].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }
                    if (IsrMonPro == ValidaIsrMonPro)
                    {

                        e.Row.Cells[24].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[24].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }
                    if (IsrPactPr == ValidaIsrPactPr)
                    {

                        e.Row.Cells[27].BackColor = System.Drawing.ColorTranslator.FromHtml("#c6ead4");

                    }
                    else
                    {
                        e.Row.Cells[27].BackColor = System.Drawing.ColorTranslator.FromHtml("#d97875");
                    }
                }

            }
            catch
            { }
        }
    }
}