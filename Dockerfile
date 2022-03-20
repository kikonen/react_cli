FROM node:14-alpine

#RUN npm uninstall -g create-react-app
#RUN npm uninstall -g create-react-native-app
#RUN npm uninstall -g create-native-cli
RUN npm cache clean --force

RUN yarn add create-react-app

#RUN npm install -g create-react-app \
#                   create-react-native-app \
#                   react-native-cli

#RUN mkdir /app
WORKDIR /app
#ADD . /app
