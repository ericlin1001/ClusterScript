/*************************************************************************
	> File Name: main.cpp
	> Author: 
	> Mail: 
	> Created Time: Wed 07 Sep 2016 08:59:03 PM CST
 ************************************************************************/

#include<iostream>
#include<time.h>
using namespace std;

#define Iter(var,time) for(int var=0;var<time;var++)
int main(){
                int unused;
    long s=clock();
    long e=0;
    Iter(i,100000){
        Iter(j,10000*3*5){
        //    Iter(k,100000){
                unused=10*10*10;
                unused++;
       //     }
        }
    }
    e=clock();
    double u=((double)e-s)/1000/1000;
 //   cout<<unused<<endl;
    cout<<u<<endl;
    return 0;
}
