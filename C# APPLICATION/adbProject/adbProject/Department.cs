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
    public partial class Department : Form
    {
        private string conn = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
        public Department()
        {
            InitializeComponent();
        }
        void GridFill()
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("DepartmentViewAll", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
                dgv.Columns[0].Visible = true;
            }
        }

        void Clear()
        {
            txtID.Text = txtName.Text = comboBox.Text = txtSearch.Text = txtLocation.Text = "";
            // btnAdd.Text = "Save";
            btnDelete.Enabled = false;
        }

        private void Department_Load(object sender, EventArgs e)
        {
            Clear();
            GridFill();
        }
        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("DepartmentAddOrEdit", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_DepartmentID", txtID.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_Name", txtName.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_Location", txtLocation.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_HasLab", comboBox.SelectedItem.ToString().Trim());
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Submitted Successfully");
                Clear();
                GridFill();
            }
        }

        private void txtID_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("DepartmentDeleteByID", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_DepartmentID", txtID);
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
                txtName.Text = dgv.CurrentRow.Cells[1].Value.ToString();
                comboBox.Text = dgv.CurrentRow.Cells[3].Value.ToString();
                txtLocation.Text = dgv.CurrentRow.Cells[2].Value.ToString();
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
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("DepartmentSearByValue", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("_SearchValue", txtSearch.Text);
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
                dgv.Columns[0].Visible = true;
            }
        }
    }
}
