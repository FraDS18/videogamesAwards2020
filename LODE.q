[QueryItem="ShowConsole"]
PREFIX : <http://www.videogamesAwards.org/videogamesAwards2020#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?platform
WHERE{
	?platform a :Platform.
}

[QueryItem="ShowVideogame"]
PREFIX : <http://www.videogamesAwards.org/videogamesAwards2020#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?videogame ?title ?releaseDate ?platformName ?averageE ?averageU 
WHERE{
	?videogame :hasTitle ?title;
		   :hasReleaseDate ?releaseDate;
		   :hasAverageRatingExpert ?averageE;
		   :hasAverageRatingVideogamer ?averageU;
		   :hasPlatform ?platform.
                    ?platform :platformName ?platformName.
}

[QueryItem="ShowReview"]
PREFIX : <http://www.videogamesAwards.org/videogamesAwards2020#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?videogame ?review ?reviewer ?username ?score
WHERE{
	?videogame :videogameHasReview ?review.
	?review :reviewMadeBy ?reviewer.
	?review :hasScore ?score.
	?reviewer :hasUsername ?username
}
