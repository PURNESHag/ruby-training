module Constants
  module Filter
    ALL = 3 # selects option 3 in switch case to apply ALL filter
    TODO = 1 #selects option 1 in switch case to apply TODO filter
    DONE = 2 #selects option 2 in switch case to apply DONE filter
  end
  module Sort
    ASCENDING = 1 # selects option 1 in switch case to Strat printing in ascending order of timestamp
    DESCENDING = 2 # selects option 2 in switch case to Strat printing in descending order of timestamp
  end
  module DisplayType
    ALL_SUMMARY = 0 #selects option 0 in switch case to Display only summary of the list
    EXPAND = 1 #selects option 1 in switch case to Display all details expanding the list details
    TYPE_TOP = 2 ##selects option 2 in switch case to Display only 5 of summary of the list
  end
end  # All these are the options available to switch in filter, order and details to be printed in all specific option selection
