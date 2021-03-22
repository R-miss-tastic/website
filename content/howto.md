---
author: "Imke Mayer"
date: 2019-06-30
linktitle: Workflows
menu: navbar
name: "Workflows"
url: "/workflows/"
weight: 1
---

<h2>How to handle missing values in practice? </h2>

<p align="justify">How to handle missing values if we want to do estimation, inference or prediction ?</i> There doesn't exist a unique method to answer to this question. We propose several workflows in both R and Python to compare the most common methods, including in particular multiple imputation (missMDA in R, IterativeImputer in Python), low rank methods (softImpute) and some recent methods implemented in Python using optimal transport (Sinkhorn imputation) and autoencoders (MIWAE). </p>



<br>
<h3>How to (R notebook)...</h3>
<ul class="list-group" id="workflows-list">
<li class="list-group-item"> <a href="/how-to/generate/missSimul.html" target="_blank">... generate missing values?</a> (<a href="/how-to/generate/missSimul.pdf" target="_blank">PDF</a>, <a href="/how-to/generate/missSimul.Rmd" target="_blank">Rmd</a>, <a href="/how-to/generate/amputation.R" target="_blank">Resource R</a>)</li>
<li class="list-group-item"> <a href="/how-to/estimate/missEstim.html" target="_blank">... estimate some parameters with missing values?</a> (<a href="/how-to/estimate/missEstim.pdf" target="_blank">PDF</a>, <a href="/how-to/estimate/missEstim.Rmd" target="_blank">Rmd</a>)</li>
<li class="list-group-item"> <a href="/how-to/impute/missImp.html" target="_blank">... impute missing values?</a> (<a href="/how-to/impute/missImp.pdf" target="_blank">PDF</a>, <a href="/how-to/impute/missImp.Rmd" target="_blank">Rmd</a>, <a href="/how-to/impute/CrossValidation_softImpute.R" target="_blank">Resource R</a>)</li>
</ul>



<h3> How to (Python notebook) ...  </h3>
<p align="justify">
<ul class="list-group" id="workflows-list_py">
<li class="list-group-item"> <a href="/how-to/python/generate_html/How%20to%20generate%20missing%20values.html" target="_blank">... generate missing values?</a> (<a href="https://mybinder.org/v2/gh/R-miss-tastic/website/807208effeaa1f713b444d4bef62ccd2bd1ab8d6?filepath=static%2Fhow-to%2Fpython%2FHow%20to%20generate%20missing%20values.ipynb" target="_blank">Interactive notebook</a>)</li>
<li class="list-group-item"> <a href="/how-to/python/Howtoimpute.html" target="_blank">... impute missing values?</a> (<a href="https://mybinder.org/v2/gh/R-miss-tastic/website/62e85606538ce6e7abe7b2ee2d4fe31bf59fcd4b?filepath=static%2Fhow-to%2Fpython%2FHowtoimpute.ipynb" target="_blank">Interactive notebook</a>)</li>
<li class="list-group-item"> <a href="/how-to/python/predict_html/How%20to%20predict.html" target="_blank">... predict with missing values?</a> (<a href="https://notebooks.gesis.org/binder/v2/gh/R-miss-tastic/website/68603d054e4f5d316aefdcfc9165f524e07cf46f?filepath=static%2Fhow-to%2Fpython%2FHow%20to%20predict.ipynb" target="_blank">Interactive notebook</a>)</li>
</p>

<p align="justify"><i>If you have any suggestions please raise an issue on our <a href="https://github.com/R-miss-tastic/website" target="_blank">Github repository</a>.</i></p>



<style>
.collapse-row.collapsed + tr {
     display: none;
}


tr.border_bottom {
  border-bottom:2pt solid black;
}


table {
  font-size: small;
}

</style>
