#!/usr/bin/env bash

function help(){
    cat << END_EOF
    usage: data count
    Avaliable options:
        -h,--help             help file
        -t                    Statistics of the total number of visits to 
                              the source host top 100 and corresponding t
                              o each time
        -i                    Count the total number of visits to the sour
                              ce host top 100 IP and the corresponding IP
        -f                    Statistics of the most frequently visited UR
                              L top 100
        -s                    The occurrence times and corresponding percentage
                              of different response status codes were counted
        -u                    Statistics of the occurrence times and corresponding
                              percentage of different response status codes
                              , respectively, statistics of the top 10 URL 
                              corresponding to different 4xx status codes and
                              the total number of corresponding occurrences
        -U                    Given URL output top 100 access source host
END_EOF
}

# 统计访问来源主机TOP 100和分别对应出现的总次数
function hosttoptimes {
    awk -F "\t" '
    NR>1 {host[$1]++;}
    END {
        printf ("%40s\t%s\n","TOP_host","num");
        for(i in host) 
        {
            printf("%40s\t%d\n",i,host[i]);
        } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 统计访问来源主机TOP 100 IP和分别对应出现的总次数
function hostiptoptimes {
    awk -F "\t" '
    NR>1{
        if($1~/([0-9]{1,3}\.){3}[0-9]{1,3}/){
            ip[$1]++; 
        }
    }
    END{
        printf("%20s\t%s\n","TOP_IP","num");
        for(i in ip){
            printf("%20s\t%d\n",i,ip[i]);
        } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 统计最频繁被访问的URL TOP 100
function URLfrequenttop {
    awk -F "\t" '
    NR>1 {
        url[$5]++;
    }
    END {
        printf("%60s\t%s\n","TOP_URL","num");
        for(i in url) {
            printf("%60s\t%d\n",i,url[i]);
            } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -100    
}

# 统计不同响应状态码的出现次数和对应百分比
function Status_code {
    awk -F "\t" '
    NR>1 {
        s_code[$6]++;
    }
    END { 
        for(i in s_code) 
        {
            printf("%d\t%d\t%f%%\n",i,s_code[i],100.0*s_code[i]/(NR-1));
        } 
    }
    ' web_log.tsv
}

# 分别统计不同4XX状态码对应的TOP 10 URL和对应出现的总次数
function State_Code_4XX {
    awk -F "\t" '
    NR>1 { 
        if($6=="403") s_code[$5]++;
    }
    END { 
        printf("%60s\t%s\n","code=403_URL","num");
        for(i in s_code) 
        {
            printf("%60s\t%d\n",i,s_code[i]);
        } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -10
    awk -F "\t" '
    NR>1 { 
        if($6=="404") s_code[$5]++;
    }
    END { 
        printf("%60s\t%s\n","code=404_URL","num");
        for(i in s_code) {
            printf("%60s\t%d\n",i,s_code[i]);
        } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -10
}

# 给定URL输出TOP 100访问来源主机
function Top_URL {
    awk -F '\t' '
    NR>1 {
        if("'"$1"'"==$5) 
        {
            host[$1]++;
        }
    }
    END { 
        printf("%50s\t%s\n","TOP100_host","num");
        for(i in host) 
        {
            printf("%50s\t%d\n",i,host[i]);
            } 
    }
    ' web_log.tsv | sort -g -k 2 -r | head -100
}

# 主体
while true;do
    case "$1" in
        -t)
            hosttoptimes
            exit 0
            ;;
        -i)
            hostiptoptimes
            exit 0
            ;;
        -f)
            URLfrequenttop
            exit 0
            ;;
        -s)
            Status_code
            exit 0
            ;; 
        -u)
            State_Code_4XX
            exit 0
            ;;
        -U)
            Top_URL "$2"
            exit 0
            ;;
        -h)
            Help
            exit 0
            ;;
    esac
done
# help
# hosttoptimes
# hostiptoptimes
# URLfrequenttop
# Status_code
# State_Code_4XX
# Top_URL "/images/USA-logosmall.gif"