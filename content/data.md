---
author: "Imke Mayer"
date: 2018-12-18
linktitle: Data
---


Here you will find a constantly growing list of interesting datasets which are frequently used in the R community working on missing values. These datasets can be useful to get familiar with different concepts in handling missing values and to assess the quality and performance of new methods.

_If you have suggestions on other datasets which might be of interest to others, please feel free to contact us via the <a href="/contact/">Contact form</a>._

<br>
## Complete data
If you wish to evaluate a certain missing data method on real (or simulated) data it can be useful to first generate missing values in a complete dataset. This allows to control the response mechanism and evaluate the method for different response mechanisms. A useful tool for this is the `ampute` function of the <a href="https://cran.r-project.org/web/packages/mice/index.html" target="_blank">`mice` R-package</a>. Rianne Schouten and her colleagues wrote a <a href="https://rianneschouten.github.io/mice_ampute/vignette/ampute.html" target="_blank">self-contained tutorial</a> on how to ampute data.

<br>
## Incomplete data

The datasets listed below are either widely used in general in the missing data community or used for illustration of different methods handling missing values in the tutorials from the <a href="/tutorials/" target="_blank">Tutorials</a> and <a href="/rpkg/" target="_blank">R packages</a> sections. This presentation scheme is inspired by the <a href="https://archive.ics.uci.edu/ml/index.php" target="_blank">UCI Machine Learning Repository</a>.

Click on the table entry to obtain further information.

<div class="container" style="overflow-x:auto;">
<div class="card bg-light">
<table id="data-list-tbl" class="table table-hover">
<thead>
<tr>
<th>
<b>Name</b>
</th>
<th>
<b>Data Types</b>
</th>
<!--<th>
Default Task
</th>-->
<th>
<b>Attribute Types</b>
</th>
<th>
<b># Instances</b>
</th>
<th>
<b># Attributes</b>
</th>
<th>
<b>% Missing entries</b>
</th>
<th>
<b>Year</b>
</th>
</tr>
</thead>
<tbody>
  <tr data-toggle="collapse" data-target="#airquality" class="clickable collapse-row collapsed">
    <td class="text-nowrap">
    <larger><font color="#428bca">Airquality</font></larger>
    </td>
    <td>
    Multivariate, Time Series
    </td>
    <!--<td>
    Regression
    </td>-->
    <td>
    Real
    </td>
    <td>
    154
    </td>
    <td>
    6
    </td>
    <td>
    7
    </td>
    <td>
    1973
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="airquality" class="collapse">
          This data set contains daily air quality measurements in New York (May to September 1973) and presents missing values in some variables. It can be loaded in R by calling <code> data(airquality)</code>. 
          <br>
          <br><a href="https://stat.ethz.ch/R-manual/R-devel/RHOME/library/datasets/html/airquality.html" target="_blank">More information on the dataset</a>.
          <br>
          <br>
          Tutorials illustrating methods on this data:
          <ul>
          <li> Nick Tierney's <code>naniar</code> vignette for missing data visualization.</li>
          </ul>
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#chorizonDL" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">chorizonDL</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Regression
    </td> -->
    <td>
    Integer, Real
    </td>
    <td>
    606
    </td>
    <td>
    110
    </td>
    <td>
    15
    </td>
    <td>
    1998
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="chorizonDL" class="collapse">
          From the <code>mvoutlier</code> package description: "The Kola Data were collected in the Kola Project (1993-1998, Geological Surveys of Finland (GTK) and Norway (NGU) and Central Kola Expedition (CKE), Russia). More than 600 samples in five different layers were analysed, this dataset contains the C-horizon."
          <br>
          <br><a href="https://cran.r-project.org/web/packages/mvoutlier/mvoutlier.pdf" target="_blank">More information on the dataset</a>.
          <br>
          <br> In the <a href="https://cran.r-project.org/web/packages/VIM/VIM.pdf" target="_blank">VIM</a> all outliers have been recoded as NA. It can be loaded by calling <code> data(chorizonDL)</code>. 
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#health-nutrition" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">Health Nutrition And Population Statistics</font></larger>
    </td>
    <td>
    Multivariate, Time Series
    </td>
    <!-- <td>
    Exploration
    </td> -->
    <td>
    Integer, Real
    </td>
    <td>
    15,022
    </td>
    <td>
    397
    </td>
    <td>
    54
    </td>
    <td>
    2017
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="health-nutrition" class="collapse">
          "Health Nutrition and Population Statistics database provides key health, nutrition and population statistics gathered from a variety of international and national sources. Themes include global surgery, health financing, HIV/AIDS, immunization, infectious diseases, medical resources and usage, noncommunicable diseases, nutrition, population dynamics, reproductive health, universal health coverage, and water and sanitation." (Data website of the World Bank Group, January 23th 2019)
          <br>
          <br>The data have been gathered from 259 countries over the last 58 years.
          <br><a href="https://datacatalog.worldbank.org/dataset/health-nutrition-and-population-statistics" target="_blank">More information on the dataset</a> on the Wold Bank Group website.
          <br>
          <br><a href="http://user2019.r-project.org/datathon/">R Datathon</a> on this dataset organized by the useR!2019 conference.
          <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#nhanes" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">NHANES</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Regression
    </td> -->
    <td>
    Categorical, Integer, Real
    </td>
    <td>
    10,000
    </td>
    <td>
    75
    </td>
    <td>
    37
    </td>
    <td>
    2012
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="nhanes" class="collapse">
          R-package <a href="https://cran.r-project.org/web/packages/NHANES/" target="_blank">NHANES</a> containing data from the US National Health and Nutrition Examination Study. The data comprises body shape and related measurements from the US National Health and Nutrition Examination Survey (NHANES, 1999-2004 and 2009-2012, <a href="http://www.cdc.gov/nchs/nhanes.htm" target="_blank">more details on the survey</a>).
          <br>
          <br>
          Tutorials illustrating methods on this data:
          <ul>
            <li> Stef van Buuren's vignette for ad hoc methods and <code>mice</code>.</li>
            <li> Jerry Reiter's course on multiple imputation.</li>
          </ul>
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#oceanbuoys" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">oceanbuoys</font></larger>
    </td>
    <td>
    Multivariate, Time Series
    </td>
    <!-- <td>
    Prediction
    </td> -->
    <td>
    Real
    </td>
    <td>
    736
    </td>
    <td>
    8
    </td>
    <td>
    3
    </td>
    <td>
    1997
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="oceanbuoys" class="collapse">
          West Pacific Tropical Atmosphere Ocean Data. The data is collected by the Tropical Atmosphere Ocean project and contains real-time data from moored ocean buoys. It can be found in R in the <a href="https://cran.r-project.org/web/packages/naniar/index.html" target="_blank"><code>naniar</code></a> package and is loaded by calling <code> data(oceanbuoys)</code>. 
          <br>
          <br><a href="https://www.pmel.noaa.gov/tao/drupal/disdel/" target="_blank">More information on the collected data</a> on the website of the Pacific Marine Environmental Laboratory.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#ozone" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">Ozone</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Prediction, Regression
    </td> -->
    <td>
    Categorical, Integer, Real
    </td>
    <td>
    366
    </td>
    <td>
    13
    </td>
    <td>
    6
    </td>
    <td>
    1976
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="ozone" class="collapse">
          Los Angeles Ozone Pollution Data, 1976. This data set contains daily measurements of ozone concentration and meteorological quantities. It can be found in R in the <a href="https://cran.r-project.org/web/packages/mlbench/index.html" target="_blank"><code>mlbench</code></a> package and is loaded by calling <code> data(Ozone)</code>. 
          <br>
          <br><a href="https://www.rdocumentation.org/packages/mlbench/versions/2.1-1/topics/Ozone" target="_blank">More information on the dataset</a>.
          <br>
          <br>
          Tutorials illustrating methods on this data:
          <ul>
            <li> Julie Josse's course on missing values imputation using PC methods.</li>
            <li> Julie Josse's and Nick Tierney's tutorial on handling missing values.</li>
            <li> Nick Tierney's <code>naniar</code> vignette for missing data visualization.</li>
          </ul>
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#pedestrian" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">pedestrian</font></larger>
    </td>
    <td>
    Multivariate, Time series
    </td>
    <!-- <td>
    Prediction
    </td> -->
    <td>
    Categorical, Integer
    </td>
    <td>
    37,700
    </td>
    <td>
    9
    </td>
    <td>
    2
    </td>
    <td>
    2016
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="pedestrian" class="collapse">
          This data set contains hourly counts of pedestrians from 4 sensors around Melbourne in 2016. It can be found in R in the <a href="https://cran.r-project.org/web/packages/naniar/index.html" target="_blank"><code>naniar</code></a> package and is loaded by calling <code> data(pedestrian)</code>.
          <br> 
          <br><a href="https://data.melbourne.vic.gov.au/Transport-Movement/Pedestrian-volume-updated-monthly-/b2ak-trbp" target="_blank">More information on the collected data</a> on the public data website of the City of Melbourne.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#riskfactors" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">riskfactors</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Regression
    </td> -->
    <td>
    Categorical, Integer, Real
    </td>
    <td>
    245
    </td>
    <td>
    34
    </td>
    <td>
    14
    </td>
    <td>
    2009
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="riskfactors" class="collapse">
          The data is a subset of the 2009 survey from the Behavioral Risk Factor Surveillance System designed to measure behavioral risk factors for the adult population living in households. It can be found in R in the <a href="https://cran.r-project.org/web/packages/naniar/index.html" target="_blank"><code>naniar</code></a> package and is loaded by calling <code> data(riskfactors)</code>. 
          <br>
          <br><a href="https://www.cdc.gov/brfss/data_documentation/index.htm" target="_blank">More information on the survey</a> on the website of the Centers for Disease Control and Prevention.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#tsAirgap" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">tsAirgap</font></larger>
    </td>
    <td>
    Time series
    </td>
    <!-- <td>
    Imputation
    </td> -->
    <td>
    Integer
    </td>
    <td>
    144
    </td>
    <td>
    1
    </td>
    <td>
    9
    </td>
    <td>
    1960
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="tsAirgap" class="collapse">
          The data contains monthly totals of international airline passengers between 1949 and 1960. It can be found in R in the <a href="https://cran.r-project.org/web/packages/imputeTS/index.html" target="_blank"><code>imputeTS</code></a> package and is loaded by calling <code> data(tsAirgap)</code>. 
          <br>
          <br><a href="https://www.wiley.com/en-us/Time+Series+Analysis%3A+Forecasting+and+Control%2C+5th+Edition-p-9781118674918" target="_blank">More information on the data</a> in the work from Box & Jenkins.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#SBS5242" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">SBS52424</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Regression
    </td> -->
    <td>
    Real
    </td>
    <td>
    262
    </td>
    <td>
    9
    </td>
    <td>
    2
    </td>
    <td>
    2016
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="SBS5242" class="collapse">
          The data contains a synthetic subset of the Austrian structural business statistics (SBS) data, more specifically it contains data on 9 variables of NACE 52.42 (retail sale of clothing). From original Austrian SBS data set of confidential raw data a non-confidential, close-to-reality, synthetic data set was generated. It can be found in R in the <a href="https://cran.r-project.org/web/packages/VIM/index.html" target="_blank"><code>VIM</code></a> package and is loaded by calling <code> data(SBS5242)</code>.
          <br>
          <br><a href="http://statistik.at/web_en/statistics/Economy/enterprises/structural_business_statistics/index.html" target="_blank">More information on the initial SBS data</a> on the website of Statistik Austria.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#sleep" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">sleep</font></larger>
    </td>
    <td>
    Multivariate
    </td>
    <!-- <td>
    Regression
    </td> -->
    <td>
    Integer, Real
    </td>
    <td>
    62
    </td>
    <td>
    10
    </td>
    <td>
    6
    </td>
    <td>
    1976
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="sleep" class="collapse">
          The data contains sleep data. It can be found in R in the <a href="https://cran.r-project.org/web/packages/VIM/index.html" target="_blank"><code>VIM</code></a> package and is loaded by calling <code> data(sleep)</code>.
          <br>
          <br><a href="https://www.semanticscholar.org/paper/Sleep-in-mammals%3A-ecological-and-constitutional-Allison-Cicchetti/8d4f202354bf0fd1bd445792340e16acc042ec6d" target="_blank">More information about the collected data</a> in Allison, T. and Chichetti, D. (1976) Sleep in mammals: ecological and constitutional correlates. <i>Science</i> <b>194 (4266)</b>, 732-734.
        <br>
      </div>
    </td>
  </tr>
  <!-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- -->
  <tr data-toggle="collapse" data-target="#tsHeating" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">tsHeating</font></larger>
    </td>
    <td>
    Time series
    </td>
    <!-- <td>
    Imputation
    </td> -->
    <td>
    Real
    </td>
    <td>
    606,837
    </td>
    <td>
    1
    </td>
    <td>
    9
    </td>
    <td>
    2015
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="tsHeating" class="collapse">
          The data contains a time series of a heating systems supply temperature, measured from 18.11.2013 - 05:12:00 to 13.01.2015 - 15:08:00 in 1 minute steps. It can be found in R in the <a href="https://cran.r-project.org/web/packages/imputeTS/index.html" target="_blank"><code>imputeTS</code></a> package and is loaded by calling <code> data(tsHeating)</code>. The data comes from the GECCO Industrial Challenge 2015.
          <br>
          <br><a href="http://www.spotseven.de/gecco/gecco-challenge/gecco-challenge-2015/" target="_blank">More information about the challenge</a> on the website of SPOTSeven Lab.
        <br>
      </div>
    </td>
  </tr>
  <tr data-toggle="collapse" data-target="#tsNH4" class="clickable collapse-row collapsed">
    <td>
    <larger><font color="#428bca">tsNH4</font></larger>
    </td>
    <td>
    Time series
    </td>
    <!-- <td>
    Prediction
    </td> -->
    <td>
    Real
    </td>
    <td>
    4,552
    </td>
    <td>
    1
    </td>
    <td>
    9
    </td>
    <td>
    2014
    </td>
  </tr>
  <tr class="border_bottom">
    <td colspan="8">
      <div id="tsNH4" class="collapse">
          The data contains a time series of a NH4 concentration in a wastewater system, measured from 30.11.2010 - 16:10 to 01.01.2011 - 06:40 in 10 minute steps. It can be found in R in the <a href="https://cran.r-project.org/web/packages/imputeTS/index.html" target="_blank"><code>imputeTS</code></a> package and is loaded by calling <code> data(tsHeating)</code>. The data comes from the GECCO Industrial Challenge 2014.
          <br>
          <br><a href="http://www.spotseven.de/gecco/gecco-challenge/gecco-challenge-2014/" target="_blank">More information about the challenge</a> on the website of SPOTSeven Lab.
        <br>
      </div>
    </td>
  </tr>
</tbody>
</table>
</div>
</div>


<style>
.collapse-row.collapsed + tr {
     display: none;
}

.nowrap {
  white-space: nowrap;
}


table { 
    border-collapse: collapse; 
    width: 100%;
    overflow-x: scroll;
}

tr.border_bottom {
  border-bottom:2pt solid black;
}

tr {
  width: 100%;
  display: inline-table;
  table-layout: fixed;
}

table {
  font-size: small;
}

</style>


