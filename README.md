# carwow technical test

Details of the task will be shared by the interviewer when your interview starts. Please fill in the below candidate details and push this change to GitHub to confirm you are able to commit and push to this GitHub repository and also able to run the example Ruby file.

# Candidate details
Name: Richard Vickerstaff

Date of interview: 20/01/2021

Can run examples shown below: yes/no

Can run passing tests with `rspec`: yes/no

# Running

The following basic example files have been given:

* `>bin/editor examples/show.txt` Should output 'There is no image'
* `>bin/editor examples/create.txt` Should output a 4x3 "blank" image

# Todo

A non exaustive list of tasks I would like to add to improve the reliability and readability of the code.

* Add validation for the `InputProcessor` `colour`
* Add validation for the `InputProcessor` `segment_range` and `segment_position` (reuse the x and y validation)
* Remove duplication of concept from `InputProcessor#line_parser` and `Editor#run`, where they both check the inputs command
* Extract the file handeling from the `Editor#run`, so that other input sources could be used
