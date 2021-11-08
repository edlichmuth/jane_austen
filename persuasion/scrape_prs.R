base_url <- "http://mollands.net/etexts/persuasion/prs%d.html"
max_chapter <- 24
write_dir <- "~/Documents/jane_austen/persuasion/scrape"
base_outname <- "prs%02d.txt"

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
