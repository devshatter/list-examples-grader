# Create your grading script here

CP=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission 2> /dev/null

cp TestListExamples.java student-submission > hide.txt

cd student-submission

if [ -e ListExamples.java ]
then
    javac -cp $CP *.java
    if [ $? -ne 0 ]
    then
        echo "Compiler Error! -> Fail"
        exit
    fi

    echo "Compiled"
    java -cp $CP org.junit.runner.JUnitCore TestListExamples > output.txt
    if [ $? -eq 0 ]
    then
        echo "100% of tests passed -> Pass"
        exit
    fi
    grep "failure" output.txt > result.txt
    score="$(grep 'failure' output.txt)"
    
    if [ "$score" = "There were 2 failures:" ]
    then
        echo "0% of tests passed- > Fail"
        exit
    elif [ "$score" = "There was 1 failure:" ]
    then
        echo "50% of tests passed -> Fail"
    fi
    exit
fi
echo "File was not found! -> Fail"
    exit









