using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace adbProject
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            // do nothing
        }

        private void btnOK_Click(object sender, EventArgs e)
        {
            
            switch(comboBox.SelectedItem.ToString().Trim())
            {
                case "BUILDING":
                    new Building().Show();
                    this.Hide();
                    break;

                case "DEPARTMENT":
                    new Department().Show();
                    this.Hide();
                    break;

                case "EQUIPMENT":
                    new Equipment().Show();
                    this.Hide();
                    break;

                //case "LABORATORY":
                //    new Laboratory().Show();
                //    this.Hide();
                //    break;

                case "RATINGS":
                    new Ratings().Show();
                    this.Hide();
                    break;

                case "LOGIN":
                    MessageBox.Show("YOU HAVE NO ACCESS TO THIS TABLE: SORRY!!");
                    break;

                case "RESERVATION":
                    new Reservations().Show();
                    this.Hide();
                    break;

                case "ROOMS":
                    new Rooms().Show();
                    this.Hide();
                    break;

                //case "STAFF":
                //    new Staff().Show();
                //    this.Hide();
                //    break;

                //case "STUDENT":
                //    new Student().Show();
                //    this.Hide();
                //    break;

                case "USERS":
                    MessageBox.Show("You are not allowed to access this table, Sorry! ");
                    
                    break;

                default:
                    MessageBox.Show("SELECT ANY TABLE TO PROCEED:");
                    break;
            }
            

        }
    }
}
