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
 * ffhttp_GoogleDriveModelApiChannel
 *
 * An object that represents the meta data for a api channel in Google Drive.
 * https://developers.google.com/drive/v2/reference/changes/watch#response
 */
public with sharing class ffhttp_GoogleDriveModelApiChannel extends ffhttp_GoogleDriveModelAbstractObject
{
	//Instance variables
	private String id;			//A UUID or similar unique string that identifies this channel.
 	private String resourceId;	//An opaque ID that identifies the resource being watched on this channel. 
 								//Stable across different API versions.	
 	private String resourceUri;	//A version-specific identifier for the watched resource.
 	private String token;		//An arbitrary string delivered to the target address with each notification	
 								//delivered over this channel. Optional.	
	private long expiration;	//Date and time of notification channel expiration, expressed as a Unix timestamp, 
								//in milliseconds. Optional.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelApiChannel()
	{
		super(KIND_API_CHANNEL);
	}
	
	/**
	 * Get/Sets
	 */
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelApiChannel setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getResourceId() 
	{
		return resourceId;
	}
	public ffhttp_GoogleDriveModelApiChannel setResourceId(String resourceId) 
	{
		this.resourceId = resourceId;
		return this;
	}
	public String getResourceUri() 
	{
		return resourceUri;
	}
	public ffhttp_GoogleDriveModelApiChannel setResourceUri(String resourceUri) 
	{
		this.resourceUri = resourceUri;
		return this;
	}
	public String getToken() 
	{
		return token;
	}
	public ffhttp_GoogleDriveModelApiChannel setToken(String token) 
	{
		this.token = token;
		return this;
	}
	public long getExpiration() 
	{
		return expiration;
	}
	public ffhttp_GoogleDriveModelApiChannel setExpiration(long expiration) 
	{
		this.expiration = expiration;
		return this;
	}
}
