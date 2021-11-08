base_url <- "http://mollands.net/etexts/northangerabbey/na%d.html"
max_chapter <- 31
write_dir <- "~/Documents/jane_austen/northanger_abbey/scrape"
base_outname <- "na%02d.txt"

for(i in seq(max_chapter)) {
  
  cat(i, "... ")
  
  outfile <- file.path(write_dir, sprintf(base_outname, i))
  
  sprintf(base_url, i) %>% 
    read_html() %>% 
    html_nodes(
      xpath = '//div[@id="content"]/p[child::text()]'
      ) %>%  
    html_text() %>% 
    unlist() %>% 
    writeLines(outfile)

    
}
