function love.load()
    star = {x = 400, y = 300, radius = 50}

    planets = {
        {radius = 20, angle = 0, distance = 100, speed = 1.5, color = {0, 0, 1}},
        {radius = 15, angle = math.pi / 3, distance = 150, speed = 1, color = {0, 1, 0}},
        {radius = 25, angle = math.pi / 2, distance = 200, speed = 0.8, color = {1, 0, 0}},
        {radius = 10, angle = math.pi, distance = 250, speed = 0.5, color = {1, 1, 0}}
    }

    stars = {}
    for i = 1, 100 do
        table.insert(stars, {x = love.math.random(800), y = love.math.random(600), size = love.math.random(1, 3)})
    end
end

function love.update(dt)
    for _, planet in ipairs(planets) do
        planet.angle = planet.angle + planet.speed * dt
        planet.x = star.x + math.cos(planet.angle) * planet.distance
        planet.y = star.y + math.sin(planet.angle) * planet.distance
    end
end

function love.draw()
    love.graphics.setColor(1, 1, 1)
    for _, star in ipairs(stars) do
        love.graphics.circle("fill", star.x, star.y, star.size)
    end

    love.graphics.setColor(1, 1, 0)
    love.graphics.circle("fill", star.x, star.y, star.radius)

    for _, planet in ipairs(planets) do
        love.graphics.setColor(planet.color)
        love.graphics.circle("fill", planet.x, planet.y, planet.radius)
    end
end
