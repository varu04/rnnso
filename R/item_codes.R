#' HCES Item Dictionary
#' @description Returns a mapping of item codes to names for HCES 2024.
#' @export
rnsso_item_dict <- function() {
  tibble::tribble(
    ~item_code, ~item_name, ~category,
    "101", "Rice - PDS", "Cereals",
    "102", "Rice - Other sources", "Cereals",
    "160", "Milk (liquid)", "Milk & Products",
    "190", "Egg", "Egg, Fish & Meat",
    "260", "Potatoes", "Vegetables",
    "411", "Electricity", "Fuel",
    "519", "Clothing Subtotal", "Clothing",
    "619", "Education Subtotal", "Education"
  )
}

#' Label HCES Item Codes
#' @param df A dataframe containing an 'item_code' column.
#' @export
rnsso_label_items <- function(df) {
  dict <- rnsso_item_dict()
  df$item_code <- as.character(df$item_code)

  # Merge the names into the data
  # We use all.x=TRUE so we don't lose rows that don't have a match yet
  merged_df <- merge(df, dict, by = "item_code", all.x = TRUE)
  return(merged_df)
}
