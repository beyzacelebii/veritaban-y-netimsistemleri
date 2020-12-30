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
    public partial class Formkisi : Form
    {
        public Formkisi()
        {
            InitializeComponent();
        }
        NpgsqlConnection baglanti = new NpgsqlConnection("server=localHost; port=5432; Database=arackiralama; user ID=postgres; password=145BeyzaC");

        private void Formkisi_Load(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut1 = new NpgsqlCommand("insert into kisi (kisino,adi,soyadi) values (@p1,@p2,@p3)", baglanti);
            komut1.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
            komut1.Parameters.AddWithValue("@p2", textBox1.Text);
            komut1.Parameters.AddWithValue("@p3", textBox4.Text);
         
            komut1.ExecuteNonQuery();
            baglanti.Close();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut2 = new NpgsqlCommand("Delete From kisi where kisino=@p1", baglanti);
            komut2.Parameters.AddWithValue("@p1", int.Parse(textBox6.Text));
            komut2.ExecuteNonQuery();
            baglanti.Close();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            string sorgu = "select *from kisi where adi like '%" + textBox1.Text + "%'";
            NpgsqlDataAdapter da = new NpgsqlDataAdapter(sorgu, baglanti);
            DataSet ds = new DataSet();
            da.Fill(ds);
            dataGridView1.DataSource = ds.Tables[0];
        }

        private void button4_Click(object sender, EventArgs e)
        {
            baglanti.Open();
            NpgsqlCommand komut3 = new NpgsqlCommand("update kisi set soyadi=@p2,adi=@p1 where kisino=@p3", baglanti);
            komut3.Parameters.AddWithValue("@p2", textBox4.Text);
            komut3.Parameters.AddWithValue("@p1", textBox1.Text);
            komut3.Parameters.AddWithValue("@p3", int.Parse(textBox6.Text));
            komut3.ExecuteNonQuery();
            baglanti.Close();
        }
    }
}