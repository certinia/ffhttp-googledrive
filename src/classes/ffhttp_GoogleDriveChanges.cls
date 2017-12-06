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
 * ffhttp_GoogleDriveChanges
 *
 * Class to encapsulate all the Google Drive Changes API calls.
 * https://developers.google.com/drive/v2/reference/#Changes
 */
public with sharing class ffhttp_GoogleDriveChanges extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Changes API calls.
	 */
	public ffhttp_GoogleDriveChanges(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Gets a specific change.
     *
     * Create a request for the method "changes.get".
     *
     * @param changeId The ID of the change.
     * @return the request
     */
	public GetRequest getRequest(String id)
	{
		return new GetRequest(this, id);
	}
	
	/**
     * Lists the changes for a user.
     *
     * Create a request for the method "changes.list".
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}
	
	/**
     * Subscribe to changes for a user.
     *
     * Create a request for the method "changes.watch".
     *
     * @param content the {@link ffhttp_GoogleDriveModelWatch}
     * @return the request
     */
	public WatchRequest watchRequest(ffhttp_GoogleDriveModelWatch watchParam)
	{
		return new WatchRequest(this, watchParam);
	}
		
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class GetRequest extends GoogleDriveRequest
	{
		GetRequest(ffhttp_GoogleDriveChanges changes, String changeId)
		{
			super(changes, METADATA_ENDPOINT, ENDPOINT_CHANGES + changeId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelChange.class));
		}
	}
	
	public class ListRequest extends GoogleDriveRequest
	{
		ListRequest(ffhttp_GoogleDriveChanges changes)
		{
			super(changes, METADATA_ENDPOINT, ENDPOINT_CHANGES, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelChange.ItemList.class));
		}
		
		/**
		 * Request Parameters
		 */
		public Boolean getIncludeDeleted()
		{
			return getParam('includeDeleted', true);
		}
		public ListRequest setIncludeDeleted(Boolean includeDeleted)
		{
			addParam('includeDeleted', includeDeleted);
			return this;
		}
		public Boolean getIncludeSubscribed()
		{
			return getParam('includeSubscribed', true);
		}
		public ListRequest setIncludeSubscribed(Boolean includeSubscribed)
		{
			addParam('includeSubscribed', includeSubscribed);
			return this;
		}
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
			return getParam('pageToken', (String)null);
		}
		public ListRequest setPageToken(String pageToken)
		{
			addParam('pageToken', pageToken);
			return this;
		}
		public Long getStartChangeId()
		{
			return getParam('startChangeId', (Long)null);
		}
		public ListRequest setStartChangeId(Long startChangeId)
		{
			addParam('startChangeId', startChangeId);
			return this;
		}
	}
	
	public class WatchRequest extends GoogleDriveRequest
	{
		WatchRequest(ffhttp_GoogleDriveChanges changes, ffhttp_GoogleDriveModelWatch content)
		{
			super(changes, METADATA_ENDPOINT, ENDPOINT_CHANGES + COMMAND_WATCH, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelApiChannel.class));
		}
	}
}
