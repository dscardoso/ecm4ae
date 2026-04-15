# Recommended additional resources

This is a list of recommended materials and resources to complement our discussions in each unit of the course. 

If you have suggestions of materials, please share them with me.

## Recommended textbooks 

Computational methods:

- [MF02] Miranda, Mario J. and Paul L. Fackler. Applied Computational Economics and Finance. Cambridge, MA MIT Press, 2002.
- [J98] Judd, Kenneth L. Numerical Methods in Economics. Cambridge, MA MIT Press, 1998.
- [NW06] Nocedal, J. and S. J. Wright. Numerical Optimization. New York Springer, 2nd edition, 2006.

Econometrics:

- [CT05] Cameron, A. Colin, and Trivedi, Pravin K.. Microeconometrics Methods and Applications. United Kingdom Cambridge University Press, 2005.
- [G18] Greene, William H. Econometric Analysis. 8th Edition. United Kingdom Pearson, 2018.


## Unit 1: Intro to Scientific Computing

### Papers

#### Reproducibility and best practices

- Gentzkow and Shapiro 2014. [*Code and Data for the Social Sciences: A Practitioner’s Guide.*](https://web.stanford.edu/~gentzkow/research/CodeAndData.pdf)


### Articles and websites

#### Reproducibility

- [Unofficial guidance on various topics by Social Science Data Editors | Data and Code Guidance by Data Editors](https://social-science-data-editors.github.io/guidance/)
- [Office of the Data Editor of the American Economic Association - Office of the AEA Data Editor](https://aeadataeditor.github.io/)
- [Development Research in Practice: The DIME Analytics Data Handbook](https://openknowledge.worldbank.org/handle/10986/35594), This is a very comprehensive (free!) handbook on reproducible research published by the World Bank.

#### Coding

- [Why Learning to Code is So Damn Hard](https://dev.to/theodinproject/why-learning-to-code-is-so-damn-hard-11nn)

### Tutorials

#### Julia/Programming

- [Get started with Julia](https://julialang.org/learning/)
- [Quantitative Economics with Julia](https://julia.quantecon.org/intro.html), especially chapters 1 to 5
- [Julia for Economists Bootcamp](https://github.com/cpfiffer/julia-bootcamp-2022), by Cameron Pfiffer
- [Using Julia in Visual Studio Code](https://code.visualstudio.com/docs/languages/julia)
- [Jupyter Cheatsheet from DataCamp](https://www.datacamp.com/cheat-sheet/julia-basics-cheat-sheet)
- [JuliaPraxis](https://github.com/JuliaPraxis), best practices for naming, spacing, comments, etc
- [Performance tips from Julia Documentation](https://docs.julialang.org/en/v1/manual/performance-tips)
- [Project Euler](https://projecteuler.net/)



#### Version control, git, GitHub

- [Git basics: What is version control?](http://git-scm.com/video/what-is-version-control)
- [Software Carpentry: Version Control with Git](https://swcarpentry.github.io/git-novice/)

#### Command-line and Unix

- [Software Carpentry: The Unix Shell]((https://swcarpentry.github.io/shell-novice/))
- [Slides by Clément Mazet-Sonilhac (Sciences Po)](https://github.com/CMS27/IP2019/blob/master/Lectures/IP_UnixShell_S23.pdf)


## Unit 2: Fundamentals of Numerical Methods

### Readings

**Numerical Arithmetic**

-	[MF02] Chapter 2, Appendix 2A 
-	[J98] Section 2.7

**Numerical differentiation and integration**

-	[MF02] Chapter 5
-	[J98] Chapter 3
-	[NW06] Chapter 8

### Technical references

- [JuliaDiff](https://juliadiff.org/): List of packages for numerical differentiation in Julia
- [FiniteDifferences.jl](https://github.com/JuliaDiff/FiniteDifferences.jl): High accuracy derivatives, estimated via numerical finite differences
- [ForwardDiff.jl](https://github.com/JuliaDiff/ForwardDiff.jl): Forward Mode Automatic Differentiation for Julia (github.com)
- [Symbolics.jl](https://symbolics.juliasymbolics.org/stable/): A package to manipulate symbolic (analytical) objects


## Unit 3: Systems of Equations

### Readings

**Linear Equations**
- [MF02] Chapter 2
- [J98] Chapter 3

**Nonlinear Equations**

- [MF02] Chapter 3
- [J98] Chapter 5


### Examples

- [Pluto.jl: Interactive visualization of Newton's Method](https://featured.plutojl.org/computational-thinking/newton.html)


### Technical references

- [NLSolve](https://github.com/JuliaNLSolvers/NLsolve.jl)
  
  

## Unit 4: Optimization

### Readings

**Unconstrained optimization**

- [MF02] Chapter 4
- [NW06] Chapter 2
- Line search methods: [NW06] Chapter 3
- Trust region methods: [NW06] Chapter 4
- [J98] Chapter 4
- [CT05] Chapter 10

**Constrained optimization**

- [MF02] Chapter 4
- [NW06] Chapters 12, 15
- Penalty methods: [NW06] Chapter 17
- Interior point methods: [NW06] Chapter 19
- [J98] Chapter 4
- Dixit, Avinash K. (1990) Optimization in Economic Theory, 2nd Edition


### Technical references

- [Optim.jl documentation and tutorials](https://julianlsolvers.github.io/Optim.jl/stable/)
- [JuMP.jl documentation and tutorials](https://jump.dev/)
- [Ipopt Documentation](https://coin-or.github.io/Ipopt/index.html)



## Unit 6: Introduction to Structural Estimation

### Readings

- Reiss, P. C., & Wolak, F. A. (2007). Structural econometric modeling: Rationales and examples from industrial organization. Handbook of econometrics, 6, 4277-4415. [[Link]](https://doi.org/10.1016/S1573-4412(07)06064-3) 
  - Read chapters 1 to 3
- Timmins, C., & Schlenker, W. (2009). Reduced-form versus structural modeling in environmental and resource economics. Annu. Rev. Resour. Econ., 1(1), 351-380. [[Link]](https://doi.org/10.1146/annurev.resource.050708.144119)



## Tutorials & Extra resources

- Manipulating data with [DataFrames.jl](https://julia.school/julia/dataframes)
- [Simulation examples of estimator convergence rates](https://mcknaus.github.io/assets/notebooks/SNB/SNB_Convergence_rates.nb), by Michael Knaus



## Unit 7: Generalized Method of Moments

### Readings

-	[CT05] Chapter 6
-	[G18] Chapter 13
-	[Michael Creel's lecture notes](https://github.com/mcreel/Econometrics), Ch. 16
- Appendix from Hortaçsu, A., & Joo, J. (2023). Structural econometric modeling in industrial organization and quantitative marketing: theory and applications. 


## Unit 8: Maximum Likelihood Estimator

### Readings

- [CT05] Chapters 11 and 12
- [G18] Chapter 15
- [Michael Creel's lecture notes](https://github.com/mcreel/Econometrics), Ch. 22
- Appendix from Hortaçsu, A., & Joo, J. (2023). Structural econometric modeling in industrial organization and quantitative marketing: theory and applications. 

For discrete choice modeling:

- Hortaçsu, A., & Joo, J. (2023). Structural econometric modeling in industrial organization and quantitative marketing: theory and applications. Ch. 2.1 and 2.2
- Train, K. (2009). Discrete Choice Methods with Simulation. Available at [https://eml.berkeley.edu/books/choice2.html](https://eml.berkeley.edu/books/choice2.html)

