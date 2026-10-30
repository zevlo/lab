# User inputs
annual_salary = float(input("Enter your annual salary: "))
portion_saved = float(input("Enter the percent of your salary to save, as a decimal: "))
total_cost = float(input("Enter the cost of your dream home: "))

# Constants and initialization
portion_down_payment = 0.25
current_savings = 0.0
r = 0.04  # Annual investment rate of return

# Calculated targets and monthly values
down_payment_needed = total_cost * portion_down_payment
monthly_salary = annual_salary / 12
monthly_savings = monthly_salary * portion_saved

months = 0

# Simulation loop
while current_savings < down_payment_needed:
    # Monthly investment return added to savings
    current_savings += current_savings * (r / 12)
    # Portion of monthly salary added to savings
    current_savings += monthly_savings
    months += 1

print(f"Number of months: {months}")
