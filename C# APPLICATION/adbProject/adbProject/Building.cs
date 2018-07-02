using MySql.Data.MySqlClient;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;


namespace adbProject
{
    public partial class Building : Form
    {
        string connectionStr = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
       // int ID = 0;
        public Building()
        {
            InitializeComponent();
            
        }
        
        private void Form1_Load(object sender, EventArgs e)
        {
            ClearData();         
        }
        private void ClearData()
        {
            txtBuildingName.Text = "";
            //txtID.Text = "";
           // ID = 0;
            // txtBuildingID.Text = "";
            comboBox.Text = "";
           // btnInsert.Text = "Save";
           // btnDelete.Enabled = false;
        }
        
        private void btnGoBack_Click(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        
        private void btnCancel_Click(object sender, EventArgs e)
        {
            ClearData();
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            
        }

        private void txtBuildingName_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnAdd_Click_1(object sender, EventArgs e)
        {
            insertData();
        }

        private void insertData()
        {
            string query = "insert into Building(name,hasDep) values ('" + txtBuildingName.Text + "',' " + comboBox.SelectedItem.ToString() + " ') ";
            try
            {
                MySqlConnection conn = new MySqlConnection(connectionStr);
                conn.Open();
                MySqlCommand cmd = new MySqlCommand(query, conn);
                cmd.ExecuteNonQuery();
                conn.Close();

            }  
            catch(Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnGoBack_Click_1(object sender, EventArgs e)
        {
            new Form2().Show();
            this.Hide();
        }

        private void btnDelete_Click_1(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(connectionStr);
            MySqlCommand com = new MySqlCommand();
            if(dgv.Rows.Count > 1 && dgv.SelectedRows[0].Index != dgv.Rows.Count - 1)
            {
                com.CommandText = "Delete from Building where Id=" + dgv.SelectedRows[0].Cells[0].Value.ToString() + "" ;
                con.Open();
                com.Connection = con;
                com.ExecuteNonQuery();
                con.Close();
                dgv.Rows.RemoveAt(dgv.SelectedRows[0].Index);
                MessageBox.Show("Record Successfully Deleted");

            }
            loadData();
        }

        private void btnShow_Click(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            string sql = "Select * from Building;";
            MySqlConnection conn = new MySqlConnection("Server = 35.196.198.132; Database = RoomReserve1; Uid = root; Pwd = root123; ");
            MySqlDataAdapter adp = new MySqlDataAdapter(sql, conn);
            DataSet dt = new DataSet();
            conn.Open();
            adp.Fill(dt, "Building");
            conn.Close();
            dgv.DataSource = dt;
            dgv.DataMember = "Building";
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            MySqlConnection con = new MySqlConnection(connectionStr);
            con.Open();
            string str = "Update Building set name = ' " +txtBuildingName.Text + "' , hasDep = ' " +comboBox.SelectedItem.ToString() +
                "' where Id = " + dgv.SelectedRows[0].Cells[0].Value.ToString() + "";
            MySqlCommand com = new MySqlCommand(str, con);
            com.ExecuteNonQuery();
            MessageBox.Show("Record Successfully Updated");
            con.Close();
            loadData();
            ClearData(); 
        }
    }
}

