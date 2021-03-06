There are two files in this directory:

1. This README file
2. sample-kibana.yml

Because your Elasticsearch certificates are being generated by an external CA (via a Certificate Signing Request), this directory does not
contain a copy of the CA's issuing certificate (we don't know where you will send your CSRs and who will sign them).

If you are using a public (commercial) CA then it is likely that Kibana will already be configured to trust this CA and you will not need
to do any special configuration.

However, if you are using a CA that is specific to your organisation, then you will need to configure Kibana to trust that CA.
When your CA issues your certificate, you should ask them for a copy of their certificate chain in PEM format.

The "sample-kibana.yml" file, and the instructions below, explain what to do this with this file.

## sample-kibana.yml

This is a sample configuration for Kibana to enable SSL for connections to Elasticsearch.
You can use this sample to update the "kibana.yml" configuration file in your Kibana config directory.

-------------------------------------------------------------------------------------------------
NOTE:
 You also need to update the URLs in your "elasticsearch.hosts" setting to use the "https" URL.
 e.g. If your kibana.yml file currently has

    elasticsearch.hosts: [ "http://localhost:9200" ]

  then you should change this to:

    elasticsearch.hosts: [ "https://localhost:9200" ]

-------------------------------------------------------------------------------------------------

The sample configuration assumes that you have a file named "elasticsearch-ca.pem" which contains your CA's certificate
chain, and have copied that file into the Kibana config directory.


