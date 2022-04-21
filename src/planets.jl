
# Define an immutable structure for holding information about the planets.
struct PlanetData
    radius   :: Float64
    mass     :: Float64
    distance :: Float64
    period   :: Float64
end

earth_mass = 5.972E+24  # Mass in kilograms.
earth_distance = 1.496E+11  # Distance from sun in meters.
earth_period = 3600.0 * 24.0 * 365.25  # Period in seconds.

# Open the planets file and read it one line at a time.
planet_data = Dict{String, PlanetData}()
planet_file = open("src/planets.txt")
line_iterator = eachline(planet_file)
for line = line_iterator

    # TODO: Deal with comments a little more gracefully.
    if line[1] != '#'
        fields = split(line)
        if length(fields) != 5
            # TODO: Give the user a bit more help about badly formatted input lines.
            print("Bad line found in file!\n")
        else
            planet_data[fields[1]] =
                PlanetData(
                    float(fields[2]) / 2.0,
                    float(fields[3]) * earth_mass,
                    float(fields[4]) * earth_distance,
                    float(fields[5]) * earth_period)
        end
    end
end
close(planet_file)

# Display the results.
print(planet_data)
