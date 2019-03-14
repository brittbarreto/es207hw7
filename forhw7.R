---
  title: "hw4git"
author: "Brittany Lopez Barreto"
date: "March 7, 2019"
output: html_document

##9 
##There are 97 site names that has San or Santa in the name.
sum(str_count(loc$`Site Name`, "San\\s|Santa"))
str_view_all(loc$`Site Name`, "San\\s|Santa", match = T)



##10 There are 481 complete addresses
str_subset(loc$Address, "\\d")
str_subset(loc$`Zip Code`, "\\d{5}")
## subtract the incomplete addresses from the complete
complete<- length(loc$Address) - sum(str_detect(loc$Address, "\\d") & str_detect(loc$`Zip Code`, "\\d{5}"), na.rm = T)
complete





## 14
annual_data<- function(x) {
  annual<- filter(x, str_detect(`Site Name`, "San\\s|Santa"))
  annual %>% 
    ##sort the data in a ore readable manner
    group_by(Year = str_sub(as.factor(date),start = 1, end = 4), `Site Name`, site) %>%
    summarize(o3.mean = mean(o3, na.rm = T), o3.median = median(o3, na.rm = T), o3.max = max(o3, na.rm = T), o3.min = min(o3, na.rm = T)) 
}

annual_data(daily.site)



##15
annual_merced<- function(x,y){
  change<- as.character(y)
  data<- filter(x, str_detect(`County Name`, change))
  data %>%
    group_by(Year = str_sub(as.factor(date), start = 1, end = 4)) %>%
    summarize(Annual_03_Mean = mean(o3, na.rm = T))
}

annual_merced(daily.site, "Merced")
