# 01 - Containerizing the App

In this chapter, we will containerize the application by wrapping it in a docker container. 
1. We need to setup the build context. Copy the application code to this folder.
   ```console
   cp -r ../app .
   ```
2. Have a close look at `Dockerfile`. 
3. Let's build the image!
   ```console
   docker build -t romilb/myapp:latest .
   # Change romilb to your dockerhub username if you want to push your image
   ```
4. Run the container! Don't forget to forward port 8000. 
   ```console
   docker run -it --rm -p 8000:8000 romilb/myapp:latest
   # Open http://localhost:8000 in your browser
   ```
5. Push the image to your dockerhub account. 
   ```console
   docker push romilb/myapp:latest
   # Change romilb with your username
   ```

That's it! Now you can access this image from anywhere.
