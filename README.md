In developing the front end, I aimed for simplicity in the back end to streamline the process. I didn't spend much time on routing or data modeling, and some attributes are hard-coded to enhance the visual design.

### Key Points

I implemented client-side filtering of locations by sending longitude and latitude coordinates, and then calculating the distance from the client to the specified coordinates on the client side. However, a more robust approach might be to handle these computations server-side. This would add some complexity, but should result in a more fluid front end experience.

### Execution

The setup is straightforward and doesn't require any special environment. Running the commands bin/rails db:migrate db:seed will populate the database with example data. To run the application locally, execute ./bin/dev.
