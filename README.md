# GDPR in XML
This repository contains *Regulation (EU) 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC (General Data Protection Regulation)*, a.k.a., the GDPR, in the 24 languages of the EU in various forms:

`original/`: The original, untouched XML versions of the GDPR [[source](https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en)]

`formatted/`: The XML files from `original` after having run them through `xmllint --format` to reformat/reindent.

`corr-2018-original/`:  The untouched XML versions of the [corrections](https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=uriserv:OJ.L_.2018.127.01.0002.01.ENG&toc=OJ:L:2018:127:FULL) (corrigendum) published in 2018. [[source](https://publications.europa.eu/en/publication-detail/-/publication/683d5816-5e52-11e8-ab9c-01aa75ed71a1/language-en/format-PDF/source-82709747)]

`corr-2018-formatted/`: The XML files from `corr-2018-original` after having run them through `xmllint --format`.

`consolidated`: The XML versions of the consolidated GDPR (i.e., with corrections integrated), *without* the preamble and its 173 recitals. [[source](https://publications.europa.eu/en/publication-detail/-/publication/5f2552c2-cc45-11e6-ad7c-01aa75ed71a1/language-en/format-PDF/source-82709144)]

`consolidated-with-corrected-preamble`: The XML files from `consolidated`, with the preambles from `formatted` added, and the preamble corrections merged in.

`gdpr-articles.xsl` and `gdpr-recitals.xsl` are (ugly) XSL transformations that can be used with e.g. xsltproc to generate
HTML versions of the files in `consolidated-with-corrected-preamble`. These are used by the bash script `generate.sh` to
create https://gdpr.dataskydd.net/.

## Why?
I wanted to make nice HTML versions of the GDPR. [EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32016R0679)
has terrible HTML versions generated from XML, but doesn't provide the actual XML.

[publications.europa.eu](https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en)
provides the XML files, but makes it slightly annoying to get direct links, and the links look like they'd make Tim Berners-Lee [shed a tear](https://www.w3.org/Provider/Style/URI).
The links eventually resolve to zip files with hopeless names like `3e485e15-11bd-11e6-ba9a-01aa75ed71a1.zip`.
Within the zip files, the XML files are identically named for each language: `DOC_1_1.xml` and `DOC_2_1.xml`.
(The corrections and consolidated XML files as provided by the EU Publications Office suffer from the same issues.)

The files in `original/` are the ones from publications.europa.eu. They are identical to (i.e., have the same hash as) the corresponding
files in the zip archive of the *Official Journal of the European Union, L 119, 4 May 2016*. E.g., [JOx_FMX_EN_2016.ZIP](http://data.europa.eu/euodp/repository/ec/publ/op-jo-formex/JOx_FMX_EN/JOx_FMX_EN_2016.ZIP)
(found on the [EU Open Data Portal](http://data.europa.eu/euodp/en/data/dataset/official-journals-of-the-european-union-in-english/resource/fa300be6-7dfe-4748-8613-daf3ec6dae53))
contains `JOLFMX_2016_119_1_EN.zip` which in turn contains `L_2016119EN.01000101.xml` and `L_2016119EN.01000101.doc.xml`, which are
identical to this repository's `original/L_2016119EN.01000101.xml` and `original/L_2016119EN.01000101.doc.xml`.

So, the purpose of this repo is just to make it slightly less cumbersome if you want to work with multiple language versions of the GDPR. Feel free to use the XSL files for any purpose.

The XML files are © European Union, 2016, here [legally reused](https://publications.europa.eu/en/web/about-us/legal-notices/eu-law-and-publications-website#copyright).
