def main():
    parts = [ "compressor", "muffler", "condensor", "vaporizer", "5 inch pipe", "10 inch pipe", "hose", "latch", "door", "window" ]
    weights = [ 50, 10, 35, 5, 3, 6, 1, 1, 2, 3 ]
    prices = [105.39, 56.79, 227.99, 43.44, 10.27, 20.54, 3.29, 10.79, 7.99, 4.79 ]
    
    
    # Zip the lists into one list and print out the results.
    
    mylist = []
    for item in parts:
        mylist.append(item)
    for item in weights:
        mylist.append(item)
    for item in prices:
        mylist.append(item)
    
    print(mylist)
    
    # write a function called getrightparts, 
    # which will perform list comprehension on the list of tuples.
    
    def getrightparts():

main()
    
