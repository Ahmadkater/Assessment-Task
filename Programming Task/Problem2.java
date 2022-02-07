import java.util.*;

public class Problem2 
{
    static String simplify(String path)
    {
        
        // using vector in place of stack
        Vector<String> v = new Vector<String>();
        int n = path.length();
        String ans = "";
        for (int i = 0; i < n; i++) {
            String dir = "";
            
            while (i < n && path.charAt(i) != '/') {
                dir += path.charAt(i);
                i++;
            }
       
            if (dir.equals("..")) {
                if (v.size() != 0)
                {
                    v.remove(v.size() - 1);
                }
            }
            else if (dir.equals(".") || dir.equals(""))
            {
            }
            else 
            {
                v.add(dir);
            }
        }
       
        // forming answer
        for(String i : v)
        {
            ans += "/" + i;
        }       
        if (ans == "")
            return "/";
       
        return ans;    
    }

    public static void main(String[] args) {
        String str = "/fic/././iak/../../hgy/blg/../vzt/../tod/.././.././bsc/./krk/../lnb/zhj/./";
        String res = simplify(str);
        System.out.print(res);
    }
 
}
