# vacasa_iOS

Vacasa iOS Test

About the challenge
Develop a simple mobile app which uses the GitHub REST API to display the list of public
repositories belonging to an organization, plus a very simple settings screen.

How to fetch github repositories
1. Send HTTP GET request to URL https://api.github.com/search/repositories
2. Make sure to send “Accept” HTTP header with value application/vnd.github.v3+json
3. The sample curl will look like this (using the Vacasa Open Source organization
“vacasaoss”)
curl
"https://api.github.com/search/repositories?q=org:vacasaoss&sort=stars&order=desc"
-H 'Accept: application/vnd.github.v3+json'
4. For more information visit this link
https://docs.github.com/en/rest/reference/search#search-repositories

UX Design
1. An item in the repositories list shows the repository name and description.
2. Settings is a static screen with hardcoded text and image. Any image can be used to
replace “Vacasa Logo”.
3. Any color and font can be used to develop this application.
