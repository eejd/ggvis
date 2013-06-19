#' S3 class: pipe
#' 
#' This function is used to create pipe classes and subclasses.
#' 
#' @keywords internal
#' @export
pipe <- function(..., type = NULL) {
  structure(
    list(...), 
    type = type,
    class = c(type, "pipe")
  )
}

#' @export
#' @rdname pipe
is.pipe <- function(x) inherits(x, "pipe")

#' @export
#' @rdname pipe
as.pipe <- function(x, ...) UseMethod("as.pipe")

#' @S3method as.pipe pipe
as.pipe.pipe <- function(x, ...) x

#' @S3method as.pipe data.frame
as.pipe.data.frame <- function(x, name = deparse(substitute(x)), ...) {
  source_eager(x, name = name)
}

#' @S3mthod as.pipe NULL
as.pipe.NULL <- function(x, ...) {
  NULL
}

#' @S3method as.pipe character
as.pipe.character <- function(x, ...) {
  source_lazy(x)
}

#' @S3method print pipe
print.pipe <- function(x, ...) {
  cat(format(x, ...), "\n", sep = "")
}