# Problem Set 4A
# Name: <your name here>
# Collaborators:
# Time Spent: x:xx

def get_permutations(sequence):
    '''
    Enumerate all permutations of a given string

    sequence (string): an arbitrary string to permute. Assume that it is a
    non-empty string.  

    You MUST use recursion for this part. Non-recursive solutions will not be
    accepted.

    Returns: a list of all permutations of sequence

    Example:
    >>> get_permutations('abc')
    ['abc', 'acb', 'bac', 'bca', 'cab', 'cba']

    Note: depending on your implementation, you may return the permutations in
    a different order than what is listed here.
    '''
    arr = [let for let in sequence]
    
    l = []
    def req(arr, n):
        if  n == len(arr)-1:
            l.append("".join(arr))
            
            return 
        else:
            for i in range(n, len(arr)):
            
                temp = arr[i]
                arr[i] = arr[n]
                arr[n] = temp
                req(arr, n+1)
                temp = arr[i]
                arr[i] = arr[n]
                arr[n] = temp
    req(arr,0)
    return l


 #delete this line and replace with your code here

if __name__ == '__main__':
#    #EXAMPLE
    example_input = 'abc'
#    print('Input:', example_input)
    print('Expected Output:', ['abc', 'acb', 'bac', 'bca', 'cab', 'cba'])
    print('Actual Output:', get_permutations(example_input,))
    
#    # Put three example test cases here (for your sanity, limit your inputs
#    to be three characters or fewer as you will have n! permutations for a 
#    sequence of length n)

    #delete this line and replace with your code here

