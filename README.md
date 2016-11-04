Project 2 - Tree Library Database

App address - https://melbourne-tree-library.herokuapp.com/

 Having worked in forest inventory in the past, I have developed an appreciation of the various types of trees I come across. Therefore I chose to create an app that allowed people to log their photos of interesting trees they come across in the city of Melbourne where I currently reside.

The web application, allows users to create a log in with an email and password, and are given the ability to customize their profile to a limited extent. They can make postings of their tree sightings with photos and locations. Users can also make comments on their and others posts.

Approach

Having covered server-side web applications in our previous few weeks, I approached the project using Ruby and the Sinatra web framework to generate the web app on a local server. I also used psql to store relevant user information and use the Active Record database management tool to connect and manipulate the database using Ruby and Sinatra. I also used the Google maps API to display the various locations. 

Challenges

Getting my head around databases and how to manipulate them through active record was a major hurdle. Creating relationships between datasets was something I had to learn and proved a barrier to development on a few occasions. One challenge in particular included having to decipher some string inputs on the users end that would allow the program to make connections between various tables.

Future work.

In an effort to keep the project scope manageable within the given timeframe, I chose not to include image upload and instead required users to input urls of their images. This is something that I would like to include in future projects. In addition to this, currently the project grabbed coordinates for the location map from a location table; I would also like to extract GPS information from the photos and use that to determine the location displayed on the location map. In terms of styling, I would like to use a either a intuitive framework or use styling methods that are efficient and responsive friendly.

Lessons Learned

The main things I learned revolved around using the new technologies of server-side web applications, namely Ruby, Sinatra, SQL databases, and Active Record. However working with these for the past few weeks with increasing levels of depth, I managed to get a reasonable understanding of how they operate and work together for server side web creation. However one thing that I learned solely based on the projet itself was the user experience factor and it's importance in planning and developing a web application. I certainly learned that UX is something that is very important to take into consideration in all stages of development.
