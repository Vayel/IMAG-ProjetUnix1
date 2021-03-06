HERE=$(shell pwd)

SOURCE=$(HERE)/src
DEST=$(HERE)/dest

THUMB_DIRNAME=thumbnails
THUMB_DIR=$(DEST)/$(THUMB_DIRNAME)
INDEX_NAME=index.html
INDEX_PATH=$(DEST)/index.html

IMAGES=${shell cd $(SOURCE) && echo *.jpg}
IMAGE_DESC=$(IMAGES:%.jpg=$(DEST)/%.inc)
IMAGE_SRC=$(IMAGES:%=$(SOURCE)/%)
IMAGE_DEST=$(IMAGES:%=$(DEST)/%)

.PHONY: dir
dir:
	${shell . "$(HERE)"/utilities.sh ; create_dir "$(THUMB_DIR)"}

%.inc: dir ./exiftags
	$(HERE)/make-inc.sh "$@" "$(SOURCE)" "$(THUMB_DIRNAME)" > "$@"

%.html: $(IMAGE_DESC)
	$(HERE)/make-index.sh "$(IMAGE_DESC)" > "$@"

%.jpg: dir
	$(HERE)/make-thumb.sh "$@" "$(SOURCE)" "$(THUMB_DIR)"

.PHONY: pages
pages: dir
	$(HERE)/make-pages.sh "$(SOURCE)" "$(DEST)" "$(INDEX_NAME)"

.PHONY: gallery
gallery: $(IMAGES) pages $(INDEX_PATH)

.PHONY: view
view: gallery 
	firefox "$(INDEX_PATH)"

clean:
	$(HERE)/clean.sh "$(DEST)"

# Simplified version of exiftags's Makefile
EXIFTAGS_OBJS=exiftags-1.01/exif.o exiftags-1.01/tagdefs.o exiftags-1.01/exifutil.o \
	exiftags-1.01/exifgps.o exiftags-1.01/jpeg.o exiftags-1.01/makers.o \
	exiftags-1.01/canon.o exiftags-1.01/olympus.o exiftags-1.01/fuji.o \
	exiftags-1.01/nikon.o exiftags-1.01/casio.o exiftags-1.01/minolta.o \
	exiftags-1.01/sanyo.o exiftags-1.01/asahi.o exiftags-1.01/leica.o \
	exiftags-1.01/panasonic.o exiftags-1.01/sigma.o exiftags-1.01/exiftags.o
EXIFTAGS_HDRS=exiftags-1.01/exif.h exiftags-1.01/exifint.h \
	exiftags-1.01/jpeg.h exiftags-1.01/makers.h

%.o: %.c $(EXIFTAGS_HDRS)
	$(CC) $(CFLAGS) -o $@ -c $<

./exiftags: $(EXIFTAGS_OBJS)
	$(CC) $(CFLAGS) -o $@ $(EXIFTAGS_OBJS) -lm
