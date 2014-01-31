using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zion
{
    public partial class Departamentos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0 || GridView1.SelectedValue == null)
            {
                
            }
        }

        protected override void InitializeCulture()
        {
            if (Request.Form["ctl00$ListBox1"] != null)
            {
                String selectedLanguage = Request.Form["ctl00$ListBox1"];
                UICulture = selectedLanguage;
                Culture = selectedLanguage;

                Thread.CurrentThread.CurrentCulture =
                    CultureInfo.CreateSpecificCulture(selectedLanguage);
                Thread.CurrentThread.CurrentUICulture = new
                    CultureInfo(selectedLanguage);
            }
            base.InitializeCulture();
        }

        protected void cliente_insertado(object sender, DetailsViewInsertedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void cliente_updated(object sender, DetailsViewUpdatedEventArgs e)
        {
            GridView1.DataBind();
        }

        protected void cliente_borrado(object sender, DetailsViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            if (GridView1.Rows.Count == 0 || GridView1.SelectedValue == null)
            {
                
            }
        }

        protected void item_seleccionado(object sender, EventArgs e)
        {
            
        }
    }
}