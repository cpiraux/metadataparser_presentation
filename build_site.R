# This will build the website and place the files in the docs folder, which 
# GitHub will look to for serving the website (as defined in the repo's Pages).

library(rmarkdown)
library(fontawesome)

render_site(input = "content")