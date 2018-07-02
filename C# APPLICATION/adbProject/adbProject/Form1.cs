using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.OleDb;
using MySql.Data.MySqlClient;

namespace adbProject
{
    public partial class Form1 : Form
    {
        private string conn;
        private MySqlConnection connect;
        public Form1()
        {
            InitializeComponent();
        }
        private void db_connection()
        {
            try
            {
                conn = "Server=35.196.198.132;Database=RoomReserve1;Uid=root;Pwd=root123;";
                connect = new MySqlConnection(conn);
                connect.Open();
            }
            catch (MySqlException e)
            {
                throw;
            }
        }
        private bool validate_login(string user, string pass)
        {
            db_connection();
            MySqlCommand cmd = new MySqlCommand();
            cmd.CommandText = "Select * from Login where username=@user and password=@pass";
            cmd.Parameters.AddWithValue("@user", user);
            cmd.Parameters.AddWithValue("@pass", pass);
            cmd.Connection = connect;
            MySqlDataReader login = cmd.ExecuteReader();
            if (login.Read())
            {
                connect.Close();
                return true;
            }
            else
            {
                connect.Close();
                return false;
            }
        }
        private void btnSubmit_Click(object sender, EventArgs e)
        {
            string user = txtUsername.Text;
            string pass = txtPassword.Text;
            if (user == "" || pass == "")
            {
                MessageBox.Show("Empty Fields Detected ! Please fill up all the fields");
                return;
            }
            bool r = validate_login(user, pass);
            if (r)
            {
                MessageBox.Show("Correct Login Credentials");
                MessageBox.Show("Connection Successful");
                new Form2().Show();
                this.Hide();
            }
            else
                MessageBox.Show("Incorrect Login Credentials");
        }
    }
}
