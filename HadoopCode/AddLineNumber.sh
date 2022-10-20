#!/bin/bash
for filename in ./input/*; do
    cat -n $filename > tmp && mv tmp $filename
done