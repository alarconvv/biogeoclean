#'@name ISOTocountry
#'
#'@title Convert from  International Organization for Standardization (ISO 3166-1 alpha-2 and  alpha-3)
#' to country name (English).
#'
#'@description Given the ISO-2 or ISO-3 code [1], it  will assign the corresponding country name in English.
#'
#'@param countryCode Data.Frame class. A vector with the ISO-2or ISO-3 Codes.
#'
#'@param iso numeric (2 or 3). To define the code whether ISO-2 (iso=2, default value) or ISO-3 (iso=3).
#'
#'
#'@return A table with two columns (countryCode, country)
#'
#'
#'@details The user can see the ISO 3166-1 alpha-2 or alpha-3 valid for each country using
#' the line of code : data(ISO2) or data(ISO3).
#'
#'@author R-Alarcon Viviana and Miranda-Esquivel Daniel R.
#'
#'@note See:
#'R-Alarcon V. and Miranda-Esquivel DR.(in prep) geocleaMT: An R package to
#'cleaning geographical data from electronic biodatabases.
#'
#'@seealso \code{\link{countryToCentroid}}
#'
#'@references
#'[1] ISO 2015. International standard for country codes and codes for their subdivisions. Country codes - iso 3166. International Organization for Standardization. Available online at http://www.iso.org/iso/country_codes .


ISOTocountry <- function(countryCode = NULL, iso = 2) {

	if(iso!=2 | iso!=3){stop('Wrong ISO value')}
	
    data(wrld_simpl)
    world <-wrld_simpl
    
    table <- cbind('countryCode' = countryCode, 'country' = NaN)
    
  for (i in 1:length(countryCode)) {
    table$countryCode[i] <- countryCode[i]
    if(iso==2){position <- which(world@data$ISO2 == countryCode[i])}
    if(iso==3){position <- which(world@data$ISO3 == countryCode[i])}
    if (!is.null(position)) {
      table$country[i] <- world@data$NAME[position]
    }else{
      table$country[i] <- 'None'
    }

  }
  return(table)
}