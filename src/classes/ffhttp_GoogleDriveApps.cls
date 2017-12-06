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
 * ffhttp_GoogleDriveApps
 *
 * Class to encapsulate all the Google Drive Apps API calls.
 * https://developers.google.com/drive/v2/reference/#Apps
 */
public with sharing class ffhttp_GoogleDriveApps extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveApps(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Gets a specific app.
     *
     * Create a request for the method "apps.get".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param appId The ID of the app.
     * @return the request
     */
	public GetRequest getRequest(String appId)
	{
		return new GetRequest(this, appId);
	}
	
	/**
     * Lists a user's installed apps.
     *
     * Create a request for the method "apps.list".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @return the request
     */
	public ListRequest listRequest()
	{
		return new ListRequest(this);
	}
		
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class GetRequest extends GoogleDriveRequest
	{
		GetRequest(ffhttp_GoogleDriveApps apps, String appId)
		{
			super(apps, METADATA_ENDPOINT, ENDPOINT_APPS + appId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelApp.class));
		}
	}
	
	public class ListRequest extends GoogleDriveRequest
	{
		ListRequest(ffhttp_GoogleDriveApps apps)
		{
			super(apps, METADATA_ENDPOINT, ENDPOINT_APPS, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelApp.ItemList.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getAppFilterExtensions()
		{
			return getParam('appFilterExtensions', (String)null);
		}
		public ListRequest setAppFilterExtensions(String appFilterExtensions)
		{
			addParam('appFilterExtensions', appFilterExtensions);
			return this;
		}
		public String getAppFilterMimeTypes()
		{
			return getParam('appFilterMimeTypes', (String)null);
		}
		public ListRequest setAppFilterMimeTypes(String appFilterMimeTypes)
		{
			addParam('appFilterMimeTypes', appFilterMimeTypes);
			return this;
		}
		public String getLanguageCode()
		{
			return getParam('languageCode', (String)null);
		}
		public ListRequest setLanguageCode(String languageCode)
		{
			addParam('languageCode', languageCode);
			return this;
		}
	}
}
