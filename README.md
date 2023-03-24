<h1 align="center">Analysis of Myopia Dataset</h1>

<br>

<div align="center">
   <a href="https://github.com/iamruveyda/Analysis-of-MyopiaStudy-Dataset/blob/main/LICENSE"><img alt="License" src="https://img.shields.io/github/license/iamruveyda/Analysis-of-MyopiaStudy-Dataset?color=0E6655&style=flat-square"></a>
   <a><img alt="Code Size" src="https://img.shields.io/github/languages/code-size/iamruveyda/Analysis-of-MyopiaStudy-Dataset?color=ca3400&style=flat-square"></a> 
   <a><img alt="Repo Size" src="https://img.shields.io/github/repo-size/iamruveyda/Analysis-of-MyopiaStudy-Dataset?color=8B0000&style=flat-square"></a>
   <a><img src="https://img.shields.io/badge/repository%20creation%20date-Mar%2011,2023-2E4053?style=flat-square"></a>
</div>

<hr>

<table style="width:100%">
  <tr>
    <th>Languages</th>
    <td>
      <a>
        <img height="22" src="https://img.shields.io/badge/R-292A33?logo=R&logoColor=3776AB&style=flat-square">
      </a>     
    </td>
  </tr>
  <tr>
    <th>IDEs/Editors</th>
    <td>
      <a>
        <img height="22" src="https://img.shields.io/badge/RStudio-292A33?logo=RStudio&logoColor=75AADB&style=flat-square" />
        <img height="22" src="https://img.shields.io/badge/Jupyter-292A33?logo=jupyter&logoColor=F37626&style=flat-square" />
        <img height="22" src="https://img.shields.io/badge/Visual%20Studio%20Code-292A33?logo=visualstudiocode&logoColor=007ACC&style=flat-square">
      </a>
    </td>
  </tr>
  <tr>
    <th>Other</th>
    <td>
      <a>
        <img height="22" src="https://img.shields.io/badge/IBM%20SPSS%20Statistics-292A33?logo=IBM&logoColor=FFFFFF&style=flat-square">
      </a>
    </td>
  </tr>
  </table>

<hr>

# Overview

- [Overview](#overview)
  - [Dataset](#dataset)
  - [Subject Headings](#subject-headings)
    - [\[EN\]\_ANOVA_MANOVA.ipynb](#en_anova_manovaipynb)
  - [Tips](#tips)
  - [References / Useful Links](#references--useful-links)

## Dataset

This dataset are a subset of data from the Orinda Longitudinal Study of Myopia (OLSM), a cohort study of ocular component development and risk factors for the onset of myopia in children. Data collection began in the 1989–1990 school time and continued annually through the 2000–2001 school time.

<div align="left">
   <a href="https://www.kaggle.com/datasets/mscgeorges/myopia-study">
  <img src="https://img.shields.io/badge/Kaggle-1A1B27?logo=kaggle&logoColor=20BEFF&style=for-the-badge"></a>
</div>

</br>

<table>
<thead>
  <tr>
    <th>Variable Name</th>
    <th>Variable Description</th>
    <th>Values / Labels</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>ID</td>
    <td>Subject identifier</td>
    <td>1 - 618</td>
  </tr>
  <tr>
    <td>STUDYYEAR</td>
    <td>Year subject entered the study</td>
    <td>year</td>
  </tr>
  <tr>
    <td>MYOPIC</td>
    <td>Myopia within the first five years of follow up</td>
    <td>0 = No<br>1 = Yes</td>
  </tr>
  <tr>
    <td>AGE</td>
    <td>Age at first visit</td>
    <td>years</td>
  </tr>
  <tr>
    <td>GENDER</td>
    <td>Gender</td>
    <td>0 = Male<br>1 = Female</td>
  </tr>
  <tr>
    <td>SPHEQ</td>
    <td>Spherical Equivalent Refraction</td>
    <td>diopter</td>
  </tr>
  <tr>
    <td>AL</td>
    <td>Axial Length</td>
    <td>mm</td>
  </tr>
  <tr>
    <td>ACD</td>
    <td>Anterior Chamber Depth</td>
    <td>mm</td>
  </tr>
  <tr>
    <td>LT</td>
    <td>Lens Thickness</td>
    <td>mm</td>
  </tr>
  <tr>
    <td>VCD</td>
    <td>Vitreous Chamber Depth</td>
    <td>mm</td>
  </tr>
  <tr>
    <td>SPORTHR</td>
    <td>How many hours a week does the child participate in sports or outdoor activities outside school?<br></td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>READHR</td>
    <td>How many hours a week does the child spend reading for pleasure outside school?<br></td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>COMPHR</td>
    <td>How many hours a week does the child spend on the computer (watching/gaming/studying) outside of school?<br></td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>STUDYHR</td>
    <td>How many hours per week outside of school the child spent reading or<br>studying for school assignments?<br></td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>TVHR</td>
    <td>How many hours per week outside of school the child spent watching<br>television?</td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>DIOPTERHR</td>
    <td>Composite of near-work activities defined as</td>
    <td>Hours per week</td>
  </tr>
  <tr>
    <td>MOMMY</td>
    <td>Was the subject's mother myopic?</td>
    <td>0 = No<br>1 = Yes</td>
  </tr>
  <tr>
    <td>DADMY</td>
    <td>Was the subject's father myopic?</td>
    <td>0 = No<br>1 = Yes</td>
  </tr>
</tbody>
</table>

## Subject Headings

### [EN]\_ANOVA_MANOVA.ipynb

- Analysis of Variance (ANOVA)
  - One-way ANOVA
  - Two-way ANOVA
- Multivariate Analysis of Variance (MANOVA)
  - One-way MANOVA
  - Two-way MANOVA

## Tips

- Convert R Markdown File to R Script `sample.Rmd to sample.R`

```
knitr::purl("sample.Rmd")
```

- Convert R Markdown File to Jupyter Notebook `sample.Rmd to sample.ipynb`

```
devtools::install_github("mkearney/rmd2jupyter")
library(rmd2jupyter)

rmd2jupyter("sample.Rmd")
```

- Create sav File for SPSS

```
install.packages("haven")

library("haven")
write_sav(data, "data.sav")
```

## References / Useful Links

- Statistics
  - [Investopedia](https://www.investopedia.com/)
  - [The Beginner's Guide to Statistical Analysis](https://www.scribbr.com/statistics)
- SPSS
  - [IBM SPSS Statistics documentation](https://www.ibm.com/docs/en/spss-statistics)
  - [SPSS TUTORIALS](https://www.spss-tutorials.com/)
- R Programming
  - [GeeksforGeeks](https://www.geeksforgeeks.org/)
  - [Package \'rstatix\'](https://cran.r-project.org/web/packages/rstatix/rstatix.pdf)
