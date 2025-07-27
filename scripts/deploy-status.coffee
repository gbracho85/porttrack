module.exports = (robot) ->
  robot.respond /estado del despliegue/i, (res) ->
    res.send "El último despliegue fue exitoso ✅ en entorno PRD a las 15:43 UTC."