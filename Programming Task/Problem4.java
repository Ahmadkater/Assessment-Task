public class Problem4 
{
    public static int removeDuplicates(int [] requests)
    {
        int i = 0 ;
        for (int j = 0; j < requests.length; j++) 
        {
            if(requests[i] != requests[j])
            {
                requests[++i] = requests[j];
            }    
        }
        return i+1;
    }  
    
    public static void main(String[] args) 
    {
        int [] reqs = {1, 1, 2};    
        int index = removeDuplicates(reqs);
        System.out.print("New Length: ");
        System.out.println(index);

        for (int i = 1; i <= index ; i++) 
        {
            System.out.print(i);  
        }
    }
}
