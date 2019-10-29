# Our website is powered using hugo through the **R** package blogdown #

## Where to start?

1. Install <a href="https://gohugo.io/">hugo</a>

2. Install <a href="http://r-project.org/">R</a> and you will also find useful 
to install <a href="https://rstudio.com/products/rstudio/">RStudio desktop</a>

3. Install the **R** package `blogdown`. Additional **R** packages are also
needed for this website: `RefManageR` (to manage the bibliography with a simple
bibtex file) as well as the packages listed in the first chunk of [this file](https://github.com/R-miss-tastic/website/blob/master/content/rpkg.Rmd)

4. The site is built (*i.e.* generated in the directory `public`) running the
**R** command line `blogdown::build_site()` from the root

## How to add a reference?

Simply edit the file `resources/rmisstastic_biblio.bib` from your local copy of
the website, rebuild the site as explained above and then push on your github
fork and make a pull request as explained [here](https://github.com/R-miss-tastic/website/blob/master/.github/CONTRIBUTING.md)

## How to modify a webpage?

Most webpages in the website are md or Rmd files in the directory `content/`. 
Edit them, rebuild the site as explained above and then push on your github
fork and make a pull request as explained [here](https://github.com/R-miss-tastic/website/blob/master/.github/CONTRIBUTING.md)





