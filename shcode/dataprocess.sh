#!/usr/bin/env bash

function help(){
    cat << END_EOF
    usage: data count and search
    Avaliable options:
        -a,--age                Count the number and percentage of players in different age ranges
        -p,--position           Count the number and percentage of players in different position ranges
        -n,--name               Looking for the player with the longest and shortest name
        -A,--Age                Looking for the oldest and youngest players
        -h,--help               help file
END_EOF
}

Filename="worldcupplayerinfo.tsv"

# 统计不同年龄区间范围（20岁以下、[20-30]、30岁以上）的球员数量、百分比
function StatisticalAge {
    awk -F '\t' 'BEGIN{num20=0;num20_30=0;num30=0;}
    NR>1{          #NR 表示当前记录的编号（awk将第一个记录算作记录号1）
        if($6<20)
            num20++
        else if($6<=30)
            num20_30++
        else
            num30++            
    }
    END{
        sum=num20+num20_30+num30;
        printf("range   num   percentage\n");
        printf("<20\t     %d\t  %f%%\n",num20,num20*100.0/sum);
        printf("[20,30]\t %d\t  %f%%\n",num20_30,num20_30*100.0/sum);
        printf(">30\t     %d\t  %f%%\n",num30,num30*100.0/sum);
    }' "$Filename"
}

# 统计不同场上位置的球员数量、百分比
function StatisticalPosition {
    awk -F "\t" 'BEGIN{total=0;}
    NR>1{
        position[$5]++;
        total++;
    }
    END{
        
        for(i in position)
        {
            printf("\nrange   num   percentage\n")
            printf("%13s\t  %d\t  %f%%\n",i,position[i],position[i]*100.0/total);
        }
    }' "$Filename"
}

# 名字最长的球员是谁？名字最短的球员是谁？
function namels {
    awk -F "\t" 'BEGIN{maxname=""; minname="";max=-1;min=9999;}
    NR>1{
        if(length($9)<min){
            minname=$9;
            min=length($9);
        }
        if(length($9)>max){
            maxname=$9;
            max=length($9)
        }
    }
    END{
        printf("\nLongest Name:\t%s\nShortest Name:\t%s\n",maxname,minname)
    }' "$Filename"
}

# 年龄最大的球员是谁？年龄最小的球员是谁？
function agebs {
    awk -F "\t" 'BEGIN{maxname=""; minname="";max=-1;min=9999;}
    NR>1{
        name[$9]=$6;
        if($6<min)
        {
            min=$6;
        }
        if($6>max)
        {
            max=$6;
        }
    }
    END{
        printf("\nThe bigest person is:\n")
        for(i in name) {
            if(name[i]==max){
                printf("%s \t",i);
            }
        }
        printf("\nThe youngest person is:\n")
        for(i in name) {
            if(name[i]==min){
                printf("%s \t",i);
            }
        }
    }' "$Filename"
}

# 主体
while true;do
    case "$1" in
        -a|--age)
            StatisticalAge
            exit 0
            ;;
        -p|--position)
            StatisticalPosition
            exit 0
            ;;
        -n|--name)
            namels
            exit 0
            ;;
        -A|--Age)
            agebs
            exit 0
            ;;
        -h|--help)
            help
            exit 0
            ;;
    esac                 
done
# StatisticalAge
# StatisticalPosition
# namels
# agebs
# help
# exit 0;