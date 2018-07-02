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
    public partial class Ratings : Form
    {
        string conn = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
        public Ratings()
        {
            InitializeComponent();
        }
        void GridFill()
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("RatingViewAll", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
              //   dgv.Columns[0].Visible = false;
            }
        }

        void Clear()
        {
            txtID.Text = txtDesc.Text = txtSearch.Text = "";

            btnDelete.Enabled = false;
        }

        private void Ratings_Load(object sender, EventArgs e)
        {
            Clear();
            GridFill();
        }
        private void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("RatingDeleteByID", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_RatingID", txtID);
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Deleted Successfully");
                Clear();
                GridFill();
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
        private void dgvBook_DoubleClick(object sender, EventArgs e)
        {
            if (dgv.CurrentRow.Index != -1)
            {
                txtID.Text = dgv.CurrentRow.Cells[0].Value.ToString();
                txtDesc.Text = dgv.CurrentRow.Cells[1].Value.ToString();
               // comboBox.Text = dgv.CurrentRow.Cells[3].Value.ToString();
                // txtLocation.Text = dgv.CurrentRow.Cells[2].Value.ToString();
                //   comboBox.SelectedItem.ToString().Trim() = dgv.CurrentRow.Cells[2].Value.ToString();
                // bookID = Convert.ToInt32(dgv.CurrentRow.Cells[0].Value.ToString());
                btnAdd.Text = "Update";
                btnDelete.Enabled = Enabled;
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("RatingSearch", mysqlCon);
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
                MySqlCommand mySqlCmd = new MySqlCommand("RatingAddOrEdit", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_RatingID", txtID.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_Description", txtDesc.Text.Trim());
               
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Submitted Successfully");
                Clear();
                GridFill();
            }
        }
    }
}
