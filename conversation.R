conversation <- function(keyword, topn, total, visual = "black"){
  
  tweet_data <- search_tweets(keyword, n = total, type = "recent", include_rts = F, retryonratelimit = TRUE)
  
  custom_stop_words <- bind_rows(data_frame(word = c(gsub("#", "", keyword), "t.co", "https", "rt", "amp"), 
                                            lexicon = c("custom")), stop_words)
  
  my_title <- paste("Online Discussion Surrounding", keyword)
  my_subtitle <- paste("based on", total, "recent tweets")
  
  tweet_data %>%
    unnest_tokens(word, text) %>%
    anti_join(custom_stop_words) %>%
    count(word, sort = T) %>%
    head(topn) %>%
  ggplot(aes(x = reorder(word, n), y = n, fill = "blue")) + 
    geom_bar(show.legend = F, stat = "identity", width = 0.8) +
    scale_fill_manual(values = visual) + 
    labs(title = my_title, subtitle = my_subtitle, y = "Number of Mentions", x = NULL) +
    coord_flip() +
    theme_classic() +
    theme(plot.title=element_text(family='', face='bold', colour = visual, size=16))
}