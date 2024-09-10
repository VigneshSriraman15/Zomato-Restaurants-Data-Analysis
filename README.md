# Zomato Restaurants Data Analysis :-

## Introduction :

· This analysis explores Zomato's restaurant data to identify significant trends and patterns that can inform both strategic decisions and operational improvements. Through a detailed examination of factors such as customer ratings, popular cuisines, and restaurant locations, we aim to deliver actionable insights that can enhance both restaurant management and consumer experience.

· The Zomato Restaurant Dataset is an extensive collection of restaurant information obtained from the Zomato food delivery platform from 2010 to 2018, covering a diverse range of countries. This dataset encompasses a wide range of details, including restaurant names, locations, cuisines, ratings, and other relevant attributes, offering a comprehensive view of dining options.

## Data Cleaning :

· Handling Missing Values: Identified and addressed missing or incomplete data entries.

· Removing Duplicates: Ensured that duplicate records were eliminated to maintain data integrity.

· Standardizing Formats: Unified data formats and corrected inconsistencies across various fields.

· Validating Data: Verified data accuracy and consistency to ensure reliable analysis.

## Tools & Technologies Used :

· Excel – Pivot Tables & Charts

· My SQL for database querying

· Tableau & Power BI for creating interactive Dashboards

## Key Takeaways (KPIs) :

### 1. Build a country Map Table

· We have created a comprehensive lookup table that maps each country code in our dataset to its corresponding country name. This will facilitate easier data interpretation and enhance the accuracy of our analysis by ensuring that country references are clear and standardized.

· This reference table that links each country code with its full country name. This enhancement will improve our ability to perform detailed country-level analysis and generate more meaningful insights.

### 2. Build a Calendar Table using the Column Datekey

· We have created a detailed table based on the restaurant opening data with the following columns.

· Year, Monthno, Monthfullname, Quarter, YearMonth, Weekdayno, Weekdayname, FinancialMonth &  FinancialQuarter.

· This table will be instrumental for our data analysis by enabling detailed temporal breakdowns and trend analysis. It allows for the examination of restaurant openings across different times of the year, financial periods, and fiscal quarters, thereby providing deeper insights into seasonal trends and financial patterns in the restaurant industry.

### 3. Find the Numbers of Resturants based on City and Country

· This bar chart displays the number of restaurants in various countries. 

· India leads with a significant number of 8,652 restaurants.

· United States of America follows with 434 restaurants.

· The chart clearly emphasizes India's significant lead in the number of restaurants compared to other countries, reflecting a high density of dining establishments in that region.

· Analyzing the city-wise restaurant counts, we observe, New Delhi has the highest number of restaurants, with a notable 5,473 establishments.

· Lucknow and Mysore also have significant restaurant counts, with 1,098 and 1,088 restaurants, respectively.

· Several other cities, including Augusta, Athens, and Patna, have approximately 251 restaurants each.

· This distribution underscores New Delhi’s leading position in terms of restaurant density, while also highlighting the significant variance in restaurant counts across different cities.

### 4. Numbers of Resturants opening based on Year , Quarter , Month

· The visuals indicate that the highest number of restaurants were opened in the year 2018. This peak suggests a notable surge in restaurant establishment during this year, reflecting potential trends or market conditions that contributed to this increase.

· The analysis reveals that the average number of restaurant openings per year is 1,060. This figure represents the typical annual trend for new restaurant establishments, providing a baseline for understanding fluctuations and trends over time.

· Upon analyzing the year-on-year percentage change in restaurant openings, we observed notable trends :

· From 2016 to 2017, there was a significant increase in restaurant openings, with a percentage rise of 5.74%.

· In contrast, from 2011 to 2012, there was a considerable decline in restaurant openings, with a percentage decrease of -6.92%, indicating a reduction in new establishments during that period.

· These variations highlight periods of substantial growth as well as downturns in the restaurant industry.

### 5. Count of Resturants based on Average Ratings

· The visual indicates that the majority of restaurants falls within the 3.0 to 3.5 rating range, with a total count of 2,490 restaurants. And then followed by the 1.0 to 1.5 rating range, which includes 2,148 restaurants. The significant presence of restaurants in the lower rating range suggests a higher number of establishments with less favorable customer satisfaction.

· Notably, 99% of the restaurants in the 1.0 to 1.5 rating range are located in India. Furthermore, approximately 95-97% of these restaurants lack online delivery and table booking services. This absence of key customer convenience features could be contributing to the lower satisfaction levels observed in these ratings.

### 6. Create buckets based on Average Price of reasonable size and find out how many resturants falls in each buckets

· Nearly 50% of the restaurants falls within the 100-500 price range, which is the most common price range. However, this range has the lowest average rating of 2.42, indicating lower customer satisfaction for these establishments.

· In contrast, restaurants with an average price range of 1,000-2,000 have a significantly higher average rating of 3.62 and receive 33.25% of the total votes. This suggests that higher-priced restaurants tend to have better customer satisfaction and more favorable reviews.

· The highest-rated restaurants are found in the price range above 10,000. Although these establishments have the highest ratings, they represent the smallest proportion of both restaurant counts and customer votes.

### 7. Percentage of Resturants based on "Has_Table_booking" & "Has_Online_delivery"

· The visual reveals that a significant majority of restaurants lack key customer convenience features :

· Approximately 88% of restaurants do not offer a table booking facility.

· Around 75% of restaurants do not provide online delivery services.

· These findings highlight a widespread absence of these services, which could impact overall customer satisfaction and accessibility.

· Restaurants that don’t offer table booking & online delivery service tend to have lower average ratings. This could imply that customers value the convenience of these two key features and might be frustrated by the lack of this option, which affects their overall experience and rating.

· Conversely, restaurants that don’t offer these two services are receiving more votes. This could imply that these restaurants are more frequented or well-known, which leads to more people leaving reviews. However, this higher volume of votes does not translate into higher average ratings, potentially due to dissatisfaction with the lack of delivery options.

· These restaurants might attract more customers who are willing to leave reviews, but the absence of delivery could impact the overall satisfaction negatively. If these two services could potentially improve customer satisfaction, restaurants that don’t offer these options might want to consider implementing it. 

### 8. Develop Charts based on Cusines, City, Ratings

· Among these top 5 cuisines, North Indian and Mughlai cuisines stand out with the highest ratings. This suggests that restaurants specializing in these cuisines are highly regarded by customers.

· North Indian and Mughlai restaurants not only have high average ratings but also receive a significant number of votes. This indicates strong customer satisfaction and possibly higher engagement with these cuisines.

· The fact that these cuisines also have a higher average cost suggests that customers are willing to spend more on dining experiences featuring North Indian and Mughlai foods. This might be due to the perceived value, quality, or exclusivity of these cuisines.

## Dashboards :

· Created interactive dashboards in different DA tools & its features as list below.

            1. 09 KPIs as explained in the key takeaways
            2. Filters & slicers to make the dashboards more interactive
            3. Navigation buttons that navigate to individual KPI page
            4. The company icon that takes us to Zomato Profile web page
            6. Year, quarter & month wise restaurants opening status  – Using Hierarchy
            7. Drill through by country – Using Power BI
            8. Additional KPI cards – Total Restaurants, Total Countries, Total Cities, Total Cuisines & Total Votes

## Recommendations :

· Capitalize on High-Density Markets: Given that India, and specifically cities like New Delhi, has a significant number of restaurants, there is potential for growth in less saturated cities or regions within the country. Expanding to emerging markets or less competitive areas could be beneficial.

· Target High-Performing Cities: Focus on maintaining and improving restaurant standards in cities with high restaurant counts, such as New Delhi, to leverage their already established customer base.

· Enhance Customer Convenience: Restaurants that do not offer online delivery or table booking services should consider implementing these features. This can potentially boost customer satisfaction and improve ratings, as the absence of these services is associated with lower ratings and customer dissatisfaction.

· Evaluate Service Gaps: For restaurants with lower ratings, especially those in the 1.0 to 1.5 range, assess and address the reasons behind poor performance. This might include improving service quality, enhancing the dining experience, or introducing key features like online delivery and table booking.

· Optimize the Price Range: For restaurants in the 100-500 price range, which have lower average ratings, explore ways to improve the value proposition. This could involve enhancing food quality, service standards, or offering additional features.

· Act on Reviews: Analyze customer reviews to identify common issues or areas for improvement. Use this feedback to make informed decisions about changes or enhancements to restaurant operations and offerings.

· Enhance Customer Engagement: Engage with customers to understand their needs and preferences better. This can help in tailoring services and features to align with customer expectations and improve overall satisfaction.
