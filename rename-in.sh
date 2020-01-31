#!/bin/ksh
cd manroot/man1; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man2; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man3; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man4; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man5; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man6; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man7; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man8; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done; cd ../..
cd manroot/man9; /bin/ls *.in | while read -r FILE; do mv -f -- "${FILE}" "${FILE%.in}"; done
