# Start from the Python 3 base image
FROM python:3

# Install the necessary packages
RUN pip install mkdocs-material \
    mkdocs-macros-plugin \
    mkdocs-encryptcontent-plugin \
    mkdocs-awesome-pages-plugin \
    mkdocs-git-revision-date-plugin \
    mkdocs-awesome-pages-plugin \
    pygments \
    pymdown-extensions

# Set the working directory in the container
WORKDIR /github/workspace

# Copy the local content into the container
COPY . /github/workspace

# Command to run on container start
CMD [ "mkdocs", "serve", "-a", "0.0.0.0:8000" ]