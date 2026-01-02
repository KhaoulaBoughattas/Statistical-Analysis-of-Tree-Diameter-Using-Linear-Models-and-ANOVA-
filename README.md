# Statistical Analysis of Tree Diameter Using Linear Models and ANOVA

## 📌 Project Overview
This project focuses on the statistical analysis of tree diameters based on their status using the R programming language.  
The objective is to **compare two statistical approaches**:

1. A **classical linear model** using `lm`
2. An **ANOVA-based approach** with multiple post-hoc tests

The analysis includes descriptive statistics, model diagnostics, hypothesis testing, and constrained parameter estimation.

---

## 📂 Project Structure
```python
├── code_source.R # Main R script
├── arbres.csv # Dataset (tree diameters and status)
└── README.md # Project documentation
```
---


## 📊 Dataset Description
The dataset `arbres.csv` contains:
- **Diametre**: Numeric variable representing tree diameter
- **Statut**: Categorical variable representing the tree status (groups)

---

## 🔍 Analysis Steps

### 1️⃣ Data Loading and Preparation
- Import CSV data
- Rename columns
- Convert variables to appropriate types
- Inspect data structure

---

### 2️⃣ Descriptive Statistics
- Mean diameter by status
- Number of observations per group
- Boxplot visualization of diameter by status

---

### 3️⃣ Method 1: Linear Model (`lm`)
A linear regression model is fitted:

```r
lm(Diametre ~ Statut, data = arbres)
```
**Included:**

- Diagnostic plots (residuals, QQ-plot, leverage)

- Interpretation of coefficients

- Significance testing

---

### 4️⃣ Method 2: ANOVA

An ANOVA model is applied to test group differences:

```r
aov(Diametre ~ Statut, data = arbres)
```

**Post-hoc Tests:**

- Pairwise t-tests (no correction)

- Bonferroni correction

- Holm correction

- Tukey HSD test (robust multiple comparison)

---

### 5️⃣ Advanced Statistical Concepts

- Comparison between lm and aov

- Relationship between regression and ANOVA

- Robustness of post-hoc procedures

---

### 6️⃣ Sum-to-Zero Contrast Constraint

A constrained linear model is implemented such that:

𝛼1+𝛼2+⋯+𝛼𝐾=0

This is achieved using sum-to-zero contrasts:
```r
contrasts(arbres$Statut) <- contr.sum(length(levels(arbres$Statut)))
```

This allows for:

- Symmetric interpretation of group effects

- Alignment with ANOVA parameterization

---

### 🧠 Interpretation & Comparison

- The linear model (lm) and ANOVA yield equivalent global conclusions.

- Differences appear mainly in parameter interpretation.

- Post-hoc tests provide deeper insight into which groups differ.

- Tukey HSD is preferred for multiple comparisons due to its robustness.

---
### 🛠 Tools & Libraries

- R (base)

- stats

- Optional: car, multcomp, DescTools

---

### 🎯 Learning Outcomes

- Understand the equivalence between lm and aov

- Perform statistical diagnostics

- Apply and interpret post-hoc tests

- Use contrast constraints in linear models

---

### 👩‍💻 Author

Khaoula Boughattas

Engineering Student – Data Engineering & Decision Systems

ENET'COM
