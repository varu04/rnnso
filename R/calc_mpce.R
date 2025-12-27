#' Calculate Monthly Per Capita Expenditure (MPCE)
#' @param data_list The list output from rnsso_read_data() folder load.
#' @importFrom dplyr group_by summarise left_join mutate select
#' @export
rnsso_calc_mpce <- function(data_list) {

  # 1. Sum up expenditure from the main consumption levels
  # Level 05, 06, 10 usually contain the bulk of food/consumables
  message("Aggregating expenditure...")

  get_spent <- function(df) {
    if (is.null(df)) return(NULL)
    df %>%
      dplyr::group_by(common_id) %>%
      dplyr::summarise(total_spent = sum(total_val, na.rm = TRUE), .groups = "drop")
  }

  exp_05 <- get_spent(data_list$L05)
  exp_06 <- get_spent(data_list$L06)

  # Combine spending
  all_exp <- rbind(exp_05, exp_06) %>%
    dplyr::group_by(common_id) %>%
    dplyr::summarise(grand_total = sum(total_spent, na.rm = TRUE), .groups = "drop")

  # 2. Join with Household Size (found in Level 15 or Level 01)
  message("Calculating per capita values...")

  # We assume L15 has the correct hh_size
  final_df <- data_list$L15 %>%
    dplyr::select(common_id, hh_size, multiplier) %>%
    dplyr::distinct() %>%
    dplyr::left_join(all_exp, by = "common_id") %>%
    dplyr::mutate(
      grand_total = ifelse(is.na(grand_total), 0, grand_total),
      mpce = grand_total / hh_size
    )

  return(final_df)
}
