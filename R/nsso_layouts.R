# This data structure will be stored inside the package for fast lookups.

# Example layout for NSSO 75th Round, Schedule 1.0, Household Level (Block 3)
# The columns define the fixed-width positions.
# nsso_75_layout_HCE <- tibble::tribble(
#   ~col_name, ~width, ~start, ~end, ~type, ~label,
#   "state_region", 3, 7, 9, "chr", "State Region Code",
#   "district_code", 2, 10, 11, "int", "District Code",
#   "sector", 1, 6, 6, "chr", "Rural=1, Urban=2",
#   "HH_SIZE", 2, 49, 50, "int", "Household Size",
#   "MPCE", 5, 203, 207, "dbl", "Monthly Per Capita Expenditure",
#   "wgt_factor", 12, 230, 241, "dbl", "Household Weight Multiplier"
#   # ... many more variables would go here
# )

#putting the actual HCES23-24 variable list as follows:
#' HCES 2023-24 Level 01 Layout
#' @export
nsso_2024_layout_L01 <- tibble::tribble(
  ~col_name,                  ~label,
  "survey_name",              "Survey Name",
  "year",                     "Year",
  "fsu_serial_no",            "FSU Serial No.",
  "sector",                   "Sector",
  "state",                    "State",
  "nss_region",               "NSS-Region",
  "district",                 "District",
  "stratum",                  "Stratum",
  "sub_stratum",              "Sub-stratum",
  "panel",                    "Panel",
  "sub_sample",               "Sub-sample",
  "fod_sub_region",           "FOD-Sub-Region",
  "sample_su_no",             "Sample SU No.",
  "sample_sub_division_no",   "Sample Sub-division no.",
  "second_stage_stratum_no",  "Second-stage-stratum no.",
  "sample_hhld_no",           "Sample hhld. No.",
  "questionnaire_no",         "Questionnaire No.",
  "level",                    "Level",
  "survey_code",              "Survey Code",
  "reason_for_substitution",  "Reason for substitution",
  "multiplier",               "Multiplier (Weight)"
)


library(tibble)

# --- LEVEL 02: Household Members ---
#' @export
nsso_2024_layout_L02 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "person_srl", "Person Srl No.",
  "relation_to_head", "Relation to head (code)",
  "gender", "Gender",
  "age", "Age(in years)",
  "marital_status", "Marital Status (code)",
  "education_level", "Highest educational level attained (code)",
  "years_education", "Total year of education completed",
  "internet_usage", "Whether used internet from any location during last 30 days",
  "days_away", "No. of days stayed away from home during last 30 days",
  "meals_per_day", "No. of meals usually taken in a day",
  "meals_school", "No. of meals taken during last 30 days from school, balwadi etc.",
  "meals_employer", "No. of meals taken during last 30 days from employer as perquisites",
  "meals_others", "No. of meals taken during last 30 days others",
  "meals_payment", "No. of meals taken during last 30 days on payment",
  "meals_home", "No. of meals taken during last 30 days at home",
  "revisit_status", "Status of Member as on revisit",
  "fdq_original_member", "FDQ original member(generated field)",
  "multiplier", "Multiplier"
)

# --- LEVEL 03: Household Characteristics ---
#' @export
nsso_2024_layout_L03 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "hh_size_fdq", "HH Size (For FDQ)",
  "economic_activity", "HH member engaged in economic activities last 365 days",
  "nco_code", "NCO-2015 Code(3-digit)",
  "nic_code", "NIC-2008 Code(5-digit)",
  "max_income_source", "Broad activities from which maximum income was derived",
  "self_emp_type", "Self-employment source (Agri/Non-Agri)",
  "wage_salary_type", "Regular wage source (Agri/Non-Agri)",
  "casual_labour_type", "Casual labour source (Agri/Non-Agri)",
  "hh_type", "Household Type",
  "religion", "Religion of the head",
  "social_group", "Social Group of the head",
  "land_owned_bool", "Owns any land as on date of survey",
  "land_type", "Type of land owned",
  "land_area", "Total area of all owned land (acre)",
  "dwelling_unit", "Dwelling unit at present place",
  "dwelling_type", "Type of Dwelling Unit",
  "energy_cooking", "Primary source of energy for cooking",
  "energy_lighting", "Primary source of energy for lighting",
  "ration_card_type", "Type of ration card possessed",
  "rent_prevailing", "Prevailing rate of rent (Rural only)",
  "pmgky_benefit", "Benefitted from PMGKY",
  "multiplier", "Multiplier"
)

# --- LEVEL 04: Ration & Online Food ---
#' @export
nsso_2024_layout_L04 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "ration_procured", "Procured any item using ration card last 30 days",
  "ration_rice", "Ration item: Rice",
  "ration_wheat", "Ration item: Wheat",
  "ration_coarse", "Ration item: Coarse Grain",
  "ration_sugar", "Ration item: Sugar",
  "ration_pulses", "Ration item: Pulses",
  "ration_oil", "Ration item: Edible Oil",
  "ration_other", "Ration item: Other food",
  "online_groceries", "Online purchase: Groceries",
  "online_milk", "Online purchase: Milk products",
  "online_veg", "Online purchase: Vegetables",
  "online_fresh_fruit", "Online purchase: Fresh Fruits",
  "online_dry_fruit", "Online purchase: Dry Fruits",
  "online_meat", "Online purchase: Egg, fish & meat",
  "online_processed_served", "Online purchase: Served processed food",
  "online_processed_packed", "Online purchase: Packed processed food",
  "online_other_food", "Online purchase: Other food items",
  "ceremony_performed", "Ceremony performed during last 30 days",
  "meals_non_hh", "Meals served to non-household members last 30 days",
  "multiplier", "Multiplier"
)

# --- LEVEL 05: Food Consumption (Detailed) ---
#' @export
nsso_2024_layout_L05 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "item_code", "Item Code",
  "home_produce_qty", "Consumption out of home produce-Quantity",
  "home_produce_val", "Consumption out of home produce-Value(Rs.)",
  "total_qty", "Total Consumption-Quantity",
  "total_val", "Total Consumption-Value(Rs.)",
  "source", "Source",
  "multiplier", "Multiplier"
)

# --- LEVEL 06: Food Consumption (Section 7) ---
#' @export
nsso_2024_layout_L06 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "item_code", "Item Code",
  "total_qty", "Total Consumption-Quantity",
  "total_val", "Total Consumption-Value(Rs.)",
  "source", "Source",
  "multiplier", "Multiplier"
)

# --- LEVEL 07: Subsidies & Education/Health Benefits ---
#' @export
nsso_2024_layout_L07 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "ration_kerosene", "Procured kerosene using ration card",
  "lpg_subsidy_bool", "Received LPG subsidy last 3 months",
  "lpg_subsidy_count", "Number of subsidized LPG cylinders",
  "free_electricity", "Received free electricity last 30 days",
  "attending_edu", "Member attending edu institution last 365 days",
  "attending_govt", "Number attending Govt institution",
  "attending_pvt", "Number attending Private institution",
  "free_textbooks", "Received free textbooks",
  "count_textbooks", "Total free textbooks received",
  "free_stationary", "Received free stationary",
  "count_stationary", "Total free stationaries received",
  "free_schoolbag", "Received free school bag",
  "count_schoolbag", "Total free school bags received",
  "free_others", "Received other free items",
  "count_others", "Total free other items received",
  "fee_reimbursement", "Received fee reimbursement/waiver",
  "count_reimbursement", "Number of members received reimbursement",
  "ayushman_bharat", "Ayushman Bharat beneficiary",
  "count_ayushman", "Number of beneficiaries",
  "hospitalization", "Case of hospitalization in HH last 365 days",
  "medical_benefit_bool", "Received medical benefits under public scheme",
  "medical_benefit_count", "Number of members received medical benefit",
  "medical_benefit_amt", "Amount of medical benefit",
  "online_fuel", "Online purchase: Fuel & light",
  "online_toilet", "Online purchase: Toilet articles",
  "online_education", "Online purchase: Education",
  "online_medicine", "Online purchase: Medicine",
  "online_services", "Online purchase: Services (Travel, etc.)",
  "multiplier", "Multiplier"
)

# --- LEVEL 08: Consumables (Sec 8.1) ---
#' @export
nsso_2024_layout_L08 <- nsso_2024_layout_L05 # Structure is identical

# --- LEVEL 09: Consumables Value Only (Sec 9, 10, 11) ---
#' @export
nsso_2024_layout_L09 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "item_code", "Item Code",
  "value_rs", "Value(Rs.)",
  "multiplier", "Multiplier"
)

# --- LEVEL 10: Consumables (Sec 12) ---
#' @export
nsso_2024_layout_L10 <- nsso_2024_layout_L05 # Structure is identical

# --- LEVEL 11: Online Durable Purchases & Possession ---
#' @export
nsso_2024_layout_L11 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "online_clothing", "Online: Clothing",
  "online_footwear", "Online: Footwear",
  "online_furniture", "Online: Furniture",
  "online_mobile", "Online: Mobile",
  "online_personal", "Online: Personal goods",
  "online_recreation", "Online: TV/Camera etc.",
  "online_appliances", "Online: Household appliances",
  "online_crockery", "Online: Crockery",
  "online_sports", "Online: Sports goods",
  "online_medical_eq", "Online: Medical equipment",
  "online_bedding", "Online: Bedding",
  "free_laptop", "Free item: Laptop",
  "count_laptop", "Count free Laptop",
  "free_tablet", "Free item: Tablet",
  "count_tablet", "Count free Tablet",
  "free_mobile", "Free item: Mobile",
  "count_mobile", "Count free Mobile",
  "free_bicycle", "Free item: Bicycle",
  "count_bicycle", "Count free Bicycle",
  "free_motorcycle", "Free item: Motorcycle",
  "count_motorcycle", "Count free Motorcycle",
  "free_clothing", "Free item: Clothing",
  "count_clothing", "Count free Clothing",
  "free_footwear", "Free item: Footwear",
  "count_footwear", "Count free Footwear",
  "free_other", "Free item: Other",
  "count_other", "Count free Other",
  "possess_tv", "Possessed: TV",
  "possess_radio", "Possessed: Radio",
  "possess_laptop", "Possessed: Laptop",
  "possess_mobile", "Possessed: Mobile",
  "possess_bicycle", "Possessed: Bicycle",
  "possess_motorcycle", "Possessed: Motorcycle",
  "possess_car", "Possessed: Car/Jeep",
  "possess_truck", "Possessed: Truck",
  "possess_animal_cart", "Possessed: Animal cart",
  "possess_fridge", "Possessed: Refrigerator",
  "possess_washing_m", "Possessed: Washing machine",
  "possess_ac", "Possessed: Air conditioner",
  "tv_facility", "Type of multichannel TV facility",
  "multiplier", "Multiplier"
)

# --- LEVEL 12: Durables (Sec 13) ---
#' @export
nsso_2024_layout_L12 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "item_code", "Item Code",
  "qty", "Quantity",
  "value_rs", "Value(Rs.)",
  "multiplier", "Multiplier"
)

# --- LEVEL 13: Durables Detailed (Sec 14) ---
#' @export
nsso_2024_layout_L13 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "item_code", "Item Code",
  "fh_purchase_num", "First-hand purchase: number",
  "hired_purchase", "Whether purchased on hire",
  "fh_purchase_val", "First-hand purchase: Value(Rs.)",
  "repair_cost", "Cost of repair & maintenance(Rs.)",
  "sh_purchase_num", "2nd-hand purchase: Number",
  "sh_purchase_val", "2nd-hand purchase: Value(Rs.)",
  "total_exp", "Total expenditure(Rs.)",
  "multiplier", "Multiplier"
)

# --- LEVEL 14: Summary Expenditure ---
#' @export
nsso_2024_layout_L14 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "level", "Level",
  "section", "Section",
  "item_code", "Item Code",
  "value_rs", "Value (in Rs)",
  "multiplier", "Multiplier"
)

# --- LEVEL 15: Survey Metadata & Informant Details ---
#' @export
nsso_2024_layout_L15 <- tibble::tribble(
  ~col_name, ~label,
  "common_id", "Common-ID",
  "q_no", "Questionnaire No.",
  "visit", "Visit",
  "level", "Level",
  "section", "Section",
  "canvass_time", "Time taken to canvass (minutes)",
  "usual_exp_month", "HH usual monthly consumption expenditure (Rs.)",
  "total_online_exp", "Total online purchase exp last 30 days (Rs.)",
  "informant_code", "Informant code",
  "response_code", "Response code",
  "hh_size", "Household size",
  "visit_month", "Visit Month",
  "multiplier", "Multiplier"
)
