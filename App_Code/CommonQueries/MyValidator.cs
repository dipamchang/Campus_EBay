using System;
using System.Collections.Generic;
using System.Text.RegularExpressions;

public class MyValidator
{
    private static string modified;

    public static bool Required(string toValidate)
    {
        if (toValidate != null)
        {
            toValidate = toValidate.Trim();

            modified = toValidate;

            if (toValidate.Length > 0)
            {
                return true;
            }
        }
        return false;
    }

    public static bool onlyLetter(string toValidate)
    {
        if (Required(toValidate))
        {
            toValidate = modified;
            for (int i = 0; i < toValidate.Length; i++)
            {
                toValidate = toValidate.ToLower();
                if (toValidate[i] < 'a' && toValidate[i] > 'z')
                {
                    return false;
                }
            }
        }
        return true;
    }

    public static bool length(string toValidate, int min, int max)
    {
        if (Required(toValidate))
        {
            toValidate = modified;
            if (toValidate.Length >= min && toValidate.Length <= max)
            {
                return true;
            }
        }
        return false;
    }

    public static bool exactly(string toValidate, int len)
    {
        if (Required(toValidate))
        {
            toValidate = modified;
            if (toValidate.Length == len)
            {
                return true;
            }
        }
        return false;
    }

    public static bool noSpecialChars(string toValidate)
    {
        if (Required(toValidate))
        {
            toValidate = modified;
            toValidate = toValidate.ToLower();
            for (int i = 0; i < toValidate.Length; i++)
            {
                toValidate = toValidate.ToLower();
                if ((toValidate[i] < 'a' || toValidate[i] > 'z') && (toValidate[i] < 48 || toValidate[i] > 57) && toValidate[i] != ' ')
                {
                    return false;
                }
            }
        }
        return true;
    }

    public static bool ValidateListView(int selectedIndex)
    {
        if (selectedIndex > 0)
        {
            return true;
        }
        return false;
    }

    public static bool email(string email)
    {
        Regex emailrx = new Regex(@"^(([^<>()[\]\\.,;:\s@\""]+"

                        + @"(\.[^<>()[\]\\.,;:\s@\""]+)*)|(\"".+\""))@"

                        + @"((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}"

                        + @"\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+"

                        + @"[a-zA-Z]{2,}))$");
        
        return emailrx.IsMatch(email);
    }

    public static bool onlyNumber(string text)
    {
        if (Required(text))
        {
            text = modified;
            for (int i = 0; i < text.Length; i++)
            {
                if (text[i] < 48 || text[i] > 57)
                {
                    return false;
                }
            }    
        }
        
        return true;
    }
}