MANUAL := pyspark_cookbook

all: $(MANUAL).docx $(MANUAL).html

$(MANUAL).docx: $(MANUAL).org
	pandoc --toc --reference-doc template/manual.docx $< -o $@

$(MANUAL).pdf: $(MANUAL).org
	org-export pdf --infile $<

index.html: $(MANUAL).org
	org-export html --infile $(MANUAL).org --outfile $@
	sed -i -E "s/Table of Contents/PySpark Cookbook/g" $@

test_ps2org.html: test_ps2org.org
	org-export html --infile $< --outfile $@
	sed -i -E "s/Table of Contents/Testing PySpark Table Format Conversion/g" $@

clean:
	${RM} $(MANUAL).docx $(MANUAL).html
