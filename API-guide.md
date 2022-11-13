# REST API Guide for Assignment 1
In order to run the program three containers must be running. The Hadoop services are executed on port 8081 and the Spark services are executed on port 8082. Please use Postman for a smooth experience. In order to call these services the requests are sent to http://localhost:8080/

A. Hadoop Services
1. Build index Service:
The request is sent as <http://localhost:8080/build/> with the following json body:
    ```json
    {
        "Service":"Hadoop"
    }
    ```
2. Search a Word
The request is sent as <http://localhost:8080/search_word/{wordToBeSearched}> with the following json request body:
    ```json
    {
        "Service":"Hadoop"
    }
    ```
3. Search a Phrase
The request is sent as <http://localhost:8080/search_phrase/> with the following json request body:
    ```json
    {
        "Service":"Hadoop",
        "Type": "and",
        "Args":["from","that"]
    }
    ```
4. Positivity Rank of Files
The request is sent as <http://localhost:8080/positive_check/>.with the following json request body:
    ```json
    {
        "Service":"Hadoop",
    }
    ```

B. Spark Services 
1. Build index Service:
The request is sent as <http://localhost:8080/build/> with the following json body:
    ```json
    {
        "Service":"Spark"
    }
    ```
2. Search a Word
The request is sent as <http://localhost:8080/search_word/{wordToBeSearched}> with the following json request body:
    ```json
    {
        "Service":"Spark"
    }
    ```
3. Search a Phrase
The request is sent as <http://localhost:8080/search_phrase/> with the following json request body:
    ```json
    {
        "Service":"Spark",
        "Type": "and",
        "Args":["from","that"]
    }
    ```
4. Positivity Rank of Files
The request is sent as <http://localhost:8080/positive_check/>.with the following json request body:
    ```json
    {
        "Service":"Spark"
    }
    ```
