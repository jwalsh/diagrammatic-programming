
# Requires: mermaid.cli (npm install -g mermaid.cli)
# Requires: ImageMagick (brew install imagemagick)
%.png: %.mmd  # Convert Mermaid files to PNG 
	mmdc -i $< -o $@ -b transparent -w 1024 -H 768
	convert $@ -trim $@