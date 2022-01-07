# Nov 16, 2019, RAINBOWR version 0.1.15
## Major changes
We fixed some parts related to the treatment of the missing in marker genotypes.

- As the previous version, if the marker genotype has missing values, errors will be occurred in `RGWAS.normal`, `RGWAS.multisnp`, `RGWAS.epistasis`, `RGWAS.twostep`, and `RGWAS.twostep.epi` functions.



- Then, we changed the R code in the `RGWAS.normal`, `RGWAS.multisnp`, and `RGWAS.epistasis` functions as follows.

- Before
```
M.now <- Z.A[not.NA, ] %*% M
```

- After
```
if (sum(is.na(M)) == 0) {
M.now <- Z.A[not.NA, ] %*% M
} else {
M.now <- M[apply(Z.A[not.NA, ], 1, function(x) which(x == 1)), ]
}
```





# Apr 28, 2020, RAINBOWR version 0.1.16
## Major changes
- We added the citation file for RAINBOWR becuase our paper about RAINBOWR had been published in PLOS Computational Biology (https://journals.plos.org/ploscompbiol/article?id=10.1371/journal.pcbi.1007663). We also changed the `Description` in the `DESCRIPTION` file to update the reference information.



- We added the `estPhylo` function to estimate and plot the phylogenetic tree for the block of interest. This function will also estimate the genotypic values for the block of interest. We also added `ape` and `cluster` packages in the `NAMESPACE` and `DESCRIPTION` files because these packages are used in the `estPhylo` function.






# Apr 29, 2020, RAINBOWR version 0.1.17
## Major changes
- In version 0.1.16, the following NOTE was shown:

```
Found the following (possibly) invalid URLs:
URL: https://cran.r-project.org/web/packages/RAINBOWR/index.html
From: inst/doc/RAINBOWR.html
README.md
Status: 200
Message: OK
CRAN URL not in canonical form
The canonical URL of the CRAN page for a package is
https://CRAN.R-project.org/package=pkgname
```

Then, we fixed this by using the canonical URL of the CRAN package "https://cran.r-project.org/package=RAINBOWR" in `inst/doc/RAINBOWR.html` and `README.md` files.



# Mar 19, 2020, RAINBOWR version 0.1.18
## Major changes
- Important error about `spectralG.cpp` function was fixed thanks to Dr. Ishimori.
- `class(obj) == "try-error"` was modified to `try-error %in% class(obj)` in order to deal with the cases where the obj has more than one class (to avoid warnings).


# Jul 22, 2020, RAINBOWR version 0.1.19
## Major changes
- We added the `calcGRM` function to calculate genomic relationship matrix (GRM). The parts that calculate GRMs in other functions and examples were replaced to use `calcGRM` function. We also added `stringr` package in the `NAMESPACE` and `DESCRIPTION` files because these packages are used in the `calcGRM` function.

- We fixed some parts related to estimate the siginificance of dominance effects in `score.calc.LR`, `score.calc.LR.MC`, `score.calc.score`, `score.calc.score.MC`, `score.epistasis.LR`, `score.epistasis.score` functions.



# Aug 01, 2020, RAINBOWR version 0.1.20
## Major changes
- We added the `estNetwork` function to estimate and plot haplotype network. We also added `pegas` package in the `NAMESPACE` and `DESCRIPTION` files because this package is used in the `estNetwork` function.

- We fixed some parts related to the estimation of haplotype effects in the `estPhylo` function. We also added the optimization part both in the `estPhylo` & `estNetwork` functions.




# Aug 18, 2020, RAINBOWR version 0.1.21
## Major changes
- We modified the `estPhylo` and `estNetwork` functions. Now, these functions can output the ggplot version of phylogenetic trees or haplotype networks. We also added `ggtree`, `ggplot2`, `scatterpie`, `phylobase`, `haplotypes`, and `ggimage` packages in the `NAMESPACE` and `DESCRIPTION` files because these packages are used in the `estPhylo` and `estNetwork` functions.

- We also added the `plotPhyloTree` and `plotHaploNetwork` functions to plot phylogenetic tree / haplotype network from the estimated results.





# Oct 29, 2020, RAINBOWR version 0.1.22
## Major changes
- To deal with the error for the Windows user, we modified the package so that the user can select the number of cores even for solving the mixed-effects model with GEMMA (`EMM1.cpp` function). We also added the argument `n.core` for the functions that includes the mixed-effects model by `EMM1.cpp`.



# Nov 03, 2020, RAINBOWR version 0.1.23
## Major changes
- To deal with the error for the case where the chromosome numbers do not start from chromosome 1, we fix the scripts related to the treatment for genetic map. 


# Nov 11, 2020, RAINBOWR version 0.1.24
## Major changes
- We fixed an error on computing a Gaussian kernel for phylogenetic relationship in `estPhylo` function.
- We also fixed an error in `genesetmap` function related to the case where the markers in haplotype block list are not included in the marker genotype.


# Dec 15, 2020, RAINBOWR version 0.1.25
## Major changes
- We removed a dependency on `rgl` package since the future of the `rgl` package is unstable. Instead, we used `plot_ly` function in `plotly` package to draw 3d plots for results of epistasis GWAS. We added dependency on `plotly`, `here`, and `htmlwidgets` packages.


# Jan 19, 2021, RAINBOWR version 0.1.26
## Major changes
- We added a dependency on `Rfast` package to perform the faster computation of distance matrix. We also added an option of `pamonce = 5` in `cluster::pam` function to save the cost of performing k-medoids analysis.

- We removed a dependency on `pblapply` package since the package is actually not needed in the RAINBOWR package. We also removed `parallel` package from Imports list in DESCRIPTION file because `parallel` package is initially installed in R. We also removed `plotly` package from Imports list, and moved it to Suggests list in the DESCRIPTION file.





# Apr 06, 2021, RAINBOWR version 0.1.27
## Major changes
- We removed `haplotypes` package from Imports list, and moved it to Suggests list in the DESCRIPTION file. This is because the package `phangorn`, which is used in the `haplotypes` package, is now scheduled for archival on 2021-04-19.



# Jan 05, 2022, RAINBOWR version 0.1.28
### NOTE: There is a very large change compared to the older version.We strongly recommend you install the latest version and check the following changes!!


## Major changes for correcting errors pointed by CRAN maintainers
- We removed `ggtree` package from Imports list, and moved it to Suggests list in the DESCRIPTION file. By doing this, errors caused by the installation of `ggtree` package are now eliminated.


## Major changes
- We implemented new functions for testing the interaction between each SNP and the genetic background. The functions to compute p-values for those effects are `score.calc.int` and `score.calc.int.MC`, and the function to perform SNP-based GWAS including such interaction effects is `RGWAS.normal.interaction`. We also added the to `NAMESPACE` file.

- We implemented a new function `is.diag`, which judges a matrix is diagonal or not.

- We implemented a new function `parallel.compute`, which enables us to perform parallel computation easily with the three different methods: `mclapply`, `furrr`, and `foreach`. This function is utilized in `score.calc.MC`, `score.calc.LR.MC`, `score.calc.score.MC`, `score.calc.epistasis.LR.MC`, `score.calc.epistasis.score.MC`, and `score.calc.int.MC` functions.

- We implemented a new function `EM3.general`, which enables us to solve mixed-effects model with the three different packages: `RAINBOWR`, `gaston`, and `MM4LMM`.

- We also added the four functions above to the NAMESPACE file to be exported correctly.

- We fixed some mistakes in `EM3.cpp` and `EM3.linker.cpp` functions when computing `Vinv`. We also added new arguments of `return.u.always`, `return.u.each`, and `return.Hinv`, and a new return of `u.each` as a `u` in the older version. We also modified a return of `u` to the summation of genotypic values.

- We rewrote the codes in `score.calc`, `score.calc.MC`, and `GWAS_F_test` (C++) functions so that it can test multiple fixed effects simultaneously.

- We fixed some parts in `RGWAS.normal`, `RGWAS.multisnp`, and `RGWAS.epstasis` functions when using `covariate`, `covariate.factor`, and `structure.matrix` arguments.

- We added a new argument `skip.check` in `RGWAS.normal`, `RGWAS.multisnp`, `RGWAS.epstasis`, `RGWAS.twostep`, and `RGWAS.twostep.epi` functions. As default, RAINBOWR checks the type of input data and modifies it into the correct format. However, it will take some time, so if you prepare the correct format of input data, you can skip this procedure by setting `skip.check = TRUE`.

- We introduced a new argument `package.MM` in `RGWAS.normal`, `RGWAS.multisnp`, `RGWAS.epstasis`, `RGWAS.twostep`, `RGWAS.twostep.epi`, `score.calc`, `score.calc.MC`, `score.calc.LR`, `score.calc.LR.MC`, `score.calc.epistasis.LR`, `score.calc.epistasis.LR.MC`, `score.calc.int`, and `score.calc.int.MC` functions. By changing this argument, you can choose which package is used to solve the mixed-effects model in GWAS from the following three packages: `RAINBOWR`, `gaston`, and `MM4LMM`.


- We introduced a new argument `parallel.method` in `RGWAS.normal`, `RGWAS.multisnp`, `RGWAS.epstasis`, `RGWAS.twostep`, `RGWAS.twostep.epi`, `score.calc.MC`, `score.calc.LR.MC`, `score.calc.score.MC`, `score.calc.epistasis.LR.MC`, `score.calc.epistasis.score.MC`, and `score.calc.int.MC` functions. In the older version, you can just use the `pbmcapply::pbmclapply` function for parallel computation, but now you can choose the parallel computation method from the following three methods: `mclapply`, `furrr`, and `foreach`.


- We largely corrected the functions related to epstatic tests; `RGWAS.epistasis`, `RGWAS.twostep.epi`, `score.calc.epistasis.LR`, `score.calc.epistasis.score`, `score.calc.epistasis.LR.MC`, and `score.calc.epistasis.score.MC` functions. This is because how to compute the interaction term between two haplotype blocks was wrong in the older version. We also added a new argument `skip.self.int` to choose whether skipping the computation for the epistatsis of self-interaction.


- We added `gaston` and `MM4LMM` packages to Imports list in the DESCRIPTION file because these packages are required when you use these packages with `package.MM` argument. We also added `lmm.aireml`, `lmm.diago`, and `MMEst` functions to be imported in the NAMESPACE file.


- We added `adegenet`, `furrr`, `future`, `progressr`, `foreach`, and `doParallel` packages to Suggests list in the DESCRIPTION file according to the implementation of new functions and arguments.We also removed `ggplot2`, `ggtree`, `scatterpie`, and `phylobase` packages from Imports list, and moved it to Suggests list in the DESCRIPTION file.




# Jan 06, 2022, RAINBOWR version 0.1.29
## Major changes
- We modified the example files corresponding to `RGWAS.normal`, `RGWAS.normal.interaction`, `RGWAS.multisnp`, `RGWAS.epstasis`, `RGWAS.twostep`, and `RGWAS.twostep.epi` functions because there were some modifications with the function arguments.