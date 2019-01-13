## Git bisect exercise

[Original Repo](https://github.com/bast/git-bisect-exercise).

This is my implementation for the bonus exercise of the project

I added an automation script for finding the bad commit

## How to use
```
git clone git@github.com:lbkvu/git-bisect-exercise.git
cd git-bisect-exercise
chmod +x automate-git-bisect.sh test_result.sh
./automate-git-bisect.sh
```
The script accepts none or 1 argument. The argument is a good commit ID.

If no argument is passed, the script picks the 1st commit ID as a good commit ID.

