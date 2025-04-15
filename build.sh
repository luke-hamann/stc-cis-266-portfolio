CONTENT="content"
TEMPLATES="templates"
OUTPUT="_site"

build_page() {
    source_file=$1
    template_file=$2
    target_file=$3

    pandoc "$CONTENT/$source_file" --template "$TEMPLATES/$template_file" | \
        tidy -indent -wrap 80 -quiet --tidy-mark no > \
        "$OUTPUT/$target_file"
}

# make site folder

if [ -d "$OUTPUT" ]
then
    rm -r "$OUTPUT"
fi

mkdir "$OUTPUT"

# copy static

cp -r static/* _site

# build pages

build_page index.md layout.html index.html
build_page CIS_Syllabi.md layout.html CIS_Syllabi.html
build_page projects.md layout.html projects.html
