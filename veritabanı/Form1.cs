using System;
using Npgsql;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace veritabanı
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=arackiralama; user ID=postgres; password=145BeyzaC");

        private void button1_Click_1(object sender, EventArgs e)
        {
            
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into rezervasyon (rezervasyonno,musterino,aracno,alısyeri,tarih) values (@p1,@p2,@p3,@p4,@p5)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
            komut1.Parameters.AddWithValue("@p2", int.Parse(textBox1.Text));
            komut1.Parameters.AddWithValue("@p3", int.Parse(textBox4.Text));
            komut1.Parameters.AddWithValue("@p4", textBox3.Text);
            komut1.Parameters.AddWithValue("@p5", dateTimePicker1.Value);
            komut1.ExecuteNonQuery();
            baglanti.Close();
        }
        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update rezervasyon set alısyeri=@p2,tarih=@p1 where rezervasyonno=@p3", baglanti);
            komut3.Parameters.AddWithValue("@p2", textBox3.Text);
            komut3.Parameters.AddWithValue("@p1", dateTimePicker1.Value);
            komut3.Parameters.AddWithValue("@p3", int.Parse(textBox6.Text));
            komut3.ExecuteNonQuery();
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("Delete From rezervasyon where rezervasyonno=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();


        }
        private void button3_Click(object sender, EventArgs e)
        {

            baglanti.Open();
            string sorgu = "select *from rezervasyon where alısyeri like '%" + textBox3.Text + "%'";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }
        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

       

     

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void dateTimePicker1_ValueChanged(object sender, EventArgs e)
        {

        }
    }
}
