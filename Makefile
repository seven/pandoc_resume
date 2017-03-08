all: html pdf docx rtf

pdf: duanwei_cv.pdf
duanwei_cv.pdf: duanwei_cv.md
	pandoc --standalone --template style_chmduquesne.tex \
	--from markdown --to context \
	-V papersize=A4 \
	-o duanwei_cv.tex duanwei_cv.md; \
	context duanwei_cv.tex

html: duanwei_cv.html
duanwei_cv.html: style_chmduquesne.css duanwei_cv.md
	pandoc --standalone -H style_chmduquesne.css \
        --from markdown --to html \
        -o duanwei_cv.html duanwei_cv.md

docx: duanwei_cv.docx
duanwei_cv.docx: duanwei_cv.md
	pandoc -s -S duanwei_cv.md -o duanwei_cv.docx

rtf: duanwei_cv.rtf
duanwei_cv.rtf: duanwei_cv.md
	pandoc -s -S duanwei_cv.md -o duanwei_cv.rtf

clean:
	rm duanwei_cv.html
	rm duanwei_cv.tex
	rm duanwei_cv.tuc
	rm duanwei_cv.log
	rm duanwei_cv.pdf
	rm duanwei_cv.docx
	rm duanwei_cv.rtf
