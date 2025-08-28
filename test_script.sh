#!/usr/bin/env bash

source utilities

title
echo
info "This is information"
echo
warn "This is a warning"
echo
success "This is a check"
echo
fail "This is a cross"
echo
box -t INFO "This is a box with text inside and a title"
echo
line
echo

process-file() {
    local file=$1
    sleep .01
}

echo "This is a progress bar"

len=200
i=0
setterm -cursor off
for file in {1..200}; do
    progress-bar "$((i+1))" "$len"
    process-file "$file"

    ((i++))
done
setterm -cursor on

echo
echo
echo "This is a spinner"
sleep 2 &
spinner $!
echo
echo "This is a read prompt"
seek var "Enter Name"
echo
echo "This is a Y/N request"
confirm var "You want to do this"
