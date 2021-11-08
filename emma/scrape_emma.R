base_url <- "http://mollands.net/etexts/emma/emma%d.html"
max_chapter <- 55
write_dir <- "~/Documents/jane_austen/emma/scrape"
base_outname <- "emma%02d.txt"

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
