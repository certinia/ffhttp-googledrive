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
 * ffhttp_GoogleDriveModelUser
 *
 * An object that represents the meta data for a user of Google Drive.
 */
public with sharing class ffhttp_GoogleDriveModelUser extends ffhttp_GoogleDriveModelAbstractObject
{
	//Instance variables
    private String displayName;				//A plain text displayable name for this user.
    private Boolean isAuthenticatedUser;	//Whether this user is the same as the authenticated user for whom the request was made.	
    private String permissionId;			//The user's ID as visible in the permissions collection.	    
    private String emailAddress;			//The email address of the user.
	private Picture picture;				//A URL that points to a profile picture of this user.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelUser()
	{
		super(KIND_DRIVE_USER);
	}
	
	/**
	 * Get methods
	 */
	public String getDisplayName() 
	{
		return displayName;
	}
	public ffhttp_GoogleDriveModelUser setDisplayName(String displayName) 
	{
		this.displayName = displayName;
		return this;
	}
	public Boolean getIsAuthenticatedUser() 
	{
		return isAuthenticatedUser;
	}
	public ffhttp_GoogleDriveModelUser setIsAuthenticatedUser(Boolean isAuthenticatedUser) 
	{
		this.isAuthenticatedUser = isAuthenticatedUser;
		return this;
	}
	public String getPermissionId() 
	{
		return permissionId;
	}
	public ffhttp_GoogleDriveModelUser setPermissionId(String permissionId) 
	{
		this.permissionId = permissionId;
		return this;
	}
	public String getEmailAddress() 
	{
		return emailAddress;
	}
	public ffhttp_GoogleDriveModelUser setEmailAddress(String emailAddress) 
	{
		this.emailAddress = emailAddress;
		return this;
	}
	public Picture getPicture() 
	{
		return picture;
	}
	public ffhttp_GoogleDriveModelUser setPicture(Picture picture) 
	{
		this.picture = picture;
		return this;
	}
	
	/**
	 * Inner classes
	 */
	public class Picture extends ffhttp_AbstractJsonSerializable
	{
		public String url; 					//A URL that points to a profile picture of this user.
		
		public String getUrl() 
		{
			return url;
		}
		public Picture setUrl(String url) 
		{
			this.url = url;
			return this;
		}
	}
}
