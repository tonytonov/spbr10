library(xts)
data(sample_matrix)
sample_df <- data.frame(sample_matrix)
sample_df$Date <- as.Date(rownames(sample_df))
sample_df <- tidyr::gather(sample_df, Series, Value, -Date)
plot_series(sample_df, x = Date, y = Value,
            color = Series, method = "ggplot")
plot_series(sample_df, x = Date, y = Value,
            color = Series, method = "plotly")
