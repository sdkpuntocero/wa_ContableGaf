using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.DirectoryServices;
using System.DirectoryServices.AccountManagement;

namespace wa_ContableGaf
{
    public partial class Acceso : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_acceso_Click(object sender, EventArgs e)
        {
            string dominio, user, pass;

            dominio = "gaf.local";
            user = Request.Form["i_usuario"];
            pass = Request.Form["i_clave"];

            if (UsuarioAD(user, pass, dominio) == true)
            {
                using (var context = new PrincipalContext(ContextType.Domain, dominio, user, pass))
                {
                    using (var searcher = new PrincipalSearcher(new UserPrincipal(context)))
                    {
                        foreach (var result in searcher.FindAll())
                        {
                            DirectoryEntry de = result.GetUnderlyingObject() as DirectoryEntry;
                            if ((string)de.Properties["SamAccountName"].Value == user)
                            {
                                string nameAD = de.Properties["givenName"].Value.ToString();
                                string displayAD = de.Properties["displayName"].Value.ToString();

                                Session["s_usuario"] = displayAD;
                                Session["UsuarioLDAP"] = user;

                                Response.Redirect("Panel.aspx");
                                PropertyCollection pc = de.Properties;
                                foreach (PropertyValueCollection col in pc)
                                {
                                }
                            }
                        }
                    }
                }
            }
            else
            {
                Mensaje("Error al Autenticar");
            }
        }

        private bool UsuarioAD(string user, string pass, string dominio)
        {
            PrincipalContext ValidarLAC = new PrincipalContext(ContextType.Domain, dominio);

            return ValidarLAC.ValidateCredentials(user, pass);
        }

        private void Mensaje(string contenido)
        {
            lblModalTitle.Text = "GAF";
            lblModalBody.Text = contenido;
            ScriptManager.RegisterStartupScript(Page, Page.GetType(), "myModal", "$('#myModal').modal();", true);
            upModal.Update();
        }
    }
}