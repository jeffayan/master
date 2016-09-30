package jeff.bean;

import java.io.*;
public class CandidateCode 
{ 
    static int count = 0,x,y,a,b;
    public static int cadbury(int m,int n,int p,int q)
    {
      for(int i=0;i<=m;i++)
         {
             for(int j=0;j<=n;j++)
             {
                x=i; y=j;
                while(x==1&&y==1)
                {
                 if(x==y) count++;
                 else if(x>y)
                 {
                     while(x!=y)
                     {
                         x--;
                     }
                     count++;
                 }
                 else
                 {
                     while(x!=y)
                     {
                         y--;
                     }
                     count++;
                 }
                }
                 
             }
         }
         
         
         return count;
    }
}