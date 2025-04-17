# IMDb Spark Project
Цей проєкт реалізує аналіз великого датасету IMDb за допомогою Apache Spark. Використовуються можливості PySpark для попередньої обробки, з’єднання таблиць, агрегацій, рейтингового ранжування, а також статистичної аналітики.

## Як запустити
	1.	Встанови залежності:
pip install -r requirements.txt

	2. Працюй з Jupyter/Google Colab через notebooks/.

## Dataset Description

The IMDB (Internet Movie Database) dataset is one of the most comprehensive movie and TV show databases in the world. This analysis focuses on seven main tables from the dataset:

### 1. title.basics
This table contains basic information about titles (movies, TV shows, etc.) with the following fields:
- `tconst` (string): Unique identifier for each title
- `titleType` (string): Type of title (movie, TV series, short, etc.)
- `primaryTitle` (string): The more popular title in the original language
- `originalTitle` (string): Original title in the original language
- `isAdult` (boolean): Indicates if the title is adult content
- `startYear` (integer): Release year of the title
- `endYear` (integer): End year for TV series (NULL for movies)
- `runtimeMinutes` (integer): Runtime in minutes
- `genres` (string): Comma-separated list of genres

### 2. title.ratings
This table contains rating information for titles with the following fields:
- `tconst` (string): Unique identifier for each title (links to title.basics)
- `averageRating` (double): Average rating from 1.0 to 10.0
- `numVotes` (integer): Number of votes the title has received

### 3. title.crew
This table contains information about directors and writers for titles:
- `tconst` (string): Unique identifier for the title
- `directors` (string): Comma-separated list of director nconsts
- `writers` (string): Comma-separated list of writer nconsts

### 4. title.principals
This table contains information about principal cast/crew members for titles:
- `tconst` (string): Unique identifier for the title
- `ordering` (integer): Order of importance in the credits
- `nconst` (string): Unique identifier for the person
- `category` (string): Category of job (actor, director, etc.)
- `job` (string): Specific job title
- `characters` (string): Character name if applicable

### 5. name.basics
This table contains basic information about people in the IMDB database:
- `nconst` (string): Unique identifier for the person
- `primaryName` (string): Name by which the person is most often credited
- `birthYear` (integer): Year of birth
- `deathYear` (integer): Year of death if applicable
- `primaryProfession` (string): Comma-separated list of primary professions
- `knownForTitles` (string): Comma-separated list of titles the person is known for

### 6. title.akas
This table contains alternative titles for movies and TV shows:
- `titleId` (string): Unique identifier for the title
- `ordering` (integer): Order of the title in the list
- `title` (string): Alternative title
- `region` (string): Region where this title is used
- `language` (string): Language of the title
- `types` (string): Type of title (alternative, working title, etc.)
- `attributes` (string): Additional attributes
- `isOriginalTitle` (boolean): Whether this is the original title

### 7. title.episode
This table contains episode information for TV shows:
- `tconst` (string): Unique identifier for the episode
- `parentTconst` (string): Unique identifier for the parent TV show
- `seasonNumber` (integer): Season number
- `episodeNumber` (integer): Episode number

### Dataset Relationships
The tables are related through the following key fields:
- `tconst` links `title.basics`, `title.ratings`, `title.crew`, `title.principals`, and `title.episode`
- `nconst` links `name.basics` with `title.principals` and the director/writer lists in `title.crew`
- `titleId` in `title.akas` corresponds to `tconst` in other title-related tables
- `parentTconst` in `title.episode` links to the parent TV show's `tconst`

### Business Value
This dataset is valuable for:
1. Understanding content trends over time
2. Analyzing audience preferences through ratings
3. Identifying popular genres and content types
4. Studying the relationship between runtime and ratings
5. Comparing different types of content (movies vs TV shows)
6. Analyzing cast and crew relationships
7. Studying international title variations
8. Understanding TV show episode structures

### Data Quality Notes
- The dataset is regularly updated and maintained by IMDB
- Some older titles may have incomplete information
- Ratings are based on user submissions and may be biased
- The dataset includes both current and historical content