# per https://opensource.apple.com/release/macos-10145.html

all:
	# fail early and hard if we don't have a clean workspace
	mkdir manroot
	# Darwin kernel
	curl -LOs https://opensource.apple.com/tarballs/xnu/xnu-4903.241.1.tar.gz
	# libc
	curl -LOs https://opensource.apple.com/tarballs/Libc/Libc-1272.250.1.tar.gz
	# cmds
	curl -LOs https://opensource.apple.com/tarballs/adv_cmds/adv_cmds-172.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/basic_cmds/basic_cmds-55.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/bootstrap_cmds/bootstrap_cmds-99.260.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/diskdev_cmds/diskdev_cmds-593.230.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/doc_cmds/doc_cmds-51.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/file_cmds/file_cmds-272.250.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/mail_cmds/mail_cmds-33.1.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/misc_cmds/misc_cmds-34.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/network_cmds/network_cmds-543.260.3.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/patch_cmds/patch_cmds-17.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/remote_cmds/remote_cmds-60.200.2.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/shell_cmds/shell_cmds-179.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/system_cmds/system_cmds-336.6.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/text_cmds/text_cmds-99.tar.gz
	# misc
	curl -LOs https://opensource.apple.com/tarballs/awk/awk-24.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/bash/bash-106.220.2.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/bc/bc-21.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/bmalloc/bmalloc-7607.2.6.1.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/dtrace/dtrace-284.250.4.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/kext_tools/kext_tools-528.250.3.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/ksh/ksh-25.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/lsof/lsof-62.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/system_config/system_config-55.50.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/tcpdump/tcpdump-83.200.2.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/top/top-111.220.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/xar/xar-417.1.tar.gz
	curl -LOs https://opensource.apple.com/tarballs/zsh/zsh-72.tar.gz
	# extract
	mkdir tmp
	find . -type f -name "*.tar.gz" -exec tar -xzf -C tmp {} \; 2>/dev/null
	# collate into manroot/
	/bin/ksh -c 'mkdir -p manroot/{man1,man2,man3,man4,man5,man6,man7,man8,man9}'
	find . -type f -name "*.1" -exec cp -p {} manroot/man1/ \; 2>/dev/null
	find . -type f -name "*.1.in" -exec cp -p {} manroot/man1/ \; 2>/dev/null
	find . -type f -name "*.2" -exec cp -p {} manroot/man2/ \; 2>/dev/null
	find . -type f -name "*.2.in" -exec cp -p {} manroot/man2/ \; 2>/dev/null
	find . -type f -name "*.3" -exec cp -p {} manroot/man3/ \; 2>/dev/null
	find . -type f -name "*.3.in" -exec cp -p {} manroot/man3/ \; 2>/dev/null
	find . -type f -name "*.4" -exec cp -p {} manroot/man4/ \; 2>/dev/null
	find . -type f -name "*.4.in" -exec cp -p {} manroot/man4/ \; 2>/dev/null
	find . -type f -name "*.5" -exec cp -p {} manroot/man5/ \; 2>/dev/null
	find . -type f -name "*.5.in" -exec cp -p {} manroot/man5/ \; 2>/dev/null
	find . -type f -name "*.6" -exec cp -p {} manroot/man6/ \; 2>/dev/null
	find . -type f -name "*.6.in" -exec cp -p {} manroot/man6/ \; 2>/dev/null
	find . -type f -name "*.7" -exec cp -p {} manroot/man7/ \; 2>/dev/null
	find . -type f -name "*.7.in" -exec cp -p {} manroot/man7/ \; 2>/dev/null
	find . -type f -name "*.8" -exec cp -p {} manroot/man8/ \; 2>/dev/null
	find . -type f -name "*.8.in" -exec cp -p {} manroot/man8/ \; 2>/dev/null
	find . -type f -name "*.9" -exec cp -p {} manroot/man9/ \; 2>/dev/null
	find . -type f -name "*.9.in" -exec cp -p {} manroot/man9/ \; 2>/dev/null
	sh ./rename-in.sh
	/bin/ksh -c 'MANPATH=manroot makewhatis'

clean:
	rm -f *.tar.gz
	rm -rf manroot/ tmp/
