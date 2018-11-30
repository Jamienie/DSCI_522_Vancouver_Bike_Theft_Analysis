# Makefile
# Authors: Fan Nie, Mohamad Makkaoui
# Date: November 2018

# The makefile is the short way of running all R scripts in the following orde:

#####################################
# Run all scripts at once
#####################################

all: doc/vancouver_bike_report.md
	rm -f Rplots.pdf doc/vancouver_bike_report.html

#####################################
# Run the five scripts step by step
#####################################

# 1. data loading
data/crime_csv_all_years.csv : $(ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip) src/data_loading.R
	Rscript src/data_loading.R ftp://webftp.vancouver.ca/opendata/csv/crime_csv_all_years.zip data

# 2. data wrangling
results/data_all_years_bicycle.csv : data/crime_csv_all_years.csv results/data_all_years_bicycle.csv
	Rscript src/data_wrangling.R data/crime_csv_all_years.csv results/data_all_years_bicycle.csv

# 3. exploratory visualization generation
results/figures/viz_exploratory.png : results/data_all_years_bicycle.csv results/figures/viz_exploratory.png
	Rscript src/data_viz_exploratory.R results/data_all_years_bicycle.csv  results/figures/viz_exploratory.png

# 4. data analysis
results/analysis_summary.csv : results/data_all_years_bicycle.csv  results/analysis_summary.csv
	Rscript src/data_analysis.R results/data_all_years_bicycle.csv  results/analysis_summary.csv

# 5. final visualization generation
results/figures/bike_boxplot.png : results/data_all_years_bicycle.csv results/figures/bike_boxplot.png
	Rscript src/data_viz_final.R results/data_all_years_bicycle.csv results/figures/bike_boxplot.png

#####################################
# Generate report
#####################################

doc/vancouver_bike_report.md : doc/vancouver_bike_report.Rmd results/figures/viz_exploratory.png results/figures/bike_boxplot.png
	Rscript -e "rmarkdown::render('doc/vancouver_bike_report.Rmd')"

#####################################
# Remove all files
#####################################

clean:
	rm -f data/crime_csv_all_years.csv
	rm -f results/data_all_years_bicycle.csv
	rm -f results/figures/viz_exploratory.png
	rm -f results/analysis_summary.csv
	rm -f results/figures/bike_boxplot.png
	rm -f doc/vancouver_bike_report.md
