---
date: 2019-07-22
author: "R-miss-tastic"
slug: faq
title: "FAQ"
categories: []
tags: []
description: ''
---


<p align="justify">When it comes to analyses with missing values, some questions are raised regularely during classes or seminars. We try to list the most popular questions with some elements of response. If you have another question related to the handling of missing values, feel free to contact us via the <a href="/contact/">Contact form</a>.</p>


<!--more-->

<p align="justify">Click on a question to see the answer.</p>


<div class="container">
  <div class="accordion-option">
    <a href="javascript:void(0)" class="toggle-accordion active" accordion-id="#accordion"></a>
  </div>
  <div class="clearfix"></div>
  <div id="accordion" class="panel-group" role="tablist" aria-multiselectable="true">
    <div class="panel panel-default">
      <div id="h_general_faq" class="panel-heading" role="tab">
        <h4 class="panel-title">
          <a role="button" data-toggle="collapse" data-parent="#accordion" href="#general_faq" aria-expanded="false" aria-controls="general_faq">General</a>
        </h4>
      </div>
      <div id="general_faq" class="panel-collapse collapse show" role="tabpanel" aria-labelledby="h_general_faq">
        <div class="panel-body">
          <div class="container">
            <div id="accordion_general_faq">
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#prediction-imputation">
                    <div class="col-12"><i>How to handle missing values in the validation or test set? Is it better to impute test and training set simultaneously, or spearately?</i>
                    </div>
                  </a>
                </div>
                <div id="prediction-imputation" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">For prediction tasks, the same imputation model has to be used for training and test set. However this is not always possible when imputing with some blackbox imputation function that does not allow for specification of a given imputation model. (<i>JJ</i>)</p>
                    <p align="justify" style="margin-left:15px;">See <a href="https://arxiv.org/abs/1902.06931" target="_blank">this recent article</a> for a discussion of this topic and <a href="https://www.youtube.com/watch?v=z8IuuDe5oXs&t=19s" target="_blank">this video</a> of a keynote at the useR! 2019 conference on the same subject.
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#percentage-missing">
                    <div class="col-12"><i>What percentage of missingness is large? Can we impute 90% of missingness using multiple imputation given that some thousands of imputed datasets are generated?</i>
                    </div>
                  </a>
                </div>
                <div id="percentage-missing" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">The question of the percentage of missing data is one of the most frequent questions from users. We are often asked:<i>if I have 30% NA, is that too much? and 40%, etc.?</i></p>
                    <p align="justify" style="margin-left:15px;">It is not only the percentage of missing data that counts, but also the structure of the data. A simple example to understand this point is a data set with 100 variables that are all identical, so the correlation between these variables is 1. Even with 80% missing data, many imputation techniques will be able to perfectly predict the missing values. Therefore, the variability associated with the prediction will be zero. It is also possible to have a data set, where the information is very unstructured and therefore even a very small percentage of missing data can completely destroy the links between the variables.</p>
                    <p align="justify" style="margin-left:15px;">Of course, we do not know <i>a priori</i> the structure of the data. This is why it is imperative, with missing data, to consider the notions of variability and confidence in the results. Multiple imputation, for example, reflects the prediction variance of missing data. A first way to assess the impact of missing data is to use visualization tools to visualize the different imputed values. Then, of course, the size of the confidence intervals will be a good indicator. (<i>JJ</i>)
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#knn">
                    <div class="col-12"><i>K-NN is another method in estimating/imputing missing values; do you think this method can be used for every kind of data?</i>
                    </div>
                  </a>
                </div>
                <div id="knn" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">The idea of imputing from a closer neighbour is a sensible strategy. The problem here is not only missing data but the problem of k-NN for large dimensional datasets with heterogeneous variables (quantitative, categorical, etc). It is necessary to have an appropriate distance to take into account the mixed nature of the data and possibly reduce the size before computing the distances, so for many data sets it is not immediate to apply a k-NN algorithm for imputation. (<i>JJ</i>)
                    </p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#method-choice">
                    <div class="col-12"><i>Are there tools that help you in the decision making process which imputation method to use based on the structure of your data?</i>
                    </div>
                  </a>
                </div>
                <div id="method-choice" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">It always depends on the objective: If we only want to impute and therefore best predict missing values, we can always do cross-validation (add missing cells to the data, predict with different techniques and select the method that gives the smallest prediction error). Afterwards you can also be guided through theoretical arguments. I impute a lot of my data with dimension reduction techniques (low-rank approximation), because it is quite plausible to think that a lot of data can be well approximated by matrices of low rank. (<i>JJ</i>)</p>
                    <p align="justify" style="margin-left:15px;">Here is an interesting reference on this topic: <a href="http://wiki.siam.org/siag-op/images/siag-op/b/bd/ViewsAndNews-27-1.pdf" target="_blank">Udell, M. (2019). Big Data is Low Rank. SIAG/OPT Views and News</a></p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#imputation-time">
                    <div class="col-12"><i>In business, it's "time is money". Do you think the benefit of imputation is high enough to take the time consuming effort of imputing even in a one-time-analysis?</i>
                    </div>
                  </a>
                </div>
                <div id="method-choice" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">Yes, definitely! The consequences of not taking into account the missing data can become dramatic very quickly. Even without mentioning underestimation of variance, there can be a significant bias! For example, at the moment I am working on estimating the effect of a treatment and if we do not take into account the missing data, we can say that the treatment kills when it saves. (<i>JJ</i>)</p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#automatic">
                    <div class="col-12"><i>For non specialists, is there any function inside any package that just takes a dataset as argument, and returns the dataset with the best imputations/deletions?</i>
                    </div>
                  </a>
                </div>
                <div id="automatic" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">There are starting to be first R packages like, <a href="https://cran.r-project.org/web/packages/missCompare/vignettes/misscompare.html" target="_blank"><code>missCompare</code></a>, which allow to compare several imputation methods. There are still a lot of things to fix because all methods have many default settings, etc. But, on the R-miss-tastic platform we will try to put together some workflows that help the user to easily make this type of comparison. (<i>JJ</i>)</p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#imputation-bias">
                    <div class="col-12"><i>When a lot of complete data is still available, would you always suggest imputation considering that (poor) imputation might bias the results?</i>
                    </div>
                  </a>
                </div>
                <div id="imputation-bias" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">If we have good reason to believe that the missing data are completely at random (MCAR), then yes, with a lot of data, we can work on the complete data because we will have samples that come from the joint distribution of the data. Otherwise, even if we have a lot of data, they represent a sample that is not representative of the population. The classic example is missing income data: if rich or poor people do not disclose their income, it is clear that there is a selection bias in the complete case (MNAR data). But even if it is the young or the elderly who do not give their income and that income and age are very linked, we have the same problem of selection bias (MAR data). (<i>JJ</i>)</p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#predictive-missing">
                    <div class="col-12"><i>If the missingness is informative, what to do if the fact that the variable is missing is more predictive of the outcome than the unobserved value?</i>
                    </div>
                  </a>
                </div>
                <div id="predictive-missing" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">If having missing data is informative for prediction, we see that having an indicator in your dataset that codes for <i>missing</i>/<i>not missing</i> will help because it is seen as an explanatory variable. The <a href="https://www.sciencedirect.com/science/article/abs/pii/S0167865508000305" target="_blank">MIA method (Twala et al. 2008)</a> for regression trees/random forests allows this to be done. (<i>JJ</i>)</p>
                    <p >See also, <a href="https://arxiv.org/pdf/1902.06931.pdf" target="_blank">Josse et al. (2019)</a></p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#mnar-possibilities">
                    <div class="col-12"><i>What do you suggest doing if you suspect that data is actually missing not at random? Are there any available options or can't we run any analysis?</i>
                    </div>
                  </a>
                </div>
                <div id="mnar-possibilities" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">Yes, there are solutions that consist in modelling the mechanism of missing data, often this requires having a fairly strong prior on the parametric form of the distribution of missing data. But the practical solutions are still quite limited. There is a series of new approaches based on graphical and causal models that can be used to address missing MNAR data without modeling the mechanism and that offer new solutions but the solutions are still limited to simple models such as the linear model. See for instance <a href="https://ftp.cs.ucla.edu/pub/stat_ser/r473-L.pdf" target="_blank">Mohan and Pearl (2019)</a> (<i>JJ</i>)</p>.
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#p-values">
                    <div class="col-12"><i>Do we have widely accepted combination rules after multiple imputation for p-values?</i>
                    </div>
                  </a>
                </div>
                <div id="p-values" class="collapse" data-parent="#accordion_general_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">I would tend to say no, but that is to be checked. What is certain is that Rubin's aggregation rules are not suitable for many quantities and that there is still a lot of research to be done on the subject. (<i>JJ</i>)</p>.
                  </div>
                </div>
              </div>
            </div>
            </br>
          </div>
        </div>
      </div>
    </div>
    <!-- --------------------------------------------------------------------------------------------------------------------------- -->
    <div class="panel panel-default">
      <div id="h_encoding_faq" class="panel-heading" role="tab">
        <h4 class="panel-title">
          <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#encoding_faq" aria-expanded="false" aria-controls="encoding_faq">Encoding</a>
        </h4>
      </div>
      <div id="encoding_faq" class="panel-collapse collapse show" role="tabpanel" aria-labelledby="h_encoding_faq">
        <div class="panel-body">
          <div class="container">
            <div id="accordion_encoding_faq">
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#not-really-missing">
                    <div class="col-12"><i>How to avoid missing values in hierarchical features (for instance a series of interdependent questions in a survey)?</i></div>
                  </a>
                </div>
                <div id="not-really-missing" class="collapse" data-parent="#accordion_encoding_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">You simply need to create a single variable with different categories, encoding the different series of possible answers.</p><p style="margin-left:15px;">For example, <br><p style="margin-left:25px;"><i>(1) Do you have a bank account? Yes/No</i></p><p style="margin-left:25px;"><i>(2) If yes to (1): How many bank accounts do you have, <5 or >5?</i></p><p style="margin-left:25px;"><i>(3) If >5: what is the total value? If <5, what is the value of account 1 to 5?</i></p><p align="justify" style="margin-left:15px;">will be coded in <b>one</b> variable with the following categories: <i>Yes >5_1</i>, <i>Yes >5_2</i>, <i>Yes >5_3</i>, <i>Yes >5_4</i>, <i>Yes >5_5</i>, <i>Yes <5</i> and <i>No</i>. (<i>JJ</i>)</p>
                  </div>
                </div>
              </div>
              <div class="card">
                <div class="card-header">
                  <a class="collapsed card-block clearfix" data-toggle="collapse" data-target="#learner-codes">
                    <div class="col-12"><i>If you have a learner powerful enough to recognise encoded missing values, shouldn't it be able to recognise NA without resorting to recoding? (Question relative to <a href="https://arxiv.org/pdf/1902.06931.pdf" target="_blank">(Josse et al. 2019))</a></i></div>
                  </a>
                </div>
                <div id="learner-codes" class="collapse" data-parent="#accordion_encoding_faq">  
                  <div class="card-body">
                    <p align="justify" style="margin-left:15px;">Yes, that's the point. We do a recoding, just because the implementations of most methods stop when they see the <code>NA</code> symbol for missing. They don't take it as a code.</p>
                  </div>
                </div>
              </div>
            </div>
            </br>
          </div>
        </div>
      </div>
    </div>
  <div class="accordion-option">
  <a href="javascript:void(0)" class="toggle-accordion active" accordion-id="#accordion"></a>
  </div>
</div>
</div>

<style>
.panel-group {
    padding: 0;
    margin-left: -15px;
}
.panel-default>.panel-heading {
  color: #333;
  background-color: #fff;
  border-color: #e4e5e7;
  padding: 0;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.panel-default>.panel-heading a {
  display: block;
  padding: 20px 20px;
}
.panel-collapse>.panel-body {
  padding: 0px 0px;
  margin-left: 0px;
}
.panel-default>.panel-heading a:after {
  content: "";
  position: relative;
  top: 1px;
  display: inline-block;
  font-style: normal;
  font-weight: 400;
  line-height: 1;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  float: right;
  transition: transform .25s linear;
  -webkit-transition: -webkit-transform .25s linear;
}
.panel-default>.panel-heading a[aria-expanded="true"] {
  background-color: #eee;
}
.panel-default>.panel-heading a[aria-expanded="true"]:after {
  content: "\2212";
  -webkit-transform: rotate(180deg);
  transform: rotate(180deg);
}
.panel-default>.panel-heading a[aria-expanded="false"]:after {
  content: "\002b";
  -webkit-transform: rotate(90deg);
  transform: rotate(90deg);
}
.accordion-option {
  width: 100%;
  float: left;
  clear: both;
  margin: 0px 0;
}
.accordion-option .title {
  font-size: 20px;
  font-weight: bold;
  float: left;
  padding: 0;
  margin: 0;
}
.accordion-option .toggle-accordion {
  float: right;
  font-size: 16px;
  color: #6a6c6f;
}
.accordion-option .toggle-accordion:before {
  content: "Collapse All";
}
.accordion-option .toggle-accordion.active:before {
  content: "Collapse All";
}
</style>
<script>
$(document).ready(function() {
  $(".toggle-accordion").on("click", function() {
    var accordionId = $(this).attr("accordion-id"),
      numPanelOpen = $(accordionId + ' .collapse.in').length;
    $(this).toggleClass("active");
    if (numPanelOpen == 0) {
      openAllPanels(accordionId);
    } else {
      closeAllPanels(accordionId);
    }
  });
  openAllPanels = function(aId) {
    console.log("setAllPanelOpen");
    $(aId + ' .panel-collapse:not(".in")').collapse("show");
  };
  closeAllPanels = function(aId) {
    console.log("setAllPanelclose");
    $(aId + ' .panel-collapse.in').collapse("hide");
  };
});
</script>
