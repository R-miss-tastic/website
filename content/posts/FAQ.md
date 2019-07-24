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
                    <p align="justify" style="margin-left:15px;">For prediction tasks, the same imputation model has to be used for training and test set. However this is not always possible when imputing with some blackbox imputation function that does not allow for specification of a given imputation model. See <a href="https://arxiv.org/abs/1902.06931" target="_blank">this recent article</a> for a discussion of this topic and <a href="https://www.youtube.com/watch?v=z8IuuDe5oXs&t=19s" target="_blank">this video</a> of a keynote at the useR! 2019 conference on the same subject.
                    </p>
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
                    <p align="justify" style="margin-left:15px;">You simply need to create a single variable with different categories, encoding the different series of possible answers.</p><p style="margin-left:15px;">For example, <br><p style="margin-left:25px;"><i>(1) Do you have a bank account? Yes/No</i></p><p style="margin-left:25px;"><i>(2) If yes to (1): How many bank accounts do you have, <5 or >5?</i></p><p style="margin-left:25px;"><i>(3) If >5: what is the total value? If <5, what is the value of account 1 to 5?</i></p><p align="justify" style="margin-left:15px;">will be coded in <b>one</b> variable with the following categories: <i>Yes >5_1</i>, <i>Yes >5_2</i>, <i>Yes >5_3</i>, <i>Yes >5_4</i>, <i>Yes >5_5</i>, <i>Yes <5</i>, <i>No</i>.</p>
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
