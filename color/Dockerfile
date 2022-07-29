# quay.io/codefresh_sa/color-service
# docker build -t quay.io/codefresh_sa/color:hat .
# docker build -t quay.io/codefresh_sa/color:scarf . --build-arg IMAGE_ARG=img_scarf.jpeg

FROM nginx:1.22-alpine

LABEL cf_account="cf-demo1"

# Notes: color/ is the path used for this app's K8s ingress URL rewrite.
#        Remove color/ when testing this image locally or running without URL rewriting.
ARG IMAGE_ARG=color/green.png

COPY 05-interpolation.sh /docker-entrypoint.d/
COPY index.html /usr/share/nginx/html/
COPY green.png /usr/share/nginx/html/
COPY red.png /usr/share/nginx/html/
COPY blue.png /usr/share/nginx/html/

ENV IMAGE=$IMAGE_ARG
ENV COLOR1 orange


