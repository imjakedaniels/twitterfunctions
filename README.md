# twitterfunctions
Easy functions to visualize conversational data
-----------------------------------------------------------------------------------------

top_words: search hashtags or topics
top_words[1] is the search term, include quotes
top_words[2] is number of results
top_words[3] is number of recent tweets
top_words[4] is basic colour scheme in quotes (default black)
add any junk terms to the word list in custom_stop_words
  example
top_words("#onpoli", 25, 1000, "red")

-----------------------------------------------------------------------------------------

timeline_tweet: visualize frequent terms from a timeline
timeline_tweet[1] is the twitter handle, no @, include quotes
timeline_tweet[2] is number of results
timeline_tweet[3] is number of recent tweets
timeline_tweet[4] is basic colour scheme in quotes (default black)
add any junk terms to the word list in custom_stop_words
  example
timeline_tweets("Kathleen_Wynne", 15, 500, "red")
timeline_tweets("AndreaHorwath", 15, 500, "orange")
timeline_tweets("fordnation", 15, 500, "blue")

-----------------------------------------------------------------------------------------

conversation: search or create groups of words and see conversation around topics
conversation[1] is a boolean search query in quotes
conversation[2] is number of results
conversation[3] is number of recent tweets
conversation[4] is basic colour scheme in quotes (default black)
add any junk terms to the word list in custom_stop_words
  example
wynne <- "@kathleen_wynne OR kathleen wynne OR wynne OR @OntLiberal"
conversation(wynne, 25, 1000, "red")

-----------------------------------------------------------------------------------------

conversation2: search or create groups of words and see conversation around bi-grams
conversation[1] is a boolean search query in quotes
conversation[2] is number of results
conversation[3] is number of recent tweets
conversation[4] is basic colour scheme in quotes (default black)
add any junk terms to the word list in custom_stop_words
  example
wynne <- "@kathleen_wynne OR kathleen wynne OR wynne OR @OntLiberal"
conversation2(wynne, 25, 1000, "red")
