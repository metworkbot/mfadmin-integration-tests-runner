#!/bin/bash
cd mfadmin/integration_tests

ret=0
for rep in *; do
    if [ -d $rep ]; then
        cd $rep
        #LAYERS_TO_LOAD=`cat .layerapi2_dependencies |xargs |sed 's/ /,/g'`
        for test in test*.sh; do 
            echo "Test" $test "in" $rep
            #layer_wrapper --layers=$LAYERS_TO_LOAD -- ./$test
            ./$test
            if test $? == 0; then
                echo "Test $test OK"
            else
                echo "Test $test KO"
                ret=1
            fi
        done
        cd ..
    fi
done
exit $ret
