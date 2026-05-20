#!/bin/bash

function kryptojptr() {
    if ! [ -f "./requirements.txt" ]
    then echo "Are you in the right directory?">&2 && return 1
    fi

    python3 -m venv env;
    source env/bin/activate;
    pip install -r "requirements.txt";

    return 0;
}
