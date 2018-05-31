conversation2 <- function(keyword, total, visual = "black"){
  
  tweet_data <- search_tweets(keyword, n = total, type = "recent", include_rts = F, retryonratelimit = TRUE)
  
  custom_stop_words <- bind_rows(data_frame(bigram = c("https t.co", "of the", "for the", "and the", "to be", "to the", "in the", "is a", "is the"), 
                                            lexicon = c("custom")), stop_words)
  
  my_title <- paste("Bigrams on Discussion Surrounding", keyword)
  my_subtitle <- paste("based on", total, "recent tweets")
  
  tweet_data %>%
    unnest_tokens(bigram, text, token = "ngrams", n = 2, collapse = F) %>%
    anti_join(custom_stop_words) %>%
    count(bigram, sort = T) %>%
    head(15) %>%
  ggplot(aes(x = reorder(bigram, n), y = n, fill = "blue")) + 
    geom_bar(show.legend = F, stat = "identity", width = 0.8) +
    scale_fill_manual(values = visual) + 
    labs(title = my_title, subtitle = my_subtitle, y = "Number of Mentions", x = NULL) +
    coord_flip() +
    theme_classic() +
    theme(plot.title=element_text(family='', face='bold', colour = visual, size=16))
}