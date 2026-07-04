# 1. 使用极轻量的 Node.js 镜像作为基础环境
FROM node:18-alpine

# 2. 创建容器内的项目工作目录
WORKDIR /app

# 3. 先复制 package.json 并安装项目所需的依赖
COPY package*.json ./
RUN npm install

# 4. 将仓库中的所有项目代码复制进容器内
COPY . .

# 5. 暴露 Hugging Face 规范的默认端口 (7860)
EXPOSE 7860
ENV PORT=7860

# 6. 运行项目的入口启动脚本
CMD ["node", "src/server.mjs"]
