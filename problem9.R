```{r}
##9 
##There are 97 site names that has San or Santa in the name.
sum(str_count(loc$`Site Name`, "San\\s|Santa"))
str_view_all(loc$`Site Name`, "San\\s|Santa", match = T)
```
