# Create your grading script here

CP=".:../lib/hamcrest-core-1.3.jar:../lib/junit-4.13.2.jar"

rm -rf student-submission
git clone $1 student-submission

cp TestListExamples.java student-submission

cd student-submission

if [ -e ListExamples.java ]
then
    javac -cp $CP *.java

    echo "Compiled"
    java -cp $CP org.junit.runner.JUnitCore TestListExamples > output.txt
    if [ $? -eq 0 ]
    then
        echo "100%"
        exit
    fi
    grep "failure" output.txt > result.txt
    exit
fi
echo "File was not found!"
    exit









