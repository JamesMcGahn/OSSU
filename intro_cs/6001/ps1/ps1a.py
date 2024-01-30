def main():

    annual_salary = float(input("what is your annual salary: "))
    portion_saved = float(input("What portion of your salary is saved?: "))
    total_cost = float(input("What is the total cost of the house?: "))
    
    current_savings = 0
    rate_of_return = .04
    portion_down_payment = .25*total_cost
    print(portion_down_payment)
    months = 0
    while (portion_down_payment > current_savings ):
        monthly_return = (current_savings * rate_of_return)/12
        current_savings += (annual_salary / 12)*portion_saved
        current_savings += monthly_return
        months += 1
        print(months, current_savings, portion_down_payment)
        
    print(f"Number of Months: {months}")      


main()