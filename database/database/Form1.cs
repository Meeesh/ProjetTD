using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Windows.Forms;
using System.Windows.Forms.DataVisualization.Charting;

namespace database
{
    public partial class Form1 : Form
    {
        /*********************************************************************************
         * 
         * FONCTION BASE DE DONNEE
         * 
        *********************************************************************************/

            /*************
             * CONNECTION
            *************/
        public String temp;

        String reqConnect = @"Data Source=(LocalDB)\v11.0;AttachDbFilename=C:\Users\jerome\Desktop\database\database\temp.mdf;Integrated Security=True";
        String reqSQL = "";

        public SqlConnection OuvrirConnection() {
            try
            {
                using (SqlConnection connection = new SqlConnection(reqConnect))
                {
                    connection.Open();
                    return connection;
                }
            }
            catch (SqlException ex1) { MessageBox.Show("Erreur de connexion à la BDD" + ex1); return null; }
            catch (InvalidOperationException ex2) { MessageBox.Show("Erreur de connexion à la BDD" + ex2); return null; }
            catch (ArgumentException ex3) { MessageBox.Show("Erreur de connexion à la BDD" + ex3); return null; }
        }
            /*************
            * ECRITURE
            *************/

        public void WriteOrderData(string reqSQL)
        {
            try
            {
                System.Data.SqlClient.SqlConnection sqlConnection =
                        new System.Data.SqlClient.SqlConnection(reqConnect);

                System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand();
                cmd.CommandType = System.Data.CommandType.Text;
                cmd.CommandText = reqSQL;
                cmd.Connection = sqlConnection;

                sqlConnection.Open();
                cmd.ExecuteNonQuery();
                sqlConnection.Close();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Erreur : Veuillez remplir correctement les cases\n\nAge en int\n\nLe reste en string\n\n" + ex);
            }
        }

            /*************
            * LECTURE
            *************/

        public float ReadOrderData(string reqSQL)
        {
            float donnee;
            SqlConnection sqlConnection = new SqlConnection(reqConnect);
            SqlCommand cmd = new SqlCommand();

            cmd.CommandText = reqSQL;
            cmd.CommandType = CommandType.Text;
            cmd.Connection = sqlConnection;

            sqlConnection.Open();
            donnee = (float)cmd.ExecuteScalar();
            sqlConnection.Close();

            return donnee;
        }

        public string ReadOrderDataMax()
        {
            string result = "";
            using (SqlConnection connection = new SqlConnection(reqConnect))
            {
                SqlCommand command = new SqlCommand("SELECT Id+1 FROM [dbo].[Table] WHERE ID=(SELECT MAX(ID) FROM [dbo].[Table]);", connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();
                try
                {
                    while (reader.Read())
                    {
                        result += String.Format("{0}", reader[0]);
                    }
                    return result;

                }
                catch (IndexOutOfRangeException ex1) { MessageBox.Show("Erreur de reader[i]\n\n" + ex1); return null; }
                catch (FormatException ex1) { MessageBox.Show("Erreur de format\n\n" + ex1); return null; }
                finally
                {
                    // Always call Close when done reading.
                    reader.Close();
                }
            }
        }

        /*********************************************************************************
         * 
         * RESTE DU PROGRAMME
         * 
        *********************************************************************************/

        private delegate void ReceiveData(string str);

        public Form1()
        {
            InitializeComponent();
            serialPort1.Open();
        }

        private void DonneeBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.DonneeBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.exempledatabaseDataSet1);

        }

        private void ChangeLabelText(string str)
        {
           label1.Text = str;
           temp = str;
            //Thread.Sleep(2000);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'exempledatabaseDataSet1.Donnee' table. You can move, or remove it, as needed.
            this.DonneeTableAdapter.Fill(this.exempledatabaseDataSet1.Donnee);

        }


        

        private void DonneeDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void chart1_Click(object sender, EventArgs e)
        {

        }

        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {
            int i = 0;
            int[] tabX, tabY;
            tabX = new int[10];
            tabY = new int[10];

            for (i = 0; i < 10; i++)
            {
                tabX[i] = i;
                tabY[i] = i;
                chart1.Series["temp"].Points.AddXY(tabX[i], tabY[i]);
            }

            chart1.Series["temp"].ChartType = SeriesChartType.FastLine;
            chart1.Series["temp"].Color = Color.Red;

        }

        private void radioButton2_CheckedChanged(object sender, EventArgs e)
        {
            int i;
            int[] tabX, tabY;
            tabX = new int[10];
            tabY = new int[10];

            for (i = 1; i < 10; i++)
            {
                tabX[i] = i;
                tabY[i] = i;
                chart1.Series["lux"].Points.AddXY(tabX[i], tabY[i]);
            }

            chart1.Series["lux"].ChartType = SeriesChartType.FastLine;
            chart1.Series["lux"].Color = Color.Blue; 
        }

        private void dataReceiveSerial(object sender, System.IO.Ports.SerialDataReceivedEventArgs e)
        {
            string stringRead = serialPort1.ReadExisting();
            this.Invoke(new ReceiveData(ChangeLabelText), stringRead);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            reqSQL = "INSERT INTO Donnee (ID, temperature, lux) VALUES ('" + ReadOrderDataMax() + "','" + temp + "','5') ";
            WriteOrderData(reqSQL);
        }


    }
}
