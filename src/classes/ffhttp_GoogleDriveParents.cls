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
 * ffhttp_GoogleDriveParents
 *
 * Class to encapsulate all the Google Drive Parent API calls.
 * https://developers.google.com/drive/v2/reference/#Parents
 */
public with sharing class ffhttp_GoogleDriveParents extends ffhttp_GoogleDriveResource
{	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveParents(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the parents.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveParents(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		super(service, file);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Removes a parent from the file referenced in the constructor.
     *
     * Create a request for the method "parents.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param parentId The ID of the parent.
     * @return the request
     */
	public DeleteRequest deleteRequest(String parentId) 
	{
		validateFile();
		return new DeleteRequest(this, parentId);
	}
	
	/**
     * Gets a specific parent reference for the file referenced in the constructor.
     *
     * Create a request for the method "parents.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param parentId The ID of the parent.
     * @return the request
     */
	public GetRequest getRequest(String parentId)
	{
		validateFile();
		return new GetRequest(this, parentId);
	}
	 
	/**
     * Adds a parent folder to the file referenced in the constructor.
     *
     * Create a request for the method "parents.insert".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the {@link ffhttp_GoogleDriveModelParent}
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelParent content) 
	{ 
		validateFile();
		return new InsertRequest(this, content);
	}
	
	/**
     * Lists the file's parents.
     *
     * Create a request for the method "parents.list".
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

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleDriveFileRequest
	{
		DeleteRequest(ffhttp_GoogleDriveParents parents, String parentId) 
		{
			super(parents, ENDPOINT_PARENTS + parentId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest
	{
		GetRequest(ffhttp_GoogleDriveParents parents, String parentId) 
		{
			super(parents, ENDPOINT_PARENTS + parentId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelParent.class));
		}
	}
	
	public class InsertRequest extends GoogleDriveFileRequest
	{
		InsertRequest(ffhttp_GoogleDriveParents parents, ffhttp_IHttpContent content) 
		{
			super(parents, ENDPOINT_PARENTS, REQUEST_METHOD_POST, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelParent.class));
		}
	}
	
	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDriveParents parents)
		{
			super(parents, ENDPOINT_PARENTS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelParent.ItemList.class));
		}
	}
}
