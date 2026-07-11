FROM node:20

# Habilitar Corepack para Yarn (versión fija, compatible con yarn.lock)
RUN corepack enable && corepack prepare yarn@1.22.22 --activate

WORKDIR /usr/src/app

# Copiar archivos de configuración
COPY package.json yarn.lock ./

# Instalar dependencias con Yarn (esto creará node_modules)
RUN yarn install --frozen-lockfile

# Copiar el resto del proyecto
COPY . .

EXPOSE 3000

CMD ["yarn", "start"]
