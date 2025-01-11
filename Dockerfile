FROM node:22

# working directory
WORKDIR /myapp

# copy all the folder and files in myapp directory
COPY . . 

# Execute the command
RUN npm install

# Run on port -  it is an optional thing
EXPOSE 3000

# from the above command create an image
# now to start/run the application use below command once the image is created
CMD ["npm", "run", "dev"]