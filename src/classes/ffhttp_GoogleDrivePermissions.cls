/**
 * Copyright (c) 2014, FinancialForce.com, inc
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without modification, 
 *   are permitted provided that the following conditions are met:
 *
 * - Redistributions of source code must retain the above copyright notice, 
 *      this list of conditions and the following disclaimer.
 * - Redistributions in binary form must reproduce the above copyright notice, 
 *      this list of conditions and the following disclaimer in the documentation 
 *      and/or other materials provided with the distribution.
 * - Neither the name of the FinancialForce.com, inc nor the names of its contributors 
 *      may be used to endorse or promote products derived from this software without 
 *      specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND 
 *  ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES 
 *  OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL 
 *  THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, 
 *  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 *  OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY
 *  OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
 *  ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
**/

/**
 * ffhttp_GoogleDrivePermissions
 *
 * Class to encapsulate all the Google Drive Permission API calls.
 * https://developers.google.com/drive/v2/reference/#Permissions
 */
public with sharing class ffhttp_GoogleDrivePermissions extends ffhttp_GoogleDriveResource
{	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Permissions API calls.
	 */
	public ffhttp_GoogleDrivePermissions(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the permissions.
	 * @return Access to the Permissions API calls.
	 */
	public ffhttp_GoogleDrivePermissions(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		super(service, file);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes a permission from the file referenced in the constructor.
     *
     * Create a request for the method "permissions.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param permissionId The ID for the permission.
     * @return the request
     */
	public DeleteRequest deleteRequest(String permissionId)
	{
		validateFile();
		return new DeleteRequest(this, permissionId);
	}
	
	/**
     * Gets a permission by ID for the file referenced in the constructor.
     *
     * Create a request for the method "permissions.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param permissionId The ID for the permission.
     * @return the request
     */
	public GetRequest getRequest(String permissionId)
	{
		validateFile();
		return new GetRequest(this, permissionId);
	}
	
	/**
     * Inserts a permission for the file referenced in the constuctor.
     *
     * Create a request for the method "permissions.insert".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the {@link ffhttp_GoogleDriveModelPermission}
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelPermission content) 
	{ 
		validateFile();	
		return new InsertRequest(this, content);
	}

 	/**
     * Lists the permissions for the file referenced in the constructor.
     *
     * Create a request for the method "permissions.list".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @return the request
     */
	public ListRequest listRequest()
	{
		validateFile();
		return new ListRequest(this);
	}
	
	/**
     * Updates a permission.
     *
     * Create a request for the method "permissions.update".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the {@link ffhttp_GoogleDriveModelPermission}
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelPermission content)
	{
		validateFile();
		return new UpdateRequest(this, content);
	}
	
	/**
     * Returns the permission ID for an email address.
     *
     * Create a request for the method "permissions.getIdForEmail".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param email The email address for which to return a permission ID.
     * @return the request
     */
	public GetIdForEmailRequest getIdForEmailRequest(String email)
	{
		return new GetIdForEmailRequest(this, email);
	}
	
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	 
	public class DeleteRequest extends GoogleDriveFileRequest
	{
		DeleteRequest(ffhttp_GoogleDrivePermissions permissions, String permissionId)
		{
			super(permissions, ENDPOINT_PERMISSIONS + permissionId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest 
	{
		GetRequest(ffhttp_GoogleDrivePermissions permissions, String permissionId)
		{
			super(permissions, ENDPOINT_PERMISSIONS + permissionId, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelPermission.class));
		}
	}
	 
	public class InsertRequest extends GoogleDriveFileRequest
	{	
		InsertRequest(ffhttp_GoogleDrivePermissions permissions, ffhttp_IHttpContent content) 
		{
			super(permissions, ENDPOINT_PERMISSIONS, REQUEST_METHOD_POST, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelPermission.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getEmailMessage()
		{
			return getParam('emailMessage', (String)null);
		}
		public InsertRequest setEmailMessage(String emailMessage)
		{
			addParam('emailMessage', emailMessage);
			return this;
		}
		public Boolean getSendNotificationEmails()
		{
			return getParam('sendNotificationEmails', true);
		}
		public InsertRequest setSendNotificationEmails(Boolean sendNotificationEmails)
		{
			addParam('sendNotificationEmails', sendNotificationEmails);
			return this;
		}
	}

	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDrivePermissions permissions)
		{
			super(permissions, ENDPOINT_PERMISSIONS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelPermission.ItemList.class));
		}
	}
	
	public class UpdateRequest extends GoogleDriveFileRequest
	{
		UpdateRequest(ffhttp_GoogleDrivePermissions permissions, ffhttp_IHttpContent content) 
		{
			super(permissions, ENDPOINT_PERMISSIONS, REQUEST_METHOD_PUT, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelPermission.class));
		}
		
		/**
		 * Request parameters
		 */
		public Boolean getTransferOwnership()
		{
			return getParam('transferOwnership', false);
		}
		public UpdateRequest setTransferOwnership(Boolean transferOwnership)
		{
			addParam('transferOwnership', transferOwnership);
			return this;
		}
	}
	
	public class GetIdForEmailRequest extends GoogleDriveRequest
	{
		GetIdForEmailRequest(ffhttp_GoogleDrivePermissions permissions, String email) 
		{
			super(permissions, METADATA_ENDPOINT, ENDPOINT_PERMISSIONIDS + EncodingUtil.urlEncode(email, 'UTF-8'), REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelPermissionId.class));
		}
	}
}
