FROM nginx:alpine

# Install dependencies
RUN apk add --no-cache gcc musl-dev linux-headers luajit luajit-dev

# Install the Lua module
RUN apk add --no-cache nginx-mod-http-lua

# Load the Lua module in Nginx configuration
RUN echo "load_module modules/ngx_http_lua_module.so;" > /etc/nginx/modules/lua.conf

# Include modules in the main Nginx configuration
RUN sed -i '1iinclude /etc/nginx/modules/*.conf;' /etc/nginx/nginx.conf
