
public class Problem3 
{
    public static String convert(String s, int n)
        {
            if (n <= 1)
            {
                return s;
            }
            StringBuilder result = new StringBuilder();
            // Iterate rowNum from 0 to n - 1
            for (int rowNum = 0; rowNum < n; rowNum++)
            {
                int i = rowNum;
                boolean up = true;

                // Iterate i till s.length() - 1
                while (i < s.length())
                {

                    result = result.append(s.charAt(i));
                    // Check is rowNum is 0 or n - 1
                    if (rowNum == 0 || rowNum == n - 1)
                    {
                        i += (2 * n - 2);
                    }
                    else
                    {
                        if (up)
                        {
                            i += (2 * (n - rowNum) - 2);
                        }
                        else
                        {
                            i += rowNum * 2;
                        }
                        up ^= true;
                    }
                }
            }
            return result.toString();
        }
 
    public static void main(String[] args) {
        String str = "VODAFONEISHIRING";
        int n = 3;
        System.out.println(convert(str, n));
    }

}
