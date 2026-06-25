if status is-interactive
    # Commands to run in interactive sessions can go here
end
fastfetch

# Actualizar todo el sistema
alias actualizar="sudo xbps-install -Su"

# Instalar un programa rápido
alias instalar="sudo xbps-install -y"

# Borrar un programa rápido
alias borrar="sudo xbps-remove -Ry"

# Limpiar basura del sistema
alias limpiar="sudo xbps-remove -Oo"

# Buscar un paquete en los repositorios
alias buscar="xbps-query -Rs"

# Limpiar la pantalla de la terminal
alias c="clear"
