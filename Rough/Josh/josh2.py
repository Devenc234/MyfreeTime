def main():
    parts = [ "compressor", "muffler", "condensor", "vaporizer", "5 inch pipe", "10 inch pipe", "hose", "latch", "door", "window" ]
    weights = [ 50, 10, 35, 5, 3, 6, 1, 1, 2, 3 ]
    prices = [105.39, 56.79, 227.99, 43.44, 10.27, 20.54, 3.29, 10.79, 7.99, 4.79 ]


    # Zip the lists into one list and print out the results.

    zippedparts = zip(parts,weights,prices)
    zippedpartlist = list(zippedparts)
    print('My zipped list:')
    print(zippedpartlist)

    # write a function called getrightparts,
    # which will perform list comprehension on the list of tuples.
    # The getrightparts function will form a list of part tuples that both weigh more than 4 and cost less than 60, then return the resulting parts list.
    # There should be only three parts that meet these requirements.
    def getrightparts(zippedpartlist):
        rightpart = [ part for i, part in enumerate(zippedpartlist) if part[1]>4 and part[2]<60 ]
        return rightpart


    myparts = getrightparts(zippedpartlist)
    print('\nOutput for getrightparts() function:')
    print(myparts)

    mydict = {k:v for k, v in enumerate(myparts)}
    print('\nCreated dictionary')
    print(mydict)


    from random import randint
    number = randint(0, len(myparts)-1)
    print('\nSelecting a random number and printing the parts details:')
    print('number: {}'.format(number))
    print(zippedpartlist[number])

main()
