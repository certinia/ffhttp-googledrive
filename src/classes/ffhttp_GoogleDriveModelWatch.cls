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
 * ffhttp_GoogleDriveModelWatch
 *
 * An object that represents the meta data for a watch request to Google Drive.
 * https://developers.google.com/drive/v2/reference/changes/watch#request
 */
 public with sharing class ffhttp_GoogleDriveModelWatch extends ffhttp_AbstractJsonSerializable
 {
 	//Instance variables
	private String id;			//A UUID or similar unique string that identifies this channel.	
	private String token;		//An arbitrary string delivered to the target address with each notification 
								//delivered over this channel. Optional.				
	private Long expiration;	//Date and time of notification channel expiration, expressed as a Unix timestamp, 
								//in milliseconds. Optional.	
	private String type;		//The type of delivery mechanism used for this channel. The only option is web_hook.
	private String address;		//The address where notifications are delivered for this channel.
	
	/**
	 * Get/Sets
	 */
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelWatch setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getToken() 
	{
		return token;
	}
	public ffhttp_GoogleDriveModelWatch setToken(String token) 
	{
		this.token = token;
		return this;
	}
	public Long getExpiration() 
	{
		return expiration;
	}
	public ffhttp_GoogleDriveModelWatch setExpiration(Long expiration) 
	{
		this.expiration = expiration;
		return this;
	}
	public String getType() 
	{
		return type;
	}
	public ffhttp_GoogleDriveModelWatch setType(String type) 
	{
		this.type = type;
		return this;
	}
	public String getAddress() 
	{
		return address;
	}
	public ffhttp_GoogleDriveModelWatch setAddress(String address) 
	{
		this.address = address;
		return this;
	}
 }
 