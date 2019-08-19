
.PHONY : all report clean

all: report

report:
	Rscript -e "rmarkdown::render(input = 'analysis.Rmd', \
	                              output_file = 'analysis.html')"
	rm Makefile
clean:
	rm analysis.html
