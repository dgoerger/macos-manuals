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
	find manroot -type f -name "__B\.*" -delete
	find manroot -type f -name "__H\.*" -delete
	find manroot -type f -name "Announce*" -delete
	find manroot -type f -name "ChangeLog*" -delete
	find manroot -type f -name "LICENSE*" -delete
	find manroot -type f -name "Makefile*" -delete
	find manroot -type f -name "NOTES*" -delete
	find manroot -type f -name "RELEASE*" -delete
	find manroot -type f -name "VMSca-response*" -delete
	find manroot -type f -name "bad-parm-exp*" -delete
	find manroot -type f -name "darwin*" -delete
	find manroot -type f -name "do_add*" -delete
	find manroot -type f -name "eval*" -delete
	find manroot -type f -name "irix*" -delete
	find manroot -type f -name "modrdn.out.master*" -delete
	find manroot -type f -name "redirection-error*" -delete
	find manroot -type f -name "return*" -delete
	find manroot -type f -name "solaris*" -delete
	find manroot -type f -name "sunos*" -delete
	find manroot -type f -name "test-minus-e*" -delete
	find manroot -type f -name "test_packets*" -delete
	find manroot -type f -name "test_signatures*" -delete
	find manroot -type f -name "test_ldnsrr*" -delete
	rm manroot/man8/Keychain\ Circle\ Notification.8
	rm manroot/man2/aix-4.3.2
	rm manroot/man5/aix-3.2.5
	rm manroot/man5/aix-4.1.5
	rm manroot/man4/break4.4
	rm manroot/man4/break5.4
	rm manroot/man4/bsd4.4
	rm manroot/man5/configure-tcl8.0.5
	rm manroot/man4/dgux5.4
	rm manroot/man3/freebsd-3.3
	rm manroot/man2/glibc-2.2
	rm manroot/man3/glibc-2.1.3
	rm manroot/man6/glibc-2.2-XF86-3.3.6
	rm manroot/man2/hp-3.2
	rm manroot/man2/hp-5.2
	rm manroot/man8/pngstest-1.8
	rm manroot/man2/s60.mmp.2
	rm manroot/man2/test.2
	rm manroot/man3/test.3
	rm manroot/man1/test_nsec3_hash.1
	rm manroot/man7/text-dump-0.7
	/bin/ksh -c 'MANPATH=manroot makewhatis'

clean:
	rm -f *.tar.gz fetch-src.sh
	rm -rf manroot/ tmp/
