#' Set the NDAP API Key as an Environment Variable
#'
#' This function saves your personal NDAP API key to your
#' \code{.Renviron} file, allowing the \code{randap} package
#' to access the API without hardcoding the key.
#'
#' @param key The character string containing your NDAP API key.
#' @return The function is called for its side effect of setting
#'   the environment variable. It returns \code{NULL} invisibly.
#' @examples
#' \dontrun{
#' ndap_set_key("YOUR_ACTUAL_API_KEY_HERE")
#' }
ndap_set_key <- function(key) {
  if (missing(key)) {
    stop("Please provide your NDAP API key.")
  }

  usethis::edit_r_environ()
  # This opens the .Renviron file for editing.
  # The user needs to manually add a line like: NDAP_KEY='yourkey'
  # and restart R for changes to take effect.

  # A simpler version for beginners that sets the key for the current session:
  Sys.setenv(NDAP_KEY = key)
  message("API Key set for the current R session (environment variable: NDAP_KEY).")
  message("To save it permanently, add NDAP_KEY='YOUR_KEY' to your .Renviron file.")

  invisible(NULL)
}

# An internal helper function to retrieve the key securely
.get_ndap_key <- function() {
  key <- Sys.getenv("NDAP_KEY")
  if (key == "") {
    stop("NDAP API key not found. Please run ndap_set_key() first.", call. = FALSE)
  }
  return(key)
}
