In the project you can find 2 logic apps with ARM templates for both.

1. Fist logic app doesn't contain any references to the schemas or maps, the transformation is done by using xpath and few build in expressions. 
You can pass different collection with different node names and the result will be same ( last element of the collection will be returned from as JSON object )
The structure of the input schema should be as following ( root and object name can be repaces with any other values )

```
<root>
  <object>
    ... list of properties
  </object>
  <object>
    ... list of properties
  </object>
  <object>
    ... list of properties
  </object>
</root>
```

2. Second logic app contains the reference to the Integration account, where XSD and XSLT files are stored.
Those files are used for schema validation ( XSD ) and transformation the collection to the last object of this list ( XSLT )
The schema file is included to the project in the schemas directory.
Sample file you can find below
```
<Orders>
  <Order>
    <Name>string</Name>
    <Price>-4490</Price>
    <Count>4395</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>1070</Price>
    <Count>-1561</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>-1374</Price>
    <Count>1153</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>2620</Price>
    <Count>2038</Count>
  </Order>
</Orders>
```
The result of those logic apps is different because in the task there was no specification about the structure of the output object

First logic app returns all porperties for last element of the collection without root node. 
Example:

Input: 
```
<Orders>
  <Order>
    <Name>string</Name>
    <Price>-4490</Price>
    <Count>4395</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>1070</Price>
    <Count>-1561</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>-1374</Price>
    <Count>1153</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>2620</Price>
    <Count>2038</Count>
  </Order>
</Orders>
```
Output:

{
    "Name": "string",
    "Price": "2620",
    "Count": "2038"
}

Second logic app returnes the object that is transformed from xslt output
Example: 

Input: 
```
<Orders>
  <Order>
    <Name>string</Name>
    <Price>-4490</Price>
    <Count>4395</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>1070</Price>
    <Count>-1561</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>-1374</Price>
    <Count>1153</Count>
  </Order>
  <Order>
    <Name>string</Name>
    <Price>2620</Price>
    <Count>2038</Count>
  </Order>
</Orders>
```
XSLT Transform output:
```
<Order>
    <Name>string</Name>
    <Price>2620</Price>
    <Count>2038</Count>
 </Order>
```
Output:

{
    "Order": {
        "Name": "string",
        "Price": "2620",
        "Count": "2038"
    }
}
