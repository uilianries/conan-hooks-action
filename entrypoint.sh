#!/bin/bash

conan create . conan/testing -tf False | grep "HOOK -"
