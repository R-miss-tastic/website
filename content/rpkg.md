---
author: "Nathalie Vialaneix"
date: 2018-07-22
linktitle: R packages on missing values
---

This page is still under construction but in the meantime you can take a look at the <a href="https://CRAN.R-project.org/view=MissingData" target="_blank">CRAN Task View on Missing Data</a> recently created and maintained by the contributors of this website.

Here we gather some nice practical tutorials and vignettes that illustrate the use of different R-packages to handle missing data.

_If you wish to contribute some of your own material to this section, please feel free to contact us via the <a href="/contact/">Contact form</a>._


<div class="container">
  <div id="accordion">
    <div class="card">
      <div class="card-header">
        <a class="card-block clearfix" data-toggle="collapse" data-target="#visualize">
          <div class="col-12">Missing data visualizations with <code>naniar</code></div>
        </a>
      </div>
      <div id="visualize" class="collapse show" data-parent="#accordion">  
        <div class="card-body">
          <ul>
          	<li><a href="https://cran.r-project.org/web/packages/naniar/vignettes/naniar-visualisation.html" target="_blank"><code>naniar</code> vignette: Missing data visualizations</a>
        	<small>
          	<p>(Nicholas Tierney, 2018)</p>
      		</small></li>
      	  </ul>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#data_types">
          <div class="col-12">Handling different types of data</div>
        </a>
      </div>
      <div id="data_types" class="collapse" data-parent="#accordion">  
        <div class="card-body">
          <ul>
          	<li><a href="/tutorials/Josse_Tierney_bookdown_user2018tutorial_2018.html" target="_blank">useR! tutorial on handling missing values</a>
          		<small><p>(Julie Josse & Nicholas Tierney, 2018)</p></small></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#husson">
          <div class="col-12">Handling missing values in PCA and MCA with <code>missMDA</code></div>
        </a>
      </div>
      <div id="husson" class="collapse" data-parent="#accordion">  
        <div class="card-body">
          <ul>
            <li><a href="https://www.youtube.com/watch?v=OOM8_FH6_8o&t=8s" target="_blank">Handling missing values in PCA</a></li>
            <li><a href="https://www.youtube.com/watch?v=uyIH1CtrfsU" target="_blank">Handling missing values in MCA</a></li>
          </ul>
        <small>
          <p>(François Husson, video tutorial accompanying the R-package <code>missMDA</code>, 2016)</p>
        </small>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#mi">
          <div class="col-12">Multiple imputation with <code>mice</code>, <code>JointAI</code>, <code>smcfs</code>, <code>jomo</code></div>
        </a>
      </div>
      <div id="mi" class="collapse" data-parent="#accordion">  
        <div class="card-body">
          <ul>
            <li><a href="https://www.gerkovink.com/miceVignettes/Ad_hoc_and_mice/Ad_hoc_methods.html" target="_blank"><code>mice</code> vignette: Ad hoc methods and <code>mice</code></a>
            	<small><p>(Stef van Buuren and Gerko Vink, 2018)</p></small></li>
            <li><a href="https://www.gerkovink.com/miceVignettes/" target="_blank">Other <code>mice</code> vignettes</a>
              <small><p>(Stef van Buuren and Gerko Vink, 2018)</p></small></li>
            <li><a href="/tutorials/Erler_course_MultipleImputation_2018/Erler_Practical_MICE_2018.html" target="_blank">Multiple imputation with the <code>mice</code> package</a>
              <small><p>(Nicole Erler, NIHES course on multiple imputation, 2018)</p></small></li>
            <li><a href="/tutorials/Erler_course_MultipleImputation_2018/Erler_Practical_MIadvanced_2018.html" target="_blank">Multiple imputation in complex settings (using <code>mice</code>, <code>JointAI</code>, <code>smcfs</code>, <code>jomo</code>)</a>
              <small><p>(Nicole Erler, NIHES course on multiple imputation, 2018)</p></small></li>
            <li><a href="/tutorials/Reiter_course_MultipleImputationOverview_2018/Reiter_script_MultipleImputationMICE_2018.html" target="_blank">Example using <code>mice</code></a>
            	<small><p>(Jerry Reiter, 2018)</p></small></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="card">
      <div class="card-header">
        <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#missforest">
          <div class="col-12">Random trees and forests with <code>missForest</code></div>
        </a>
      </div>
      <div id="missforest" class="collapse" data-parent="#accordion">  
        <div class="card-body">
          <ul>
            <li><a href="/tutorials/Stekhoven_vignette_missForest_2012.pdf" target="_blank"><code>missForest</code> vignette: Using the <code>missForest</code> Package</a>
              <small><p>(Daniel J. Stekhoven, 2012)</p></small></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
