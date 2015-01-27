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
 * ffhttp_GoogleDriveChildren
 *
 * Class to encapsulate all the Google Drive Children API calls.
 * https://developers.google.com/drive/v2/reference/#Children
 */
public with sharing class ffhttp_GoogleDriveChildren extends ffhttp_GoogleDriveResource
{
	/**
     * Constructor
     *
     * @param service The Google Drive service object.
     * @return the request
     */
	public ffhttp_GoogleDriveChildren(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
     * Constructor
     *
     * @param service The Google Drive service object.
     * @param folder The folder for which the children are required.
     * @return the request
     */
	public ffhttp_GoogleDriveChildren(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile folder) 
	{
		super(service, folder);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Removes a child from the given folder referenced in the constructor.
     *
     * Create a request for the method "children.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param childId The ID of the child.
     * @return the request
     */
	public DeleteRequest deleteRequest(String childId) 
	{
		validateFile();
		return new DeleteRequest(this, childId);
	}
	
	/**
     * Gets a specific child reference for the folder referenced in the constructor.
     *
     * Create a request for the method "children.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param childId The ID of the child.
     * @return the request
     */
	public GetRequest getRequest(String childId)
	{
		validateFile();
		return new GetRequest(this, childId);
	}
	
	/**
     * Inserts a file into the folder referenced in the constructor.
     *
     * Create a request for the method "children.insert".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the ffhttp_GoogleDriveModelChild
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelChild content) 
	{ 
		validateFile();
		return new InsertRequest(this, content);
	}
	
	/**
     * Lists the children for the folder referenced in the constructor.
     *
     * Create a request for the method "children.list".
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
		DeleteRequest(ffhttp_GoogleDriveChildren children, String childId) 
		{
			super(children, ENDPOINT_CHILDREN + childId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest
	{
		GetRequest(ffhttp_GoogleDriveChildren children, String childId) 
		{
			super(children, ENDPOINT_CHILDREN + childId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelChild.class));
		}
	}
	
	public class InsertRequest extends GoogleDriveFileRequest
	{
		InsertRequest(ffhttp_GoogleDriveChildren children, ffhttp_GoogleDriveModelChild content) 
		{
			super(children, ENDPOINT_CHILDREN, REQUEST_METHOD_POST, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelChild.class));
		}
	}
	
	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDriveChildren children)
		{
			super(children, ENDPOINT_CHILDREN, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelChild.ItemList.class));
		}
		
		/**
		 * Request Parameters
		 */
		public Integer getMaxResults()
		{
			return getParam('maxResults', 100);
		}
		public ListRequest setMaxResults(Integer maxResults)
		{	
			addParam('maxResults', maxResults);
			return this;
		}
		public String getPageToken()
		{	
			return getParam('pageToken');
		}
		public ListRequest setPageToken(String pageToken)
		{
			addParam('pageToken', pageToken);
			return this;
		}
		public String getQ()
		{
			return getParam('q');
		}
		public ListRequest setQ(String q)
		{
			addParam('q', q);
			return this;
		}
	}
}
