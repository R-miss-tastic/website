---
author: "Imke Mayer"
date: 2018-12-18
linktitle: Data
---


This page is still under construction.

Here you will find a constantly growing list of interesting datasets which are frequently used in the R community working on missing values. These datasets can be useful to get familiar with different concepts in handling missing values and to assess the quality and performance of new methods.

_If you have suggestions on other datasets which might be of interest to others, please feel free to contact us via the <a href="/contact/">Contact form</a>._

<br>
## Complete data
If you wish to evaluate a certain missing data method on real (or simulated) data it can be useful to first generate missing values in a complete dataset. This allows to control the response mechanism and evaluate the method for different response mechanisms. A useful tool for this is the `ampute` function of the <a href="https://cran.r-project.org/web/packages/mice/index.html" target="_blank">`mice` R-package</a>. Rianne Schouten and her colleagues wrote a <a href="https://rianneschouten.github.io/mice_ampute/vignette/ampute.html" target="_blank">self-contained tutorial</a> on how to ampute data.

<br>
## Incomplete data

The datasets listed below are either widely used in general in the missing data community or used for illustration of different methods handling missing values in the tutorials from the <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/" target="_blank">R packages</a> sections.

Click on the data set name to obtain further information.

<div class="container">
  <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="card-block clearfix" data-toggle="collapse" data-target="#airquality">
          <div class="col-12"><b>Airquality</b>: New York Air Quality Measurements</div>
        </a>
      </div>
      <div id="airquality" class="collapse show" data-parent="#accordion">  
        <div class="card-body">
        <small>
          This data set contains daily air quality measurements in New York (May to September 1973) and presents missing values in some variables. It can be loaded in R by calling <code> data(airquality)</code>. 
          <br>
          <br>
          Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/    " target="_blank">R packages</a>):
          <ul>
          <li> Nick Tierney's <code>naniar</code> vignette for <a href="/rpkg/" target="_blank">missing data visualization</a>.</li>
          </ul>
        </small>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#nhanes">
          <div class="col-12"><b>NHANES</b>: Data from the US National Health and Nutrition Examination Study</div>
        </a>
      </div>
      <div id="nhanes" class="collapse" data-parent="#accordion">  
        <div class="card-body">
        <small>
          R-package <a href="https://cran.r-project.org/web/packages/NHANES/" target="_blank">NHANES</a> containing data from the US National Health and Nutrition Examination Study. The data comprises body shape and related measurements from the US National Health and Nutrition Examination Survey (NHANES, 1999-2004, <a href="http://www.cdc.gov/nchs/nhanes.htm" target="_blank">more details on the survey</a>).
          <br>
          <br>
          Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/    " target="_blank">R packages</a>):
          <ul>
            <li> Stef van Buuren's vignette for <a href="/rpkg/" target="_blank">ad hoc methods and <code>mice</code></a>.</li>
            <li> Jerry Reiter's course on <a href="/rpkg/" target="_blank">multiple imputation</a>.</li>
          </ul>
        </small>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#ozone">
          <div class="col-12"><b>Ozone</b>: Data expo from NASA Langley Research Center Atmospheric Sciences Data Center</div>
        </a>
      </div>
      <div id="ozone" class="collapse" data-parent="#accordion">  
        <div class="card-body">
        <small>
          This data set contains geographic and atmospheric measures and presents missing values for all variables. It can be loaded in R by calling <code> data(ozone)</code>. 
          <br><a href="http://stat-computing.org/dataexpo/2006/" target="_blank">More information on the data exposition</a> (1983-2013).
          <br>
          <br>
          Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/    " target="_blank">R packages</a>):
          <ul>
            <li> Julie Josse's course on <a href="/tutorials/" target="_blank">missing values imputation</a>.</li>
            <li> Julie Josse's and Nick Tierney's tutorial on <a href="/tutorials/" target="_blank">handling missing values</a>.</li>
            <li> Nick Tierney's <code>naniar</code> vignette for <a href="/rpkg/" target="_blank">missing data visualization</a>.</li>
          </ul>
        </small>
        </div>
      </div>
    </div>
  </div>
</div>

<br>
Some R-packages on missing values also contain interesting data sets. See for instance <a href="https://cran.r-project.org/web/packages/naniar/index.html" target="_blank"><code>naniar</code></a>, <a href="https://cran.r-project.org/web/packages/imputeTS/" target="_blank"><code>tsImpute</code></a> and <a href="https://cran.r-project.org/web/packages/VIM/index.html" target="_blank"><code>VIM</code></a>.



<!-- <div class="container">      
<button type="button" class="btn btn-sm" data-toggle="collapse" data-target="#airquality"><b>airquality</b>: New York Air Quality Measurements</button>
<div id="airquality" class="collapse">
      <br>
      This data set contains daily air quality measurements in New York (May to September 1973) and presents missing values in some variables. It can be loaded in R by calling <code> data(airquality)</code>. 
      <br>
      <br>
      Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/" target="_blank">R packages</a>):
      <ul>
      <li> Nick Tierney's <code>naniar</code> vignette for <a href="/rpkg/" target="_blank">missing data visualization</a>.</li>
      </ul>
  </div>
</div>

<br>
<div class="container">
<button type="button" class="btn btn-sm" data-toggle="collapse" data-target="#nhanes"><b>NHANES</b>: Data from the US National Health and Nutrition Examination Study</button>
<div id="nhanes" class="collapse">
      <br>
      R-package <a href="https://cran.r-project.org/web/packages/NHANES/" target="_blank">NHANES</a> containing data from the US National Health and Nutrition Examination Study. The data comprises body shape and related measurements from the US National Health and Nutrition Examination Survey (NHANES, 1999-2004, <a href="http://www.cdc.gov/nchs/nhanes.htm" target="_blank">more details on the survey</a>).
      <br>
      <br>
      Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a>):
      <ul>
        <li> Stef van Buuren's vignette for <a href="/rpkg/" target="_blank">ad hoc methods and <code>mice</code></a>.</li>
        <li> Jerry Reiter's course on <a href="/rpkg/" target="_blank">multiple imputation</a>.</li>
      </ul>
  </div>
</div>

<br>
<div class="container">
  <button type="button" class="btn btn-sm" data-toggle="collapse" data-target="#ozone"><b>ozone</b>: Data expo from NASA Langley Research Center Atmospheric Sciences Data Center</button>
  <div id="ozone" class="collapse">
      <br>
      This data set contains geographic and atmospheric measures and presents missing values for all variables. It can be loaded in R by calling <code> data(ozone)</code>. 
      <br><a href="http://stat-computing.org/dataexpo/2006/" target="_blank">More information on the data exposition</a> (1983-2013).
      <br>
      <br>
      Tutorials illustrating methods on this data (see <a href="/tutorials/" target="_blank">Tutorials</a>):
      <ul>
      <li> Julie Josse's course on <a href="/tutorials/" target="_blank">missing values imputation</a>.</li>
      <li> Julie Josse's and Nick Tierney's tutorial on <a href="/tutorials/" target="_blank">handling missing values</a>.</li>
      <li> Nick Tierney's <code>naniar</code> vignette for <a href="/rpkg/" target="_blank">missing data visualization</a>.</li>
      </ul>
  </div>
</div> -->


