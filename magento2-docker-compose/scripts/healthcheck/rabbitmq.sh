#!/bin/bash

nc -z localhost 5672 > /dev/null || exit 1;