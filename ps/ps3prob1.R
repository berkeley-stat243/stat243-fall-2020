## @knitr download

moderators <- c("HOLT", "LEHRER", "LEHRER", "LEHRER", "MODERATOR")

candidates <- list(c(Dem = "CLINTON", Rep = "TRUMP"),
                   c(Dem = "OBAMA", Rep = "ROMNEY"),
                   c(Dem = "OBAMA", Rep = "MCCAIN"),
                   c(Dem = "KERRY", Rep = "BUSH"),
                   c(Dem = "GORE", Rep = "BUSH"))


library(rvest)
library(stringr)
library(assertthat)

url <- "http://www.debates.org/index.php?page=debate-transcripts"

yrs <- seq(2000, 2016, by = 4)
type <- 'first'

main  <- read_html(url)
listOfANodes <- html_nodes(main, xpath = "//a[@href]")
labs <- sapply(listOfANodes, html_text)
inds_first <- which(str_detect(labs, "The First"))
## debates only from the specified years
inds_within <- which(str_extract(labs[inds_first], "\\d{4}")
                     %in% as.character(yrs))
inds <- inds_first[inds_within]
debate_urls <- sapply(listOfANodes, html_attr, "href")[inds]

n <- length(debate_urls)

assert_that(n == length(yrs))

## @knitr extract

debates_html <- lapply(paste0("https://debates.org", debate_urls), read_html)

get_content <- function(html) {
    # get core content containing debate text
    contentNode <- html_nodes(html, xpath = "//div[@id = 'content-sm']")
    if(length(contentNode) > 1)
        stop("Check why there are multiple chunks of content.")
    text <- html_text(contentNode[[1]])
    # sanity check:
    print(html_text(html_nodes(contentNode[[1]], xpath = "//h1")[[1]]))
    return(text)
}

debates_body <- sapply(debates_html, get_content)

## sanity checks
print(substring(debates_body[5], 1, 1000))
sapply(debates_body, nchar, USE.NAMES = FALSE)
