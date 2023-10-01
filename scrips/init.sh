#!/bin/bash

# rename to project specific values
NAME="seg"
CONST="seg"
STRUCT="seg"
FN="seg"

# will be replaced
seg_NAME="seg"
seg_STRUCT="seg"
seg_CONST="seg"
seg_FN="seg"

function replace() {
	echo "Replacing $1 with $2"
	find ./ -type f -name '*.c' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.h' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.md' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.lua' -exec sed -i "s/$1/$2/g" {} \;
	find ./ -type f -name '*.sh' -exec sed -i "s/$1/$2/g" {} \;
	find ./doc/ -type f -name '*' -exec sed -i "s/$1/$2/g" {} \;
}

replace $seg_NAME $NAME
replace $seg_CONST $CONST
replace $seg_STRUCT $STRUCT
replace $seg_FN $FN

mv "include/$seg_NAME.h" "include/$NAME.h"
mv "src/$seg_NAME.c" "src/$NAME.c"
mv "doc/$seg_NAME" "doc/$NAME" 
