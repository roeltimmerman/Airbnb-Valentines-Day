all: analysis data-preparation

data-preparation: 
		make -C src/data-preparation
		
analysis: data-preparation
		make -C src/analysis
		
#clean:
#	R -e "unlink('data/*.*')"
#	R -e "unlink('gen/*.*', recursive = TRUE)"
# deze pas laten runnen als de rest werkt anders worden alle data files gelijk verwijderd

