# Generated by using Rcpp::compileAttributes() -> do not edit by hand
# Generator token: 10BE3573-1514-4C36-9D1C-5A225CD40393

aHinvb_out <- function(a, b, u, ev) {
    .Call('_RAINBOWR_aHinvb_out', PACKAGE = 'RAINBOWR', a, b, u, ev)
}

aPb_series_out <- function(a, b, u, ev, x) {
    .Call('_RAINBOWR_aPb_series_out', PACKAGE = 'RAINBOWR', a, b, u, ev, x)
}

llik_out <- function(n, p, logH, yPy, logXtX, logXtHinvX, REML = TRUE) {
    .Call('_RAINBOWR_llik_out', PACKAGE = 'RAINBOWR', n, p, logH, yPy, logXtX, logXtHinvX, REML)
}

score_func_out <- function(n, p, tr_HinvG, yPy, yPGPy, tr_PG, REML = TRUE) {
    .Call('_RAINBOWR_score_func_out', PACKAGE = 'RAINBOWR', n, p, tr_HinvG, yPy, yPGPy, tr_PG, REML)
}

hess_func_out <- function(n, p, tr_HinvG2, yPy, yPGPy, yPGPGPy, tr_PG2, REML = TRUE) {
    .Call('_RAINBOWR_hess_func_out', PACKAGE = 'RAINBOWR', n, p, tr_HinvG2, yPy, yPGPy, yPGPGPy, tr_PG2, REML)
}

ml_est_out <- function(lambda, y, x, u, delta, z, k, logXtX, conv_param = 1e-06, count_max = 15L, bounds1 = 1e-06, bounds2 = 1e06, REML = TRUE) {
    .Call('_RAINBOWR_ml_est_out', PACKAGE = 'RAINBOWR', lambda, y, x, u, delta, z, k, logXtX, conv_param, count_max, bounds1, bounds2, REML)
}

eigen_out <- function(a, symmetric = TRUE, ainv = FALSE) {
    .Call('_RAINBOWR_eigen_out', PACKAGE = 'RAINBOWR', a, symmetric, ainv)
}

ml_one_step <- function(lambda, y, x, u, delta, z, k, logXtX, conv_param = 1e-06, count_max = 15L, bounds1 = 1e-06, bounds2 = 1e06, REML = TRUE, SE = FALSE, return_Hinv = TRUE) {
    .Call('_RAINBOWR_ml_one_step', PACKAGE = 'RAINBOWR', lambda, y, x, u, delta, z, k, logXtX, conv_param, count_max, bounds1, bounds2, REML, SE, return_Hinv)
}

spectralG_cholesky <- function(zbt, x, return_G = TRUE, return_SGS = FALSE) {
    .Call('_RAINBOWR_spectralG_cholesky', PACKAGE = 'RAINBOWR', zbt, x, return_G, return_SGS)
}

spectralG_eigen <- function(zkzt, x, return_G = TRUE, return_SGS = FALSE) {
    .Call('_RAINBOWR_spectralG_eigen', PACKAGE = 'RAINBOWR', zkzt, x, return_G, return_SGS)
}

EMM2_last_step <- function(lambda, y, x, u, d, z, k, th, ome_sq, ph, maxval, n, p, df, SE = FALSE, return_Hinv = FALSE) {
    .Call('_RAINBOWR_EMM2_last_step', PACKAGE = 'RAINBOWR', lambda, y, x, u, d, z, k, th, ome_sq, ph, maxval, n, p, df, SE, return_Hinv)
}

EM3_kernel <- function(y0, X0, ZKZt0, S0, spI0, n, p, REML = TRUE) {
    .Call('_RAINBOWR_EM3_kernel', PACKAGE = 'RAINBOWR', y0, X0, ZKZt0, S0, spI0, n, p, REML)
}

P_calc <- function(lambda, Ws, Gammas, u, d, lw, Pornot = TRUE, gammas_diag = TRUE) {
    .Call('_RAINBOWR_P_calc', PACKAGE = 'RAINBOWR', lambda, Ws, Gammas, u, d, lw, Pornot, gammas_diag)
}

llik_REML <- function(n, p, yPy, lnP) {
    .Call('_RAINBOWR_llik_REML', PACKAGE = 'RAINBOWR', n, p, yPy, lnP)
}

llik_ML <- function(n, yPy, lnHinv) {
    .Call('_RAINBOWR_llik_ML', PACKAGE = 'RAINBOWR', n, yPy, lnHinv)
}

score_l1 <- function(y, p0, Gs, lg) {
    .Call('_RAINBOWR_score_l1', PACKAGE = 'RAINBOWR', y, p0, Gs, lg)
}

score_l1_linker <- function(y, p0, Ws, Gammas, lw) {
    .Call('_RAINBOWR_score_l1_linker', PACKAGE = 'RAINBOWR', y, p0, Ws, Gammas, lw)
}

score_l1_linker_diag <- function(y, p0, W2s, lw) {
    .Call('_RAINBOWR_score_l1_linker_diag', PACKAGE = 'RAINBOWR', y, p0, W2s, lw)
}

score_fisher <- function(p0, Gs_all, nuisance_no, lg_all) {
    .Call('_RAINBOWR_score_fisher', PACKAGE = 'RAINBOWR', p0, Gs_all, nuisance_no, lg_all)
}

score_fisher_linker <- function(p0, Gs_all, Gammas, nuisance_no, lw_all) {
    .Call('_RAINBOWR_score_fisher_linker', PACKAGE = 'RAINBOWR', p0, Gs_all, Gammas, nuisance_no, lw_all)
}

score_fisher_linker_diag <- function(p0, Gs_all, nuisance_no, lw_all) {
    .Call('_RAINBOWR_score_fisher_linker_diag', PACKAGE = 'RAINBOWR', p0, Gs_all, nuisance_no, lw_all)
}

GWAS_F_test <- function(y, x, hinv, v1, v2, p) {
    .Call('_RAINBOWR_GWAS_F_test', PACKAGE = 'RAINBOWR', y, x, hinv, v1, v2, p)
}

