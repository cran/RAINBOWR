% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/EMM_functions_cpp.R
\name{EMM2.cpp}
\alias{EMM2.cpp}
\title{Equation of mixed model for one kernel, EMMA-based method (inplemented by Rcpp)}
\usage{
EMM2.cpp(
  y,
  X = NULL,
  ZETA,
  eigen.G = NULL,
  eigen.SGS = NULL,
  tol = NULL,
  optimizer = "nlminb",
  traceInside = 0,
  REML = TRUE,
  bounds = c(1e-09, 1e+09),
  SE = FALSE,
  return.Hinv = FALSE
)
}
\arguments{
\item{y}{A \eqn{n \times 1} vector. A vector of phenotypic values should be used. NA is allowed.}

\item{X}{A \eqn{n \times p} matrix. You should assign mean vector (rep(1, n)) and covariates. NA is not allowed.}

\item{ZETA}{A list of variance (relationship) matrix (K; \eqn{m \times m}) and its design matrix (Z; \eqn{n \times m}) of random effects. You can use only one kernel matrix.
For example, ZETA = list(A = list(Z = Z, K = K))
Please set names of list "Z" and "K"!}

\item{eigen.G}{A list with
\describe{
\item{$values}{Eigen values}
\item{$vectors}{Eigen vectors}
}
The result of the eigen decompsition of \eqn{G = ZKZ'}. You can use "spectralG.cpp" function in RAINBOWR.
If this argument is NULL, the eigen decomposition will be performed in this function.
We recommend you assign the result of the eigen decomposition beforehand for time saving.}

\item{eigen.SGS}{A list with
\describe{
\item{$values}{Eigen values}
\item{$vectors}{Eigen vectors}
}
The result of the eigen decompsition of \eqn{SGS}, where \eqn{S = I - X(X'X)^{-1}X'}, \eqn{G = ZKZ'}.
You can use "spectralG.cpp" function in RAINBOWR.
If this argument is NULL, the eigen decomposition will be performed in this function.
We recommend you assign the result of the eigen decomposition beforehand for time saving.}

\item{tol}{The tolerance for detecting linear dependencies in the columns of G = ZKZ'.
Eigen vectors whose eigen values are less than "tol" argument will be omitted from results.
If tol is NULL, top 'n' eigen values will be effective.}

\item{optimizer}{The function used in the optimization process. We offer "optim", "optimx", and "nlminb" functions.}

\item{traceInside}{Perform trace for the optimzation if traceInside >= 1, and this argument shows the frequency of reports.}

\item{REML}{You can choose which method you will use, "REML" or "ML".
If REML = TRUE, you will perform "REML", and if REML = FALSE, you will perform "ML".}

\item{bounds}{Lower and Upper bounds of the parameter lambda. If the updated parameter goes out of this range,
the parameter is reset to the value in this range.}

\item{SE}{If TRUE, standard errors are calculated.}

\item{return.Hinv}{If TRUE, the function returns the inverse of \eqn{H = ZKZ' + \lambda I} where \eqn{\lambda = \sigma^2_e / \sigma^2_u}. This is useful for GWAS.}
}
\value{
\describe{
\item{$Vu}{Estimator for \eqn{\sigma^2_u}}
\item{$Ve}{Estimator for \eqn{\sigma^2_e}}
\item{$beta}{BLUE(\eqn{\beta})}
\item{$u}{BLUP(\eqn{u})}
\item{$LL}{Maximized log-likelihood (full or restricted, depending on method)}
\item{$beta.SE}{Standard error for \eqn{\beta} (If SE = TRUE)}
\item{$u.SE}{Standard error for \eqn{u^*-u} (If SE = TRUE)}
\item{$Hinv}{The inverse of \eqn{H = ZKZ' + \lambda I} (If return.Hinv = TRUE)}
}
}
\description{
This function solves single-kernel linear mixed model by EMMA
 (efficient mixed model association; Kang et al., 2008) approach.
}
\references{
Kang, H.M. et al. (2008) Efficient Control of Population Structure
 in Model Organism Association Mapping. Genetics. 178(3): 1709-1723.
}
