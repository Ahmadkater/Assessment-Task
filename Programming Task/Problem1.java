import java.util.*;

public class Problem1 
{
    public static void getRepeatedNetworkTraffic(int [] packets )
    {
        HashMap<Integer,Integer> m1 = new HashMap<>();

        for (int p : packets)
        {
            if (m1.containsKey(p)) 
            {
                m1.put(p,m1.get(p) + 1);
            }
            else
            {
                m1.put(p, 1);
            }
        }

        for (int i : packets) 
        {
            System.out.print("id = ");
            System.out.print(i);
            System.out.print(" repeted ");
            System.out.print(m1.get(i)); 
            System.out.println(" times");   
        }
    }

    public static void main(String[] args)
    {
        int [] packets = {1,2,3,4,1,2,7,2,3,4};

        getRepeatedNetworkTraffic(packets);
    }    
    
}
