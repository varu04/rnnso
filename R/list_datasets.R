#' List All Available NDAP Datasets
#'
#' Connects to the NDAP API to retrieve a catalog of all currently
#' available datasets.
#'
#' @return A tibble (data frame) containing dataset metadata,
#'   including ID, title, organization, and update frequency.
#' @export
#'
#' @examples
#' \dontrun{
#' if (Sys.getenv("NDAP_KEY") != "") {
#'   datasets <- ndap_list_datasets()
#'   print(head(datasets))
#' }
#' }
ndap_list_datasets <- function() {

  # 1. Get the API Key (using the function we wrote earlier)
  key <- .get_ndap_key()

  # 2. Define the Base URL and Endpoint
  # NOTE: Replace 'YOUR_NDAP_API_BASE_URL' with the actual base URL,
  # and 'catalog/list' with the actual endpoint path for listing data.
  base_url <- "https://api.data.gov.in/resource/"
  endpoint <- "catalog/list"

  full_url <- paste0(base_url, endpoint)

  # 3. Build the Request Object (using httr2)
  # The key is often passed as a query parameter (e.g., 'api-key=KEY')
  # NOTE: Check NDAP docs for the exact parameter name (it might be 'api-key', 'key', or similar)
  request_object <- httr2::request(full_url) %>%
    httr2::req_url_query(
      "api-key" = key,
      "format" = "json"
    )

  # 4. Perform the Request and Handle Errors
  response <- tryCatch({
    httr2::req_perform(request_object)
  }, error = function(e) {
    # Provide a more informative error message if the API call fails
    stop(paste("NDAP API request failed:", e$message), call. = FALSE)
  })

  # 5. Extract and Process the JSON data
  # The 'resp_body_json' function extracts and parses the JSON.
  raw_data <- httr2::resp_body_json(response, simplifyVector = TRUE)

  # 6. Convert to Tidy Data Structure (tibble)
  # We assume the actual dataset list is under a key like 'records'
  if (!("records" %in% names(raw_data))) {
    stop("Unexpected API response structure. Could not find 'records'.", call. = FALSE)
  }

  datasets_df <- tibble::as_tibble(raw_data$records)

  #please use r-based naming convention for col_names[""]


  return(datasets_df)
}
