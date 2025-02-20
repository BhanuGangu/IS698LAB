import boto3

s3 = boto3.client('s3')
bucket_name = 'bucketlab3cbhanu'  
file_name = 'myfile.txt'

with open(file_name, 'w') as f:
    f.write("Hello S3")

s3.upload_file(file_name, bucket_name, file_name)
print(f'File {file_name} uploaded successfully!')
