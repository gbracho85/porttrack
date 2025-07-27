# Description:
#   Informa el estado de despliegue de PortTrack según la rama

module.exports = (robot) ->
  robot.respond /estado de despliegue/i, (res) ->
    branch = process.env.GITHUB_REF or 'main'

    if branch.includes('main')
      res.send "🚢 *Despliegue en Producción* está activo y monitoreado. Puedes consultar métricas en Grafana."
    else if branch.includes('develop')
      res.send "🔧 *Despliegue en Staging* activo. Entorno de pruebas con métricas habilitadas."
    else
      res.send "📦 Rama no reconocida para despliegue automático. ¿Estás en una feature branch?"

  robot.respond /último despliegue/i, (res) ->
    # Este mensaje puede integrarse con GitHub API o AWS para obtener detalles reales
    res.send "🕒 El último despliegue fue realizado automáticamente vía GitHub Actions. Puedes revisar detalles en: https://github.com/tu_usuario/porttrack/actions"

  robot.respond /ayuda despliegue/i, (res) ->
    res.send """
    🤖 *Comandos disponibles*:
    - `@hubot estado de despliegue`: Estado actual del entorno
    - `@hubot último despliegue`: Último despliegue ejecutado
    - `@hubot ayuda despliegue`: Ver esta ayuda
    """
