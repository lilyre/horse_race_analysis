# Horse Racing Analysis

## Initial EDA

The initial exploratory data analysis can be found in the `Horse EDA.ipynb` file.
Here, I explore, clean and analyse some of the data to gain an understanding of what the data looks like and what it is telling us.

## Data Modelling

The rest of this repository is a dbt project. I model the data in the `models/` folder, where I have my staging, intermediate and reporting layer.

The staging layer is where I do some light transformation, such as removing columns and reformatting columns names.

The intermediate layer is where I model the data into a star schema, with my fact table including all race events, and the dimensions containing descriptive attributes.

Finally, the reporting layer is where I created some final analysis tables that could be used in a BI tool for further analysis and visualisations.
