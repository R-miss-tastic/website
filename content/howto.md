---
author: "Imke Mayer"
date: 2019-06-30
linktitle: Workflows
menu: navbar
name: "Workflows"
url: "/workflows/"
weight: 1
---

<h2>How to handle missing values in practice ? </h2>

<p align="justify">Missing values occur almost inevitably in most domains that handle data. Hence most data sets contain missing values, some of them might be informative. Now the question is <i>How to handle these missing values if we want to do estimation, inference, prediction, etc.?</i> There doesn't exist a unique and standard answer to this question since the analyses depend on different aspects of the data and several questions have to be considered before choosing a way to deal with the missing values:</p>

<ul>
  <li>What do we know about the mechanism behind the missing values?</li>
  <li>Do the missing values contain information?</li>
  <li>What happens if we ignore the missing values (i.e. if we drop the incomplete observations or if we ignore the missingness mechanism)?</li>
</ul>

<p align="justify">In the different sections of this website you will find numerous resources - tutorials, publications, etc. - that cover the majority of existing methods to handle missing values in various contexts. For a straightforward application of some the most common methods we propose several workflows in form of R markdowns. With these workflows we aim at providing a direct implementation of these methods and a template for a direct reuse on other data sets. In fact, we believe that the use of a common template, for instance for generating missing values, allows for better and transparent comparability between different methods and for simple replicability of experimental results.</p>


<br>
<h3>How to (R notebook)...</h3>
<ul class="list-group" id="workflows-list">
<li class="list-group-item"> <a href="/how-to/generate/missSimul.html" target="_blank">... generate missing values?</a> (<a href="/how-to/generate/missSimul.pdf" target="_blank">PDF</a> and <a href="/how-to/generate/amputation.R" target="_blank">related R source code</a>)</li>
<li class="list-group-item"> <a href="/how-to/estimate/missEstim.html" target="_blank">... estimate with missing values?</a> (<a href="/how-to/estimate/missEstim.pdf" target="_blank">PDF</a>)</li>
<li class="list-group-item"> <a href="/how-to/impute/missImp.html" target="_blank">... impute missing values?</a> (<a href="/how-to/impute/missImp.pdf" target="_blank">PDF</a>)</li>
</ul>

<h3> Python notebook (Work in progress) </h3>
<p align="justify"> 
<ul class="list-group" id="workflows-list_py">
<li class="list-group-item"> [How to generate missing values?](https://github.com/TwsThomas/website/blob/tuto_python/static/how-to/python/generate/How%20to%20generate%20missing%20values.ipynb) </li>
<li class="list-group-item">  [How to predict with missing values](https://github.com/TwsThomas/website/blob/tuto_python/static/how-to/python/predict/Tutorial%20Boosted%20Trees%20with%20Missing%20Values.ipynb) </li>
</p>

<p align="justify"><i>If you have any suggestions please raise an issue on our <a href="https://github.com/R-miss-tastic/website" target="_blank">GitHub repo</a>.</i></p>



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


