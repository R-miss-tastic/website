# Using the website

## pre-requisites

In R, install the R package blogdown

```r
install.packages("blogdown")
```

start it:

```r
library(blogdown)
```
  
and install hugo using blogdown

```r
install_hugo()
```

To use the website, open the R project that you have just cloned from github and start

```r
library(blogdown)
serve_site()
```

That will display the website via your localhost.