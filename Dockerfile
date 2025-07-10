# 使用官方Node.js镜像作为基础镜像
FROM node:20-alpine

# 设置工作目录
WORKDIR /app

# 复制package.json和pnpm-lock.yaml(或package-lock.json)
COPY package*.json ./

# 安装pnpm(如果使用)和项目依赖
RUN npm install --foreground-scripts

# 复制项目文件
COPY . .

# 构建项目
RUN npm run build

# 暴露端口(根据您的server.js中使用的端口)
EXPOSE 3000

# 启动命令
CMD ["npm", "run", "deploy"]