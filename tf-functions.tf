# Specify the provider
provider "aws" {
  region = "us-west-2"
}

# Demonstrating String Functions
locals {
  base_name           = "myapp"
  suffix              = "prod"
  upper_case_name     = upper(local.base_name)           # Converts to uppercase
  lower_case_name     = lower(local.upper_case_name)     # Converts to lowercase
  title_case_name     = title(local.base_name)           # Converts first letter to uppercase
  joined_string       = join("-", [local.base_name, local.suffix])  # Joins strings with a separator
  replaced_string     = replace(local.base_name, "my", "your")      # Replaces 'my' with 'your'
  trimmed_string      = trimspace("  padded string  ")   # Removes leading and trailing spaces
  substr_example      = substr(local.base_name, 0, 2)    # Extracts 'my' from 'myapp'
  contains_example    = contains(["dev", "prod", "test"], local.suffix)  # Checks if 'suffix' is in list
}

# Demonstrating Numeric Functions
locals {
  num_list            = [1, 2, 3, 4, 5]
  sum_of_numbers      = sum(local.num_list)                # Sums the list
  min_value           = min(local.num_list)                # Finds minimum value
  max_value           = max(local.num_list)                # Finds maximum value
  abs_value           = abs(-42)                           # Returns absolute value of -42
  ceil_value          = ceil(4.2)                          # Rounds up to nearest integer
  floor_value         = floor(4.8)                         # Rounds down to nearest integer
  round_value         = round(4.5)                         # Rounds to the nearest integer
}

# Demonstrating Encoding Functions
locals {
  base64_encoded      = base64encode("hello world")        # Encodes a string to Base64
  base64_decoded      = base64decode(local.base64_encoded) # Decodes a Base64 string
  md5_hash            = md5("my-secret")                   # MD5 hash of a string
  sha256_hash         = sha256("my-secret")                # SHA256 hash of a string
  url_encoded         = urlencode("hello world")           # URL-encodes the string
  urldecoded          = urldecode("hello%20world")         # URL-decodes the string
}

# Demonstrating Date/Time Functions
locals {
  current_time        = timestamp()                        # Current timestamp
  formatted_time      = formatdate("YYYY-MM-DD", local.current_time)  # Formats date
  time_offset         = timeadd(local.current_time, "1h")  # Adds 1 hour to current time
  time_difference     = timecmp(local.time_offset, local.current_time) # Compares two times
  is_leap_year        = formatdate("Y", local.current_time) % 4 == 0   # Checks for leap year
}

# Demonstrating Collection Functions
locals {
  list_of_strings     = ["apple", "banana", "cherry"]
  concatenated_list   = concat(local.list_of_strings, ["date"])  # Concatenates lists
  distinct_values     = distinct(["apple", "banana", "apple"])   # Removes duplicates
  length_of_list      = length(local.list_of_strings)            # Length of list
  sorted_list         = sort(local.list_of_strings)              # Sorts the list
  element_in_list     = element(local.list_of_strings, 1)        # Retrieves element by index
  merged_maps         = merge({a = 1}, {b = 2})                  # Merges two maps
}

# Output the results of the functions
output "string_functions" {
  value = {
    upper_case_name   = local.upper_case_name
    lower_case_name   = local.lower_case_name
    title_case_name   = local.title_case_name
    joined_string     = local.joined_string
    replaced_string   = local.replaced_string
    trimmed_string    = local.trimmed_string
    substr_example    = local.substr_example
    contains_example  = local.contains_example
  }
}

output "numeric_functions" {
  value = {
    sum_of_numbers     = local.sum_of_numbers
    min_value          = local.min_value
    max_value          = local.max_value
    abs_value          = local.abs_value
    ceil_value         = local.ceil_value
    floor_value        = local.floor_value
    round_value        = local.round_value
  }
}

output "encoding_functions" {
  value = {
    base64_encoded     = local.base64_encoded
    base64_decoded     = local.base64_decoded
    md5_hash           = local.md5_hash
    sha256_hash        = local.sha256_hash
    url_encoded        = local.url_encoded
    urldecoded         = local.urldecoded
  }
}

output "date_time_functions" {
  value = {
    current_time       = local.current_time
    formatted_time     = local.formatted_time
    time_offset        = local.time_offset
    time_difference    = local.time_difference
    is_leap_year       = local.is_leap_year
  }
}

output "collection_functions" {
  value = {
    concatenated_list  = local.concatenated_list
    distinct_values    = local.distinct_values
    length_of_list     = local.length_of_list
    sorted_list        = local.sorted_list
    element_in_list    = local.element_in_list
    merged_maps        = local.merged_maps
  }
}
