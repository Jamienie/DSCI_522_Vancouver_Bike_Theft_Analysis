# Docker file for vancouver_bike_report
# Fan Nie and Makkaoui, Nov 2018

# use rocker/tidyverse as the base image and
FROM rocker/tidyverse

# install the here package
RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  && install2.r --error \
    --deps TRUE \
    here
