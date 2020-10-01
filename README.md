# Using the website
Hello all the developers.Welcome to my repository
There are no pre-requisites to edit this website. to propose a change you just have to:
1. Fork the repository
2. Edit the page you want to change (usually in /content)
3. Create a Pull Request (you will be able to see your change in the Pull Request checks)

## Debuging locally
To deploy the site locally (e.g. for debugging), you can :

1. In R, install the R package blogdown

```r
install.packages("blogdown")
```

2. start it:

```r
library(blogdown)
```
  
3. and install hugo using blogdown

```r
install_hugo()
```

4. To use the website, open the R project that you have just cloned from github and start

```r
library(blogdown)
serve_site()
```

That will display the website via your localhost.
