Write a lambda functions with event bridge so we can read 100 csv files from 3000 csv files stored inside se bucket and maintain the file read status and store with csv read json data as response.

Here is an example of a Lambda function written in Node.js that uses EventBridge to read 100 CSV files from an S3 bucket, maintain the file read status, and store the CSV read JSON data as a response:

```
const AWS = require('aws-sdk');
const s3 = new AWS.S3({ region: 'your-region' });
const eventBridge = new AWS.EventBridge({ region: 'your-region' });

exports.handler = async (event) => {
  const bucketName = 'your-bucket-name';
  const prefix = 'your-prefix/';
  const maxFilesToRead = 100;
  const filesRead = [];

  // Get the list of CSV files from S3
  const s3Params = {
    Bucket: bucketName,
    Prefix: prefix,
  };
  const s3Data = await s3.listObjectsV2(s3Params).promise();
  const csvFiles = s3Data.Contents.filter((file) => file.Key.endsWith('.csv'));

  // Read the first 100 CSV files
  for (let i = 0; i < maxFilesToRead && i < csvFiles.length; i++) {
    const file = csvFiles[i];
    const fileKey = file.Key;
    const fileStatus = await getFileStatus(fileKey);
    if (fileStatus === 'NOT_READ') {
      const csvData = await readCSVFile(fileKey);
      await updateFileStatus(fileKey, 'READ');
      filesRead.push({ fileKey, csvData });
    }
  }

  // Send the response to EventBridge
  const eventBridgeEvent = {
    Source: 'your-event-source',
    DetailType: 'your-event-detail-type',
    Detail: JSON.stringify(filesRead),
  };
  await eventBridge.putEvents({ Entries: [eventBridgeEvent] }).promise();

  return {
    statusCode: 200,
    body: JSON.stringify(filesRead),
  };
};

// Helper function to get the file status
async function getFileStatus(fileKey) {
  const dynamoDb = new AWS.DynamoDB({ region: 'your-region' });
  const params = {
    TableName: 'your-table-name',
    Key: { fileKey: { S: fileKey } },
  };
  const data = await dynamoDb.getItem(params).promise();
  return data.Item ? data.Item.status.S : 'NOT_READ';
}

// Helper function to read a CSV file
async function readCSVFile(fileKey) {
  const s3Params = {
    Bucket: 'your-bucket-name',
    Key: fileKey,
  };
  const csvData = await s3.getObject(s3Params).promise();
  return csvData.Body.toString('utf-8');
}

// Helper function to update the file status
async function updateFileStatus(fileKey, status) {
  const dynamoDb = new AWS.DynamoDB({ region: 'your-region' });
  const params = {
    TableName: 'your-table-name',
    Key: { fileKey: { S: fileKey } },
    UpdateExpression: 'set #status = :status',
    ExpressionAttributeNames: { '#status': 'status' },
    ExpressionAttributeValues: { ':status': { S: status } },
  };
  await dynamoDb.updateItem(params).promise();
}
```

This Lambda function uses the following services:

- Amazon S3 to store the CSV files
- Amazon DynamoDB to store the file status
- Amazon EventBridge to send the response

The function reads the first 100 CSV files from the S3 bucket, updates the file status in DynamoDB, and sends the response to EventBridge.