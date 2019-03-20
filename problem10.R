##10 There are 481 complete addresses
str_subset(loc$Address, "\\d")
str_subset(loc$`Zip Code`, "\\d{5}")
## subtract the incomplete addresses from the complete
complete<- length(loc$Address) - sum(str_detect(loc$Address, "\\d") & str_detect(loc$`Zip Code`, "\\d{5}"), na.rm = T)
complete