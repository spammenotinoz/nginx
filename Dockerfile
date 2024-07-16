FROM nginx:alpine

# Install dependencies and Lua module
RUN apk add --no-cache nginx-mod-http-lua luajit

# Load the Lua module in Nginx configuration
RUN echo "load_module modules/ngx_http_lua_module.so;" > /etc/nginx/modules/lua.conf

# Include modules in the main Nginx configuration
RUN sed -i '1iinclude /etc/nginx/modules/*.conf;' /etc/nginx/nginx.conf
