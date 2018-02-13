library(dplyr)
files<-list.files()
df_1<-read.csv(files[1])
for (i in 2:length(files)){
  temp_df<-read.csv(files[i])[,c('Date','Title')]
  df_1<-rbind(df_1,temp_df)
}
write.csv(df_1,"data_scrapy.csv")

CNBC_with_features = read.csv("./CNBC_with_features3.csv",stringsAsFactors = FALSE)
CNBC_with_features<-CNBC_with_features[,-ncol(CNBC_with_features)]
A=CNBC_with_features%>%replace(is.na(.), 0)%>%group_by(date)%>%summarise_each(funs(sum))
summary(A)
write.csv(A,"CNBC_with_featuresS.csv")
library(zoo)         
#"MDD<-read.csv("CNBC_date.csv")[,-c(1,2)]
#MDD$date<-as.Date(as.character(MDD$date))
strptime("1 Apr 2014","%d %b %Y")
date_clean<-function(x){
  if (is.na(as.yearmon(x,"%d-%b-%y"))==TRUE){
    return(strptime(x,"%d %b %Y"))
  } else{
    return(strptime(x,"%d-%b-%y"))
  }
}
A=sapply(MDD$date,function(x) date_clean(x))
B<-c()
#for(i in 1:nrow(MDD)){
  B[i]=A[[i]]

read.csv("CNBC_data_final_combined2.csv")

stock = read.csv('~/CNBC_Wallst/Stock.csv')

ggplot(data = CNBC_data_final_combined2)+
  geom_histogram(aes(x = buy, fill = Rise),stat = "count",position = "dodge")+
  theme_bw()

#ggplot(data = CNBC_data_final_combined2)+
  #geom_histogram(aes(x=google, fill = Rise),stat = "count",position = "dodge")+
  #theme_bw()
#ggplot(data = CNBC_data_final_combined2)+
  #geom_density(aes(x=fed, color = Rise),stat = "density",position = "identity")+
  #theme_bw()


library(dplyr)
true_flase = function(a){
  ifelse(a == 'True', 1, 0)
} 
V1 = V %>% 
  filter(V$trump>10) %>%
  select(c(trump, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))#%>%
  #summarise(avg = sum(Rise)/n())
V2 = V %>% 
  filter(V$fed>10) %>%
  select(c(fed, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise)) 
summarise(mean = sum(Rise))      
V3 = V %>% 
  filter(V$fed>10) %>%
  select(c(iphone, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))   

V4 = V %>% 
  filter(V$fund>10) %>%
  select(c(fund, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))  

V5 = V %>% 
  filter(V$buy>10) %>%
  select(c(buy, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))
V6 = V %>% 
  filter(V$sell>10) %>%
  select(c(sell, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))

V7 = V %>% 
  filter(V$investor>10) %>%
  select(c(investor, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))
V8 = V %>% 
  filter(V$tech>10) %>%
  select(c(tech, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))

V9 = V %>% 
  filter(V$gain>10) %>%
  select(c(gain, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))
V10 = V %>% 
  filter(V$surge>10) %>%
  select(c(surge, Close, Rise, date)) %>%
  mutate(Rise = true_flase(Rise))
summarise(mean = sum(Rise))

mean_ = c(sum(V1$Rise)/dim(V1)[1],
sum(V2$Rise)/dim(V2)[1],
sum(V3$Rise)/dim(V3)[1],
sum(V4$Rise)/dim(V4)[1],
sum(V5$Rise)/dim(V5)[1],
sum(V6$Rise)/dim(V6)[1],
sum(V7$Rise)/dim(V7)[1],
sum(V8$Rise)/dim(V8)[1],
sum(V9$Rise)/dim(V9)[1],
sum(V10$Rise)/dim(V10)[1])
# or useV1 = V %>% 
  #filter(V$trump>10) %>%
  #select(c(trump, Close, Rise, date)) %>%
  #mutate(Rise = true_flase(Rise))%>%
#summarize(avg = sum(Rise)/n()) to cal mean
new_data_frame = data.frame(name = c('trump','fed','iphone','fund','buy','sell','investor','tech','gain','surge'), mean_)
ggplot(data = new_data_frame, aes(fill = name))+
  geom_bar(aes(x = name, y = mean_), stat = 'identity') +
  theme()
