using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace wa_ContableGaf
{
    public partial class TestGAF : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

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

        }

        protected void Timer1_Tick(object sender, EventArgs e)
        {

        }
    }
}