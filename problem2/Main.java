import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class Main {
    public static void main(String args[]) {
        Scanner sc = new Scanner(System.in);
        final int n = sc.nextInt();

        List<Long> list = new ArrayList<>();
        for(int i=0;i<n;i++) { if(fibo(i)%2==0) list.add(fibo(i));}

        int sum = 0;
        for (Long aList : list) sum += aList;
        System.out.println(list);
        System.out.println(sum);
    }

    static long fibo(int n) {
        long f;
        if(n<=0) return 0;
        else if(n==1 || n==2) return 1;
        else f = (fibo(n-1)+fibo(n-2));
        return f;
    }
}
