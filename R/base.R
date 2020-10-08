# gives a tidy representation of of loaded packages and their version number
package_versions <- function(packages=NULL, base=FALSE, sort=FALSE) {
  #' Determine package versions.
  #'
  #' @param packages Packages to query; if not specified (or \code{NULL}),
  #' all currently attached packages are queried.
  #' @param base If \code{TRUE}, include the base package (R version).
  #' @param sort If \code{TRUE}, sort package names alphabetically.
  #' @return Data frame with package names and corresponding versions.
  if (is.null(packages))
    packages <- names(sessionInfo()$otherPkgs)
  if (base)
    packages <- c("base", packages)
  if (sort)
    packages <- sort(packages)
  if (!is.null(packages)) {
    tmp <- data.frame(sapply(sapply(packages, packageVersion, simplify=FALSE), as.character))
    colnames(tmp) <- "version"
    data.frame(package=rownames(tmp), version=tmp[1], row.names=NULL)
  }
}
