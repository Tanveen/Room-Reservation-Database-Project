using MySql.Data.MySqlClient;
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
    public partial class Reservations : Form
    {
        string conn = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
        public Reservations()
        {
            InitializeComponent();
        }
        void GridFill()
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("ReservationViewAll", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
              //  dgv.Columns[0].Visible = false;
            }
        }

        void Clear()
        {
            txtID.Text =  "";
          
            btnDelete.Enabled = false;
        }

        private void Reservations_Load(object sender, EventArgs e)
        {
            Clear();
            GridFill();
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("ReservationDeleteByID", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_ReservationID", txtID);
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Deleted Successfully");
                Clear();
                GridFill();
            }
        }
        private void dgvBook_DoubleClick(object sender, EventArgs e)
        {
            if (dgv.CurrentRow.Index != -1)
            {
                txtID.Text = dgv.CurrentRow.Cells[0].Value.ToString();
               // txtBuildingName.Text = dgv.CurrentRow.Cells[1].Value.ToString();
                //   comboBox.SelectedItem.ToString().Trim() = dgv.CurrentRow.Cells[2].Value.ToString();
                // bookID = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value.ToString());
               // btnAdd.Text = "Update";
                btnDelete.Enabled = Enabled;
            }
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void btnGoBack_Click(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("ReservationSearchByValue", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("_SearchValue", txtSearch.Text);
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
              //  dgv.Columns[0].Visible = false;
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("ReservationAddOrEdit", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_ResID", txtID.Text.Trim());
               // mySqlCmd.Parameters.AddWithValue("_InDate", txtID.Text.Trim());
                //mySqlCmd.Parameters.AddWithValue("_OutDate", txtID.Text.Trim());
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Submitted Successfully");
                Clear();
                GridFill();
            }
        }

        private void dgv_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
