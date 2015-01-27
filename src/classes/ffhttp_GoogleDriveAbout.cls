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
 * ffhttp_GoogleDriveAbout
 *
 * Class to encapsulate all the Google Drive About API calls.
 * https://developers.google.com/drive/v2/reference/about
 */
public with sharing class ffhttp_GoogleDriveAbout extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the About API calls.
	 */
	public ffhttp_GoogleDriveAbout(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Gets the information about the current user along with Drive API settings.
     *
     * Create a request for the method "about.get".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @return the request
     */
	public GetRequest getRequest()
	{
		return new GetRequest(this);
	}
		
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class GetRequest extends GoogleDriveRequest
	{
		GetRequest(ffhttp_GoogleDriveAbout about)
		{
			super(about, METADATA_ENDPOINT, ENDPOINT_ABOUT, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelAbout.class));
		}
		
		/**
		 * Request Parameters
		 */
		public Boolean getIncludeSubscribed()
		{
			return getParam('includeSubscribed', true);
		}
		public GetRequest setIncludeSubscribed(Boolean includeSubscribed)
		{
			addParam('includeSubscribed', includeSubscribed);
			return this;
		}
		public Long getMaxChangeIdCount()
		{
			return getParam('maxChangeIdCount', 1000);
		}
		public GetRequest setMaxChangeIdCount(Long maxChangeIdCount)
		{	
			addParam('maxChangeIdCount', maxChangeIdCount);
			return this;
		}
		public Long getStartChangeId()
		{
			return getParam('startChangeId', 0);
		}
		public GetRequest setStartChangeId(Long startChangeId)
		{	
			addParam('startChangeId', startChangeId);
			return this;
		}
	}
}
