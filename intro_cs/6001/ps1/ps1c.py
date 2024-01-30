def main():

    annual_salary = float(input("what is your annual salary: "))
   
  
    total_cost = 1000000
    current_savings = 0
    rate_of_return = .04
    portion_down_payment = .25*total_cost
    semi_annual_raise =.07
    print(portion_down_payment)
    months = 0
    epsilon = 100
    high = 1
    low  = 0
    portion_saved_guess = high+low/2
    step = 0

    

    while ((portion_down_payment - round(current_savings,2)) >= epsilon):
        
        current_savings = test_rate(annual_salary, portion_saved_guess)

        if (current_savings < portion_down_payment):
            if (portion_saved_guess == 1.0):
                print("Sorry you dont make enough money.")
                break
            low = portion_saved_guess
        else:
            high = portion_saved_guess
            current_savings = 0       
        portion_saved_guess = high+low/2
        step +=1
    
    print(f"Best savings rate: {portion_saved_guess}")
    print(f"Steps in bisection search: {step}")
    

        


def test_rate(annual_salary,portion_saved_guess ):
    current_savings = 0
    for months in range(1,37):
        monthly_return = (current_savings * .04)/12
        current_savings += (annual_salary / 12)*portion_saved_guess
        current_savings += monthly_return
       
        if(months % 6 == 0):
            annual_salary += annual_salary * .07
    print(f"rate: {portion_saved_guess} - total: {current_savings:.2f} - months: {months}")   
    return current_savings 


main()