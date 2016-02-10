% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/table-insert.R
\docType{methods}
\name{sqlAppendTable}
\alias{sqlAppendTable}
\alias{sqlAppendTable,DBIConnection-method}
\alias{sqlAppendTableTemplate}
\title{Insert rows into a table.}
\usage{
sqlAppendTable(con, table, values, row.names = NA, ...)

\S4method{sqlAppendTable}{DBIConnection}(con, table, values, row.names = NA,
  ...)

sqlAppendTableTemplate(con, table, values, row.names = NA, prefix = "?",
  ...)
}
\arguments{
\item{con}{A database connection.}

\item{table}{Name of the table. Escaped with
\code{\link[DBI]{dbQuoteIdentifier}}.}

\item{values}{A data frame. Factors will be converted to character vectors.
Character vectors will be escaped with \code{\link[DBI]{dbQuoteString}}.}

\item{row.names}{Either \code{TRUE}, \code{FALSE}, \code{NA} or a string.

  If \code{TRUE}, always translate row names to a column called "row_names".
  If \code{FALSE}, never translate row names. If \code{NA}, translate
  rownames only if they're a character vector.

  A string is equivalent to \code{TRUE}, but allows you to override the
  default name.

  For backward compatibility, \code{NULL} is equivalent to \code{FALSE}.}

\item{...}{Other arguments used by individual methods.}

\item{prefix}{Parameter prefix to put in front of column id.}
}
\description{
\code{sqlAppendTable} generates a single SQL string that inserts a
data frame into an existing table. \code{sqlAppendTableTemplate} generates
a template suitable for use with \code{\link{dbBind}}.
}
\examples{
sqlAppendTable(ANSI(), "iris", head(iris))

sqlAppendTable(ANSI(), "mtcars", head(mtcars))
sqlAppendTable(ANSI(), "mtcars", head(mtcars), row.names = FALSE)
sqlAppendTableTemplate(ANSI(), "iris", iris)

sqlAppendTableTemplate(ANSI(), "mtcars", mtcars)
sqlAppendTableTemplate(ANSI(), "mtcars", mtcars, row.names = FALSE)
}
