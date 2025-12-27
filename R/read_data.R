#' Read NSSO/HCES Data (Single File or Full Folder)
#'
#' @param path Path to either a single .txt file OR a folder containing multiple LEVEL files.
#' @param round The year/round of the survey (default 2024).
#' @param level Only required if reading a single file (e.g., "L01").
#' @param delim The delimiter used (default is tab "\t").
#' @importFrom readr read_delim
#' @importFrom labelled set_variable_labels
#' @importFrom stats setNames
#' @importFrom stringr str_extract
#' @export
rnsso_read_data <- function(path, round = 2024, level = NULL, delim = "\t") {

  # --- CHECK IF PATH IS A DIRECTORY (Master Load) ---
  if (dir.exists(path)) {
    message("Directory detected. Starting Master Load...")

    # 1. List all .txt files in the folder
    all_files <- list.files(path, pattern = "\\.txt$", full.names = TRUE)

    if (length(all_files) == 0) {
      stop("No .txt files found in the directory.")
    }

    # 2. Create an empty list to store dataframes
    data_list <- list()

    for (f in all_files) {
      # Extract Level number from filename (e.g., "LEVEL - 01" -> "01")
      # This regex looks for "LEVEL", optional space/hyphen, then digits
      lvl_num <- stringr::str_extract(basename(f), "(?i)LEVEL\\s*[-]?\\s*(\\d+)")
      lvl_id  <- stringr::str_extract(lvl_num, "\\d+")

      if (!is.na(lvl_id)) {
        lvl_formatted <- paste0("L", lvl_id)
        message("Reading ", basename(f), " as ", lvl_formatted, "...")

        # Recursively call this function for the specific file
        # Wrapped in try() so one bad file doesn't crash the whole load
        data_list[[lvl_formatted]] <- tryCatch({
          rnsso_read_data(f, round = round, level = lvl_formatted, delim = delim)
        }, error = function(e) {
          warning("Could not load ", f, ": ", e$message)
          return(NULL)
        })
      }
    }

    message("Master Load complete!")
    return(data_list)
  }

  # --- SINGLE FILE LOGIC ---
  if (is.null(level)) {
    stop("Please specify the 'level' (e.g., level = 'L01') when reading a single file.")
  }

  # 1. Get the layout
  layout_name <- paste0("nsso_", round, "_layout_", level)
  layout <- tryCatch(get(layout_name), error = function(e) NULL)

  if (is.null(layout)) {
    stop(paste("Layout definition not found for:", layout_name))
  }

  # 2. Read the file
  df <- readr::read_delim(
    file = path,
    delim = delim,
    col_names = layout$col_name,
    show_col_types = FALSE
  )

  # 3. Clean Multiplier
  if ("multiplier" %in% names(df)) {
    df$multiplier <- as.numeric(as.character(df$multiplier))
  }

  # 4. Apply Metadata Labels
  var_labels <- stats::setNames(as.list(layout$label), layout$col_name)
  df <- labelled::set_variable_labels(df, .labels = var_labels)

  return(df)
}
