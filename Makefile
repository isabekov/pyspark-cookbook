MANUAL := pyspark_cookbook

all: $(MANUAL).docx $(MANUAL).html

$(MANUAL).docx: $(MANUAL).org
	pandoc --toc --reference-doc template/manual.docx $< -o $@

$(MANUAL).pdf: $(MANUAL).org
	org-export pdf --infile $<

index.html: $(MANUAL).org
	org-export html --infile $(MANUAL).org --outfile $@
	sed -i -E "s/Table of Contents/PySpark Cookbook/g" $@


clean:
	${RM} $(MANUAL).docx $(MANUAL).html
