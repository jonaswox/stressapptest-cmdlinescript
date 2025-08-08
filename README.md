# stressapptest-cmdlinescript
Just a shell script to make daily and custom runnings of SAT quick and ez! 

Syntax is such that you dont need to write all the annoying letters and still be able to do custom runs, and customize the script if your daily needs change. 

Current argList : [seconds, memory, copyThreads, stressThreads]
And toggle : -W , enable extra stressfull copy mode

If I call the script with 'stress_test.sh 1 1 1' I will assign the first 3 arguments in the argList. If it 
is called with 2 args, it is assumed you want to assign argList[0] and argList[1] to the respective args, and so on. 
-W can be placed wherever. 

for ez of use add; alias stresstest='./stress_test.sh' -> to your .bash_aliases or possibly .bashrc

Happy Stress!
