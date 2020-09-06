using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.Collections.Generic;
using BAL;
using System.Text;
using System.Security.Cryptography;
using System.ComponentModel;
using System.Reflection;
using System.Collections;
using System.IO;
using System.Collections.Specialized;
/// <summary>
/// Summary description for Global
/// </summary>

public class Global : System.Web.UI.Page
{
    public Global()
    {        
    }   
    public static string MakePassword(int pl)
    {
        var chars = "abcdefghijkmnpqrstuvwxyzABCDEFGHJKLMNPQRSTUVWXYZ23456789@$%&*+!~";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, pl)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());
        return result.ToString();
    }   

    public static int MakeOTP(int pl)
    {
        var chars = "0123456789";
        var random = new Random();
        var result = new string(
            Enumerable.Repeat(chars, pl)
                      .Select(s => s[random.Next(s.Length)])
                      .ToArray());
        return Convert.ToInt32(result);
    }  
   
    public static string RemoveSpecialCharacter(string input)
    {
        string result = "";
        result = Regex.Replace(input, "[^a-zA-Z0-9]+", "");
        return result;
    }
    
    public static string removelastcharcter(string input)
    {
        string mystring = input;
        string output = "";
        if (mystring.Length > 0)
        {
            output = mystring.Remove(mystring.Length - 1, 1);
        }
        return output;
    }    

    public static void SendEmail(string To, string Subject, string Body)
    {
        try
        {
            //if (EmailAddressCheck(To))
            //{
            string PORT = ConfigurationManager.AppSettings["PORT"].ToString().Trim();
            string SMTPFrom = ConfigurationManager.AppSettings["FROMEMAIL"].ToString().Trim();
            string SMTPpass = ConfigurationManager.AppSettings["FROMPWD"].ToString().Trim();
            string SMTP = ConfigurationManager.AppSettings["SMTP"].ToString().Trim();

            SmtpClient client = new SmtpClient(SMTP, Convert.ToInt32(PORT));
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential(SMTPFrom, SMTPpass);
            MailAddress fromAddress = new MailAddress(ConfigurationManager.AppSettings["websitemailtodisplayoutbox"].ToString(), ConfigurationManager.AppSettings["websitenametodisplayoutbox"].ToString());
            MailMessage message = new MailMessage();
            message.From = fromAddress;
            message.To.Add(To.ToString().Trim());
            message.Body = Body.ToString().Trim();
            message.Subject = Subject.ToString().Trim();
            message.IsBodyHtml = true;
            //client.Send(message);
            message.Dispose();
            //}
        }
        catch (Exception exc)
        {
            throw exc;
        }
    }

    
    public static void SendEmailwithattach(string To, string Subject, string Body, string attachment)
    {
        try
        {
            //if (EmailAddressCheck(To))
            //{
            string PORT = ConfigurationManager.AppSettings["PORT"].ToString().Trim();
            string SMTPFrom = ConfigurationManager.AppSettings["FROMEMAIL"].ToString().Trim();
            string SMTPpass = ConfigurationManager.AppSettings["FROMPWD"].ToString().Trim();
            string SMTP = ConfigurationManager.AppSettings["SMTP"].ToString().Trim();

            SmtpClient client = new SmtpClient(SMTP, Convert.ToInt32(PORT));
            client.DeliveryMethod = SmtpDeliveryMethod.Network;
            client.Credentials = new System.Net.NetworkCredential(SMTPFrom, SMTPpass);
            MailAddress fromAddress = new MailAddress(ConfigurationManager.AppSettings["websitemailtodisplayoutbox"].ToString(), ConfigurationManager.AppSettings["websitenametodisplayoutbox"].ToString());
            MailMessage message = new MailMessage();
            message.From = fromAddress;
            message.To.Add(To.ToString().Trim());
            message.Body = Body.ToString().Trim();
            message.Subject = Subject.ToString().Trim();
            message.IsBodyHtml = true;
            System.Net.Mail.Attachment attachment1;
            string strText = attachment;
            string[] strArr = strText.Split(',');
            for (int i = 0; i < strArr.Length; i++)
            {
                attachment1 = new System.Net.Mail.Attachment(strArr[i]);
                message.Attachments.Add(attachment1);
            }
            //client.Send(message);
            message.Dispose();
            //}
        }
        catch (Exception exc)
        {
            throw exc;
        }
    }
    
    public static bool EmailAddressCheck(string emailAddress)
    {
        bool functionReturnValue = false;
        string pattern = "^[a-zA-Z][\\w\\.-]*[a-zA-Z0-9]@[a-zA-Z0-9][\\w\\.-]*[a-zA-Z0-9]\\.[a-zA-Z][a-zA-Z\\.]*[a-zA-Z]$";
        Match emailAddressMatch = Regex.Match(emailAddress, pattern);
        if (emailAddressMatch.Success)
        {
            functionReturnValue = true;
        }
        else
        {
            functionReturnValue = false;
        }
        return functionReturnValue;
    }

    public static string[] ToStringList(DataTable dt, string field)
    {
        return (from r in dt.AsEnumerable() select r.Field<string>(field)).ToArray();
    }

    public static IEnumerable<int> StringToIntList(string str)
    {
        if (String.IsNullOrEmpty(str))
            yield break;

        foreach (var s in str.Split('-'))
        {
            int num;
            if (int.TryParse(s, out num))
                yield return num;
        }
    }

    

    public static void Alert(Control page, string Message)
    {
        ScriptManager.RegisterStartupScript(page, page.GetType(), Guid.NewGuid().ToString(), "alert('" + Message + "');", true);
    }

    

    public static Dictionary<string, object>[] GetDictionary(DataSet ds)
    {
        Dictionary<string, object>[] dict = { };

        dict = GetDictionary(ds.Tables[0]);


        return dict;
    }

    public static Dictionary<string, object>[] GetDictionary(DataTable dt)
    {
        Dictionary<string, object>[] dict = { };

        Array.Resize(ref dict, dt.Rows.Count);

        for (int index = 0; index < dt.Rows.Count; index++)
        {
            dict[index] = GetDictionary(dt.Rows[index]);
        }

        return dict;
    }

    public static Dictionary<string, object> GetDictionary(DataRow dr)
    {
        Dictionary<string, object> dict = new Dictionary<string, object>();

        for (int index = 0; index < dr.ItemArray.Length; index++)
        {
            dict.Add(dr.Table.Columns[index].ColumnName, dr[index]);
        }

        return dict;
    }

    public static string GetUniqueKey()
    {
        int maxSize = 8;
        char[] chars = new char[62];
        string a = "1234567890";
        chars = a.ToCharArray();
        int size = maxSize;
        byte[] data = new byte[1];
        RNGCryptoServiceProvider crypto = new RNGCryptoServiceProvider();
        crypto.GetNonZeroBytes(data);
        size = maxSize;
        data = new byte[size];
        crypto.GetNonZeroBytes(data);
        StringBuilder result = new StringBuilder(size);
        foreach (byte b in data)
        {
            result.Append((b % (chars.Length - 1)));
        }
        return result.ToString();
    }

    public static string ToRoman(int number)
    {
        if ((number < 0) || (number > 3999)) throw new ArgumentOutOfRangeException("insert value betwheen 1 and 3999");
        if (number < 1) return string.Empty;
        if (number >= 1000) return "M" + ToRoman(number - 1000);
        if (number >= 900) return "CM" + ToRoman(number - 900); //EDIT: i've typed 400 instead 900
        if (number >= 500) return "D" + ToRoman(number - 500);
        if (number >= 400) return "CD" + ToRoman(number - 400);
        if (number >= 100) return "C" + ToRoman(number - 100);
        if (number >= 90) return "XC" + ToRoman(number - 90);
        if (number >= 50) return "L" + ToRoman(number - 50);
        if (number >= 40) return "XL" + ToRoman(number - 40);
        if (number >= 10) return "X" + ToRoman(number - 10);
        if (number >= 9) return "IX" + ToRoman(number - 9);
        if (number >= 5) return "V" + ToRoman(number - 5);
        if (number >= 4) return "IV" + ToRoman(number - 4);
        if (number >= 1) return "I" + ToRoman(number - 1);
        throw new ArgumentOutOfRangeException("something bad happened");
    }

    public static bool ExportToExcel(DataTable DT)
    {
        if (DT.Rows.Count == 0)
        {
            return false;
        }
        StringBuilder strExcel = new StringBuilder();
        string strPrint = "";
        string ExcelFN = Convert.ToDateTime(DateTime.Now).ToString("MMMM_dd_yyyy_HHmmss") + "_Students.xls";

        if (DT.Rows.Count > 0)
        {
            if (strPrint == "")
            {
                for (int i = 0; i <= DT.Columns.Count - 1; i++)
                {
                    strExcel.Append(DT.Columns[i].ToString() + " " + "\t");
                }
            }
        }

        strExcel.Append("\n");
        foreach (DataRow row in DT.Rows)
        {
            for (int i = 0; i < DT.Columns.Count; i++)
            {
                strExcel.Append(row[DT.Columns[i].ColumnName].ToString() + "\t");
            }
            strExcel.Append("\t");
            strExcel.Append("\t");
            strExcel.Append("\n");
        }
        if (!strExcel.ToString().Equals(""))
        {
            string attachment = "attachment; filename=" + ExcelFN + "";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/excel";
            HttpContext.Current.Response.AddHeader("Pragma", "public");
            HttpContext.Current.Response.Write(strExcel.ToString());
            HttpContext.Current.Response.End();
        }
        return true;
    }

    public static bool ExportToExcel(DataTable DT, string ExcelFN)
    {
        if (DT.Rows.Count == 0)
        {
            return false;
        }
        StringBuilder strExcel = new StringBuilder();
        string strPrint = "";

        if (DT.Rows.Count > 0)
        {
            if (strPrint == "")
            {
                for (int i = 0; i <= DT.Columns.Count - 1; i++)
                {
                    strExcel.Append(DT.Columns[i].ToString() + " " + "\t");
                }
            }
        }

        strExcel.Append("\n");
        foreach (DataRow row in DT.Rows)
        {
            for (int i = 0; i < DT.Columns.Count; i++)
            {
                strExcel.Append(row[DT.Columns[i].ColumnName].ToString() + "\t");
            }
            strExcel.Append("\t");
            strExcel.Append("\t");
            strExcel.Append("\n");
        }
        if (!strExcel.ToString().Equals(""))
        {
            string attachment = "attachment; filename=" + ExcelFN + "";
            HttpContext.Current.Response.Clear();
            HttpContext.Current.Response.ClearHeaders();
            HttpContext.Current.Response.ClearContent();
            HttpContext.Current.Response.AddHeader("content-disposition", attachment);
            HttpContext.Current.Response.ContentType = "text/excel";
            HttpContext.Current.Response.AddHeader("Pragma", "public");
            HttpContext.Current.Response.Write(strExcel.ToString());
            HttpContext.Current.Response.End();
        }
        return true;
    }
    public static string wrapLocationInformation(DataRow dataRow)
    {

        string location = "";
        location += (!string.IsNullOrEmpty(dataRow["Address1"].ToString())) ? dataRow["Address1"].ToString() : "";
        location += (!string.IsNullOrEmpty(dataRow["Address2"].ToString())) ? ", " + dataRow["Address2"].ToString() : "";
        location += (!string.IsNullOrEmpty(dataRow["City"].ToString())) ? ", " + dataRow["City"].ToString() : "";
        location += (!string.IsNullOrEmpty(dataRow["State"].ToString())) ? ", " + dataRow["State"].ToString() : "";
        location += (!string.IsNullOrEmpty(dataRow["PostalCode"].ToString())) ? ", " + dataRow["PostalCode"].ToString() : "";
        location += (!string.IsNullOrEmpty(dataRow["Country"].ToString())) ? ", " + dataRow["Country"].ToString() : "";

        return location;
    }

}
