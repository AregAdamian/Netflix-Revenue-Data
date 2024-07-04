# Netflix Revenue and Subscription Analysis (2018-2020)

Portfolio project analytics Netflix subscription and revenue trends from 2018-2020.
Interactive Tableau dashboard can be found [here](https://public.tableau.com/app/profile/areg.adamian/viz/NetflixSubscriberandRevenueData/Dashboard3#1).

![Screenshot of dashboard](https://github.com/AregAdamian/Netflix-Revenue-Data/blob/main/Dashboard.png)

## Summary of Insights
### Subscribers
- There is a significant dip in subscriber growth in Q2 2019 across all regions.
- Q1 2020 had the largest jump in subscribers, particularly in the US and Canada region.
### Revenue
- Most of Netflix's revenue came from the US and Canada.
- The average revenue per user (ARPU) values seem higher than anticipated.
### Region
- Latin America showed the most fluctuation in its revenue, growing as much as 45% in Q1 2019, but falling below 0 twice in two years.
- Ad users made up most of the userbase despite premium accounting for ~90% of the revenue.
- The Asia-Pacific region saw the most growth in its revenue each quarter despite having the lowest total revenue of all regions.
## Recommendations and Next Steps
- Investigate how different plan types and their pricing affect these insights. Based on this, it would also be useful to see how much revenue comes from active users.
- Consider the impacts of competitive streaming services and changes in the Netflix catalogue.
- While regional subscription trends have remained relatively consistent, Latin America has been the most volatile in its revenue. Investigate whethere are promotions or features that can help stabilize its revenue.


## Data Analysis
### Data Cleaning in SQL
- Performed EDA to determine what KPIs can be dervied from the data and if any cleaning needed to be done
- Converted quarters to dates (i.e. April 1 is Q1)
- Create a column for previous revenue/subscriber count
- Calculate growth and difference using previous revenue/subscriber data
### Prep for Visualization
- Combined the data from both CSV files on the date and the region
- Created a calculated field for ARPU (Revenue/Subs)
- Based on the KPIs that could be extracted from the dataset, I created appropriate visualizations for each and designed the dashboard for them.
