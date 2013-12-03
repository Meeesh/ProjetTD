using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
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
        private delegate void ReceiveData(string str);

        public Form1()
        {
            InitializeComponent();
            serialPort1.Open();
        }

        private void customersBindingNavigatorSaveItem_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.customersBindingSource.EndEdit();
            this.tableAdapterManager.UpdateAll(this.exempledatabaseDataSet1);

        }

        private void ChangeLabelText(string str)
        {
           label1.Text = str;
            //Thread.Sleep(2000);
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: This line of code loads data into the 'exempledatabaseDataSet1.customers' table. You can move, or remove it, as needed.
            this.customersTableAdapter.Fill(this.exempledatabaseDataSet1.customers);

        }


        

        private void customersDataGridView_CellContentClick(object sender, DataGridViewCellEventArgs e)
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

    }
}
