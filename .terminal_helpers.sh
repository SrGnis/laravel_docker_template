
# Container Run
#
# Given a service name and a command, run the command in the container, if no command is given it runs bash by default.
cr() {
  # Set service name variable
  SERVICE_NAME=$1

  # Validate service name variable
  if [ -z "$SERVICE_NAME" ]; then
    echo "Usage: cr <service_name> [command]"
    return 1
  fi

  # Set command variable
  COMMAND=${@:2}

  # Get container id
  CONTAINER_ID=$(docker compose ps -q $SERVICE_NAME)

  # Check if container id exists
  if [ -n "$CONTAINER_ID" ]; then
    # Run command in container
    if [ -n "$COMMAND" ]; then
      if [ "$SERVICE_NAME" = "app" ]; then
        docker compose exec -it $SERVICE_NAME sudo -u www-data $COMMAND
      else
        docker compose exec -it $SERVICE_NAME $COMMAND
      fi
    else
      if [ "$SERVICE_NAME" = "app" ]; then
        docker compose exec -it $SERVICE_NAME sudo -u www-data bash
      else
        docker compose exec -it $SERVICE_NAME bash
      if
    fi
  else
    # Show error message if container does not exist
    echo "Container not found for service $SERVICE_NAME"
  fi
}

# Launch Development Composer
#
# Runs docker compose with the development compose file and the given commands as arguments, also sets the DUID environment variable to the current user id.
dcdev() {
  # Run the command
  DUID="$(id -u)" docker compose -f docker-compose-dev.yml ${@:1}
}
