# GDPR in XML
This repository contains *Regulation (EU) 2016/679 of the European Parliament and of the Council of 27 April 2016 on the protection of natural persons with regard to the processing of personal data and on the free movement of such data, and repealing Directive 95/46/EC (General Data Protection Regulation)*, a.k.a., the GDPR, in the 24 languages of the EU.

In `original/` you'll find the original, untouched files.

In `formatted/` you'll find the same files after having run them through `xmllint --format` to reformat/reindent.

## Why?
I wanted to make nice HTML versions of the GDPR. [EUR-Lex](https://eur-lex.europa.eu/legal-content/EN/ALL/?uri=CELEX:32016R0679)
has terrible HTML versions generated from XML, but doesn't provide the actual XML.

[publications.europa.eu](https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en)
provides the XML files, but makes it slightly annoying to get direct links, and the links look like they'd make Tim Berners-Lee [shed a tear](https://www.w3.org/Provider/Style/URI).
The links eventually resolve to zip files with hopeless names like `3e485e15-11bd-11e6-ba9a-01aa75ed71a1.zip`.
Within the zip files, the XML files are identically named for each language: `DOC_1_1.xml` and `DOC_2_1.xml`.

The files in `original/` are the ones from publications.europa.eu. They are identical to (i.e., have the same hash as) the corresponding
files in the zip archive of the *Official Journal of the European Union, L 119, 4 May 2016*. E.g., [JOx_FMX_EN_2016.ZIP](http://data.europa.eu/euodp/repository/ec/publ/op-jo-formex/JOx_FMX_EN/JOx_FMX_EN_2016.ZIP)
(found on the [EU Open Data Portal](http://data.europa.eu/euodp/en/data/dataset/official-journals-of-the-european-union-in-english/resource/fa300be6-7dfe-4748-8613-daf3ec6dae53))
contains `JOLFMX_2016_119_1_EN.zip` which in turn contains `L_2016119EN.01000101.xml` and `L_2016119EN.01000101.doc.xml`, which are
identical to this repository's `original/L_2016119EN.01000101.xml` and `original/L_2016119EN.01000101.doc.xml`.

So, the purpose of this repo is just to make it slightly less cumbersome if you want to work with multiple language versions of the GDPR.
For good measure I've also included the XML Schema, `formex-05.55-20141201.xd`, just in case it changes URL at some point.

At some point I hope to have some transformations here for nice HTML.

The XML files are © European Union, 2016, here [legally reused](https://publications.europa.eu/en/web/about-us/legal-notices/eu-law-and-publications-website#copyright).