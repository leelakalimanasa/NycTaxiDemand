import pandas as pd
from datetime import datetime, timedelta

# Generate a time series for all the dates and times in March 2023
start_date = datetime(2023, 3, 1)
end_date = datetime(2023, 3, 31, 23, 59, 59)

date_range = pd.date_range(start=start_date, end=end_date, freq='1T')

# Create a DataFrame with the generated time series
df = pd.DataFrame({'Timestamp': date_range})

# Save the DataFrame to an Excel file
excel_file_path = 'time_series_march_2023.xlsx'
df.to_excel(excel_file_path, index=False, engine='openpyxl')

print(f"Time series for March 2023 has been generated and saved to {excel_file_path}.")
