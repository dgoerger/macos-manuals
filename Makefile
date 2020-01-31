all:
	# fail early and hard if we don't have a clean workspace
	mkdir manroot
	sh ./generate-download-list.sh
	sh ./fetch-src.sh
	# extract
	mkdir tmp
	find . -type f -name "*.tar.gz" -exec tar -C tmp -xzf {} \; 2>/dev/null
	# collate into manroot/
	mkdir -p manroot/man1
	mkdir -p manroot/man2
	mkdir -p manroot/man3
	mkdir -p manroot/man4
	mkdir -p manroot/man5
	mkdir -p manroot/man6
	mkdir -p manroot/man7
	mkdir -p manroot/man8
	mkdir -p manroot/man9
	find tmp -type f -name "*.1" -exec cp -p {} manroot/man1/ \; 2>/dev/null
	find tmp -type f -name "*.1.in" -exec cp -p {} manroot/man1/ \; 2>/dev/null
	find tmp -type f -name "*.2" -exec cp -p {} manroot/man2/ \; 2>/dev/null
	find tmp -type f -name "*.2.in" -exec cp -p {} manroot/man2/ \; 2>/dev/null
	find tmp -type f -name "*.3" -exec cp -p {} manroot/man3/ \; 2>/dev/null
	find tmp -type f -name "*.3.in" -exec cp -p {} manroot/man3/ \; 2>/dev/null
	find tmp -type f -name "*.4" -exec cp -p {} manroot/man4/ \; 2>/dev/null
	find tmp -type f -name "*.4.in" -exec cp -p {} manroot/man4/ \; 2>/dev/null
	find tmp -type f -name "*.5" -exec cp -p {} manroot/man5/ \; 2>/dev/null
	find tmp -type f -name "*.5.in" -exec cp -p {} manroot/man5/ \; 2>/dev/null
	find tmp -type f -name "*.6" -exec cp -p {} manroot/man6/ \; 2>/dev/null
	find tmp -type f -name "*.6.in" -exec cp -p {} manroot/man6/ \; 2>/dev/null
	find tmp -type f -name "*.7" -exec cp -p {} manroot/man7/ \; 2>/dev/null
	find tmp -type f -name "*.7.in" -exec cp -p {} manroot/man7/ \; 2>/dev/null
	find tmp -type f -name "*.8" -exec cp -p {} manroot/man8/ \; 2>/dev/null
	find tmp -type f -name "*.8.in" -exec cp -p {} manroot/man8/ \; 2>/dev/null
	find tmp -type f -name "*.9" -exec cp -p {} manroot/man9/ \; 2>/dev/null
	find tmp -type f -name "*.9.in" -exec cp -p {} manroot/man9/ \; 2>/dev/null
	sh ./rename-in.sh
	/bin/ksh -c 'MANPATH=manroot makewhatis'

clean:
	rm -f *.tar.gz fetch-src.sh
	rm -rf manroot/ tmp/
