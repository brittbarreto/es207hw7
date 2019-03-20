##15
annual_merced<- function(x,y){
  change<- as.character(y)
  data<- filter(x, str_detect(`County Name`, change))
  data %>%
    group_by(Year = str_sub(as.factor(date), start = 1, end = 4)) %>%
    summarize(Annual_03_Mean = mean(o3, na.rm = T))
}

annual_merced(daily.site, "Merced")