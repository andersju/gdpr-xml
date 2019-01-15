#!/bin/bash

mkdir -p site
cp style.css site

declare -a LANGUAGES=("bg" "cs" "da" "de" "el" "en" "es" "et" "fi" "fr" "ga" "hr" "hu" "it" "lt" "lv" "mt" "nl" "pl" "pt" "ro" "sk" "sl" "sv")

for i in "${LANGUAGES[@]}"
do
  mkdir -p site/${i}/art
  mkdir -p site/${i}/rec

  xsltproc gdpr-articles.xsl consolidated-with-corrected-preamble/gdpr-consolidated-with-corrected-preamble-${i}.xml \
  | tidy -i -w 0 > site/${i}/art/index.html
  xsltproc gdpr-recitals.xsl consolidated-with-corrected-preamble/gdpr-consolidated-with-corrected-preamble-${i}.xml \
  | tidy -i -w 0 > site/${i}/rec/index.html
done

cat <<EOF > site/index.html
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1"/>
    <meta name="referrer" content="no-referrer"/>
    <title>GDPR in every language</title>
    <link rel="stylesheet" href="style.css">
  </head>
  <body>
  <header>
    <h1>GDPR in every language</h1>
  </header>

  <p>This site contains the articles and recitals of the GDPR (General Data Protection Regulation) in each of the 24 official EU languages.</p>
  <p>Please note that these are not the official versions of the GDPR; for those, <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=celex%3A32016R0679">see the official versions</a> (and the 2018 <a href="https://eur-lex.europa.eu/legal-content/EN/TXT/?uri=CELEX%3A32016R0679R%2802%29">corrigendum</a>). There may be errors here; if you find any, please <a href="mailto:info@dataskydd.net">contact us</a>.</p>
  <p>The pages were generated from <a href="https://publications.europa.eu/en/publication-detail/-/publication/5f2552c2-cc45-11e6-ad7c-01aa75ed71a1/language-en/format-PDF/source-82709144">XML files of the consolidated GDPR</a> (i.e., with corrections integrated). These files did not include the preamble containing the recitals, so these were added from <a href="https://publications.europa.eu/en/publication-detail/-/publication/3e485e15-11bd-11e6-ba9a-01aa75ed71a1/language-en">the XML versions of the original GDPR</a>, and the preamble corrections were then merged in. Source files/code <a href="https://github.com/andersju/gdpr-xml">available on GitHub</a>.</p>
  <p>This is a service by <a href="https://dataskydd.net/english">Dataskydd.net</a>. The texts are © European Union, 2018.</p>

  <ul>
EOF

for i in "${LANGUAGES[@]}"
do
  echo "<li>${i}: <a href=\"${i}/art\">articles</a>, <a href=\"${i}/rec\">recitals</a>.</li>" >> site/index.html
done

cat <<EOF >> site/index.html
  </ul>
  </body>
  </html>
EOF