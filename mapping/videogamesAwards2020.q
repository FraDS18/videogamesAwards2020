[QueryItem="Query0"]
PREFIX : <http://www.videogamesAwards.org/videogamesAwards2020#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?videogame ?title
WHERE{
    ?videogame :hasTitle ?title
}

[QueryItem="ShoConsole"]
PREFIX : <http://www.videogamesAwards.org/videogamesAwards2020#>
PREFIX owl: <http://www.w3.org/2002/07/owl#>
PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
PREFIX xsd: <http://www.w3.org/2001/XMLSchema#>
PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>

SELECT ?platform
WHERE{
	?platform a :Platform.
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
