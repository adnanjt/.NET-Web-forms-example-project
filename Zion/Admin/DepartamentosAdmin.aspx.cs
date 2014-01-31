using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zion
{
    public partial class DepartamentosAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (GridView1.Rows.Count == 0 || GridView1.SelectedValue == null)
            {
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
            }
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
                DetailsView1.ChangeMode(DetailsViewMode.Insert);
            }
        }

        protected void item_seleccionado(object sender, EventArgs e)
        {
            DetailsView1.ChangeMode(DetailsViewMode.ReadOnly);
        }

        protected void DetailsView1_ItemInserting(object sender, DetailsViewInsertEventArgs e)
        {
            DropDownList ddl = (DropDownList)DetailsView1.FindControl("DropDownList1");

            e.Values.Add("PersonasId", ddl.SelectedValue);
  
        }

        protected void DetailsView1_ItemUpdating(object sender, DetailsViewUpdateEventArgs e)
        {
            DropDownList ddl = (DropDownList)DetailsView1.FindControl("DropDownList1");

            e.NewValues.Add("PersonasId", ddl.SelectedValue);
        }
    }
}