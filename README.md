# Magmi-Docker

Magmi is an attempt to provide a product importer for magento that can handle several thousands of products at a reasonable pace compared to magento dataflow. it may evolve to a dataflow alternative as new features are implemented.

## Usage

docker run -itd -p 80:80 fastwhitecat/magmi:latest

Application will be available on address "http://localhost/"

First login with credentials (login/pass)magmi/magmi. After the first login you have to configure connection to Magento. To next login you have use credentials from Magento users.

## Compatibility

Magmi is compatible with Magento 1.8/1.9
