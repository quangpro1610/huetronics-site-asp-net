using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Configuration;
/// <summary>
/// Summary description for md5
/// </summary>
public class md5
{
	public md5()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    public static string maHoa(string strMaHoa)
    {
        //byte[] arrKey;
        //byte[] arrMahoa = UTF8Encoding.UTF8.GetBytes(strMaHoa);

        //System.Configuration.AppSettingsReader settingsReader = new AppSettingsReader();
        ////Lấy giá trị key từ file Web.config
        //string keyConfig = (string)settingsReader.GetValue("keyMD5", typeof(String));

        //MD5CryptoServiceProvider serviceMD5 = new MD5CryptoServiceProvider();
        //arrKey = serviceMD5.ComputeHash(UTF8Encoding.UTF8.GetBytes(keyConfig));
        //serviceMD5.Clear();//Giải phóng tài nguyên
        //TripleDESCryptoServiceProvider tdsp = new TripleDESCryptoServiceProvider();

        ////Thiết lập 1 key cho thuật toán mã hóa
        //tdsp.Key = arrKey;

        ////Chọn phương thức mã hóa. Ở đây chúng ta chọn ECB(Electronic code Book ) [1]
        //tdsp.Mode = CipherMode.ECB;

        ////Thêm phương thức mã hóa IS010126 (random chuỗi kết quả)  [2]
        //tdsp.Padding = PaddingMode.ISO10126;

        //ICryptoTransform cTransform = tdsp.CreateEncryptor();
        //byte[] arrKQ = cTransform.TransformFinalBlock(arrMahoa, 0, arrMahoa.Length);
        //tdsp.Clear(); //Giải phóng tài nguyên của TripleDES Encryptor

        ////Kết quả mã hóa được trả về 1 giá trị kiểu String
        //return Convert.ToBase64String(arrKQ, 0, arrKQ.Length);
        byte[] arrHash;
        MD5 md5 = MD5.Create();
        byte[] inputbyte = Encoding.UTF8.GetBytes(strMaHoa);
        arrHash = md5.ComputeHash(inputbyte);

           StringBuilder sb = new StringBuilder();
           for (int i = 0; i < arrHash.Length; i++)
            {
                sb.Append(arrHash[i].ToString());
            }
            return sb.ToString();
    }
   
}