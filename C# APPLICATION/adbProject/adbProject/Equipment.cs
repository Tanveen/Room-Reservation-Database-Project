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
    public partial class Equipment : Form
    {
        private string conn = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
        public Equipment()
        {
            InitializeComponent();
        }
        void GridFill()
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EquipmentViewAll", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
              //  dgv.Columns[0].Visible = false;
            }
        }

        void Clear()
        {
            txtID.Text = txtType.Text = txtSearch.Text =  "";
            
            btnDelete.Enabled = false;
        }

        private void Equipment_Load(object sender, EventArgs e)
        {
            Clear();
            GridFill();
        }
        private void btnGoBack_Click(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        private void btnCancel_Click(object sender, EventArgs e)
        {
            Clear();
        }

        private void dgvBook_DoubleClick(object sender, EventArgs e)
        {
            if (dgv.CurrentRow.Index != -1)
            {
                txtID.Text = dgv.CurrentRow.Cells[0].Value.ToString();
                txtType.Text = dgv.CurrentRow.Cells[1].Value.ToString();
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
                MySqlDataAdapter sqlDa = new MySqlDataAdapter("EquipmentSearch", mysqlCon);
                sqlDa.SelectCommand.CommandType = CommandType.StoredProcedure;
                sqlDa.SelectCommand.Parameters.AddWithValue("_SearchValue", txtSearch.Text);
                DataTable dtblBook = new DataTable();
                sqlDa.Fill(dtblBook);
                dgv.DataSource = dtblBook;
              //   dgv.Columns[0].Visible = false;
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("EquipmentDeleteByID", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_ID", txtID);
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Deleted Successfully");
                Clear();
                GridFill();
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (MySqlConnection mysqlCon = new MySqlConnection(conn))
            {
                mysqlCon.Open();
                MySqlCommand mySqlCmd = new MySqlCommand("EquipmentAddorEdit", mysqlCon);
                mySqlCmd.CommandType = CommandType.StoredProcedure;
                mySqlCmd.Parameters.AddWithValue("_ID", txtID.Text.Trim());
                mySqlCmd.Parameters.AddWithValue("_Type", txtType.Text.Trim());
             
                mySqlCmd.ExecuteNonQuery();
                MessageBox.Show("Submitted Successfully");
                Clear();
                GridFill();
            }
        }
    }
}
