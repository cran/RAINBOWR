% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/other_useful_functions.R
\name{estPhylo}
\alias{estPhylo}
\title{Function to estimate & plot phylogenetic tree}
\usage{
estPhylo(
  blockInterest = NULL,
  gwasRes = NULL,
  nTopRes = 1,
  gene.set = NULL,
  indexRegion = 1:10,
  chrInterest = NULL,
  posRegion = NULL,
  blockName = NULL,
  nHaplo = NULL,
  pheno = NULL,
  geno = NULL,
  ZETA = NULL,
  chi2Test = TRUE,
  thresChi2Test = 0.05,
  plotTree = TRUE,
  distMat = NULL,
  distMethod = "manhattan",
  evolutionDist = FALSE,
  subpopInfo = NULL,
  groupingMethod = "kmedoids",
  nGrp = 3,
  nIterClustering = 100,
  kernelTypes = "addNOIA",
  n.core = parallel::detectCores() - 1,
  parallel.method = "mclapply",
  hOpt = "optimized",
  hOpt2 = "optimized",
  maxIter = 20,
  rangeHStart = 10^c(-1:1),
  saveName = NULL,
  saveStyle = "png",
  pchBase = c(1, 16),
  colNodeBase = c(2, 4),
  colTipBase = c(3, 5, 6),
  cexMax = 2,
  cexMin = 0.7,
  edgeColoring = TRUE,
  tipLabel = TRUE,
  ggPlotTree = FALSE,
  cexMaxForGG = 0.12,
  cexMinForGG = 0.06,
  alphaBase = c(0.9, 0.3),
  verbose = TRUE
)
}
\arguments{
\item{blockInterest}{A \eqn{n \times M} matrix representing the marker genotype that belongs to the haplotype block of interest.
If this argument is NULL, this argument will automatically be determined by `geno`,}

\item{gwasRes}{You can use the results (data.frame) of haplotype-based (SNP-set) GWAS by `RGWAS.multisnp` function.}

\item{nTopRes}{Haplotype blocks (or gene sets, SNP-sets) with top `nTopRes` p-values by `gwasRes` will be used.}

\item{gene.set}{If you have information of gene (or haplotype block), you can use it to perform kernel-based GWAS.
You should assign your gene information to gene.set in the form of a "data.frame" (whose dimension is (the number of gene) x 2).
In the first column, you should assign the gene name. And in the second column, you should assign the names of each marker,
which correspond to the marker names of "geno" argument.}

\item{indexRegion}{You can specify the haplotype block (or gene set, SNP-set) of interest by the marker index in `geno`.}

\item{chrInterest}{You can specify the haplotype block (or gene set, SNP-set) of interest by the marker position in `geno`.
Please assign the chromosome number to this argument.}

\item{posRegion}{You can specify the haplotype block (or gene set, SNP-set) of interest by the marker position in `geno`.
Please assign the position in the chromosome to this argument.}

\item{blockName}{You can specify the haplotype block (or gene set, SNP-set) of interest by the name of haplotype block in `geno`.}

\item{nHaplo}{Number of haplotypes. If not defined, this is automatically defined by the data.
If defined, k-medoids clustering is performed to define haplotypes.}

\item{pheno}{Data frame where the first column is the line name (gid).
The remaining columns should be a phenotype to test.}

\item{geno}{Data frame with the marker names in the first column. The second and third columns contain the chromosome and map position.
Columns 4 and higher contain the marker scores for each line, coded as [-1, 0, 1] = [aa, Aa, AA].}

\item{ZETA}{A list of covariance (relationship) matrix (K: \eqn{m \times m}) and its design matrix (Z: \eqn{n \times m}) of random effects.
Please set names of list "Z" and "K"! You can use more than one kernel matrix.
For example,

ZETA = list(A = list(Z = Z.A, K = K.A), D = list(Z = Z.D, K = K.D))
\describe{
\item{Z.A, Z.D}{Design matrix (\eqn{n \times m}) for the random effects. So, in many cases, you can use the identity matrix.}
\item{K.A, K.D}{Different kernels which express some relationships between lines.}
}
For example, K.A is additive relationship matrix for the covariance between lines, and K.D is dominance relationship matrix.}

\item{chi2Test}{If TRUE, chi-square test for the relationship between haplotypes & subpopulations will be performed.}

\item{thresChi2Test}{The threshold for the chi-square test.}

\item{plotTree}{If TRUE, the function will return the plot of phylogenetic tree.}

\item{distMat}{You can assign the distance matrix of the block of interest.
If NULL, the distance matrix will be computed in this function.}

\item{distMethod}{You can choose the method to calculate distance between accessions.
This argument corresponds to the `method` argument in the `dist` function.}

\item{evolutionDist}{If TRUE, the evolution distance will be used instead of the pure distance.
The `distMat` will be converted to the distance matrix by the evolution distance.}

\item{subpopInfo}{The information of subpopulations. This argument should be a vector of factor.}

\item{groupingMethod}{If `subpopInfo` argument is NULL, this function estimates subpopulation information from marker genotype.
You can choose the grouping method from `kmeans`, `kmedoids`, and `hclust`.}

\item{nGrp}{The number of groups (or subpopulations) grouped by `groupingMethod`.
If this argument is 0, the subpopulation information will not be estimated.}

\item{nIterClustering}{If `groupingMethod` = `kmeans`, the clustering will be performed multiple times.
This argument specifies the number of classification performed by the function.}

\item{kernelTypes}{In the function, similarlity matrix between accessions will be computed from marker genotype to estimate genotypic values.
This argument specifies the method to compute similarity matrix:
If this argument is `addNOIA` (or one of other options in `methodGRM` in `calcGRM`),
then the `addNOIA` (or corresponding) option in the `calcGRM` function will be used,
and if this argument is `phylo`, the gaussian kernel based on phylogenetic distance will be computed from phylogenetic tree.
You can assign more than one kernelTypes for this argument; for example, kernelTypes = c("addNOIA", "phylo").}

\item{n.core}{Setting n.core > 1 will enable parallel execution on a machine with multiple cores.
This argument is not valid when `parallel.method = "furrr"`.}

\item{parallel.method}{Method for parallel computation in optimizing hyperparameters for estimating haplotype effects.
 We offer three methods, "mclapply", "furrr", and "foreach".

When `parallel.method = "mclapply"`, we utilize \code{\link[pbmcapply]{pbmclapply}} function in the `pbmcapply` package
with `count = TRUE` and \code{\link[parallel]{mclapply}} function in the `parallel` package with `count = FALSE`.

When `parallel.method = "furrr"`, we utilize \code{\link[furrr]{future_map}} function in the `furrr` package.
With `count = TRUE`, we also utilize \code{\link[progressr]{progressor}} function in the `progressr` package to show the progress bar,
so please install the `progressr` package from github (\url{https://github.com/futureverse/progressr}).
For `parallel.method = "furrr"`, you can perform multi-thread parallelization by
sharing memories, which results in saving your memory, but quite slower compared to `parallel.method = "mclapply"`.

When `parallel.method = "foreach"`, we utilize \code{\link[foreach]{foreach}} function in the `foreach` package
with the utilization of \code{\link[parallel]{makeCluster}} function in `parallel` package,
and \code{\link[doParallel]{registerDoParallel}} function in `doParallel` package.
With `count = TRUE`, we also utilize \code{\link[utils]{setTxtProgressBar}} and
\code{\link[utils]{txtProgressBar}} functions in the `utils` package to show the progress bar.

We recommend that you use the option `parallel.method = "mclapply"`, but for Windows users,
this parallelization method is not supported. So, if you are Windows user,
we recommend that you use the option `parallel.method = "foreach"`.}

\item{hOpt}{Optimized hyper parameter for constructing kernel when estimating haplotype effects.
If hOpt = "optimized", hyper parameter will be optimized in the function.
If hOpt = "tuned", hyper parameter will be replaced by the median of off-diagonal of distance matrix.
If hOpt is numeric, that value will be directly used in the function.}

\item{hOpt2}{Optimized hyper parameter for constructing kernel when estimating haplotype effects of nodes.
If hOpt2 = "optimized", hyper parameter will be optimized in the function.
If hOpt2 = "tuned", hyper parameter will be replaced by the median of off-diagonal of distance matrix.
If hOpt2 is numeric, that value will be directly used in the function.}

\item{maxIter}{Max number of iterations for optimization algorithm.}

\item{rangeHStart}{The median of off-diagonal of distance matrix multiplied by rangeHStart will be used
as the initial values for optimization of hyper parameters.}

\item{saveName}{When drawing any plot, you can save plots in png format. In saveName, you should substitute the name you want to save.
When saveName = NULL, the plot is not saved.}

\item{saveStyle}{This argument specifies how to save the plot of phylogenetic tree.
The function offers `png`, `pdf`, `jpg`, and `tiff`.}

\item{pchBase}{A vector of two integers specifying the plot types for the positive and negative genotypic values respectively.}

\item{colNodeBase}{A vector of two integers or chracters specifying color of nodes for the positive and negative genotypic values respectively.}

\item{colTipBase}{A vector of integers or chracters specifying color of tips for the positive and negative genotypic values respectively.
The length of the vector should equal to the number of subpopulations.}

\item{cexMax}{A numeric specifying the maximum point size of the plot.}

\item{cexMin}{A numeric specifying the minimum point size of the plot.}

\item{edgeColoring}{If TRUE, the edge branch of phylogenetic tree wiil be colored.}

\item{tipLabel}{If TRUE, lavels for tips will be shown.}

\item{ggPlotTree}{If TRUE, the function will return the ggplot version of phylogenetic tree.
It offers the precise information on subgroups for each haplotype.}

\item{cexMaxForGG}{A numeric specifying the maximum point size of the plot for ggtree,
relative to the range of x and y-axes (0 < cexMaxForGG <= 1).}

\item{cexMinForGG}{A numeric specifying the minimum point size of the plot for ggtree,
relative to the range of x and y-axes (0 < cexMaxForGG <= 1).}

\item{alphaBase}{alpha (parameter that indicates the opacity of a geom) for tip with positive / negative effects.
alpha for node will be same as the alpha for tip with negative effects.}

\item{verbose}{If this argument is TRUE, messages for the current step_s will be shown.}
}
\value{
\describe{A list / lists of
\item{$haplotypeInfo}{\describe{A list of haplotype information with
\item{$haploCluster}{A vector indicating each individual belongs to which haplotypes.}
\item{$haploMat}{A n x h matrix where n is the number of genotypes and h is the number of haplotypes.}
\item{$haploBlock}{Marker genotype of haplotype block of interest for the representing haplotypes.}
}
}
\item{$subpopInfo}{The information of subpopulations.}
\item{$distMats}{\describe{A list of distance matrix:
\item{$distMat}{Distance matrix between haplotypes.}
\item{$distMatEvol}{Evolutionary distance matrix between haplotypes.}
\item{$distMatNJ}{Phylogenetic distance matrix between haplotypes including nodes.}
}
}
\item{$pValChi2Test}{A p-value of the chi-square test for the dependency between haplotypes & subpopulations.
If `chi2Test = FALSE`, `NA` will be returned.}
\item{$njRes}{The result of phylogenetic tree by neighborhood-joining method}
\item{$gvTotal}{Estimated genotypic values by kernel regression for each haplotype.}
\item{$gvTotalForLine}{Estimated genotypic values by kernel regression for each individual.}
\item{$minuslog10p}{\eqn{-log_{10}(p)} for haplotype block of interest.
 p is the p-value for the siginifacance of the haplotype block effect.}
\item{$hOpts}{Optimized hyper parameters, hOpt1 & hOpt2.}
\item{$EMMResults}{\describe{A list of estimated results of kernel regression:
\item{$EM3Res}{Estimated results of kernel regression for the estimation of haplotype effects. (1st step)}
\item{$EMMRes}{Estimated results of kernel regression for the estimation of haplotype effects of nodes. (2nd step)}
\item{$EMM0Res}{Estimated results of kernel regression for the null model.}
}
}
\item{$clusterNosForHaplotype}{A list of cluster Nos of individuals that belong to each haplotype.}
}
}
\description{
Function to estimate & plot phylogenetic tree
}
