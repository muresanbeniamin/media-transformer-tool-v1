# API Endpoints
## User
Role: The application requires a logged in user in order to have access to 
- POST   **/api/v1/users/signin(.:format)**                       
- POST   **/api/v1/users/signup(.:format)**                                                           
- POST   **/api/v1/users/recover_password(.:format)**

## Media History
Role: Store the transformed media file url so that the user that performed that action has access to that file all the time
- GET    **/api/v1/media_histories(.:format)**  
- POST   **/api/v1/media_histories(.:format)**                                                       

## Text to speech
Role: Transform some given text to an mp3 file and upload the output file to cloud for later uses
- POST   **/api/v1/text_to_speech(.:format)**                                                         
