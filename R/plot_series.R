#' Plotting multiple time series
#'
#' Producing a static (ggplot) or dynamic (plotly) plot for visual comparison of several time series.
#'
#' @param df data frame with series data
#' @param x date variable (x axis)
#' @param y numeric variable (y axis)
#' @param color grouping variable
#' @param ... xlab, ylab, title or labels for time series
#' @param method either "ggplot" or "plotly"
#'
#' @importFrom ggplot2 ggplot aes_q geom_line xlab ylab ggtitle
#' @importFrom ggplot2 scale_x_date theme element_text scale_color_brewer waiver
#' @importFrom methods hasArg
#' @export
plot_series <- function(df, x, y, color, method = "ggplot", ...) {
  arglist <- list(...)
  if (method == "ggplot" || method == "plotly") {
    p <- ggplot(df, aes_q(substitute(x),
                          substitute(y),
                          col = substitute(color))) +
      geom_line(size = 0.8) +
      scale_x_date(
        date_breaks = "1 week",
        date_labels = "%d-%m-%Y"
      ) +
      theme(axis.text.x = element_text(angle = 45, hjust = 1, vjust = 1))

    if (hasArg("xlab")) p <- p + xlab(arglist$xlab)
    if (hasArg("ylab")) p <- p + ylab(arglist$ylab)
    if (hasArg("title")) p <- p + ggtitle(arglist$title)
    p <- p +
      scale_color_brewer(palette = "Set1",
                         labels = if (hasArg("labels")) arglist$labels else waiver())
  }
  if (method == "ggplot") return(print(p))
  if (method == "plotly") return(suppressMessages(plotly::ggplotly(p, ...)))
  #if (method == "tidyquant") return()
  stop("Unknown plotting method! Please use either 'ggplot' or 'plotly'")
}
