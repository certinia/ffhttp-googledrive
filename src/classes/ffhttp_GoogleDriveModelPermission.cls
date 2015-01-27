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
 * ffhttp_GoogleDriveModelPermission
 *
 * An object that represents the meta data for a permission in Google Drive.
 * https://developers.google.com/drive/v2/reference/permissions#resource
 */
public with sharing class ffhttp_GoogleDriveModelPermission extends ffhttp_GoogleDriveModelAbstractObject
{
	//Permission Roles
	public static final String PERMISSION_ROLE_OWNER = 'owner';
	public static final String PERMISSION_ROLE_READER = 'reader';
	public static final String PERMISSION_ROLE_WRITER = 'writer';
		
	//Permission Additional roles - these must be requested in relation to the roles above.
	public static final String PERMISSION_ROLE_COMMENTER = 'commenter';
		
	//Permission Types
	public static final String PERMISSION_TYPE_USER = 'user';
	public static final String PERMISSION_TYPE_GROUP = 'group';
	public static final String PERMISSION_TYPE_DOMAIN = 'domain';
	public static final String PERMISSION_TYPE_ANYONE = 'anyone';
	
	//Instance variables
	private String etag;				//The ETag of the permission.	
	private String id;					//The ID of the user this permission refers to, and identical to the permissionId in the 
										//About and Files resources. When making a drive.permissions.insert request, exactly one 
										//of the id or value fields must be specified.
	private String selfLink;			//A link back to this permission.
	private String name;				//The name for this permission.	
	private String role;				//The primary role for this user. Allowed values are: owner, reader, writer.
	private String[] additionalRoles; 	//Additional roles for this user. Only commenter is currently allowed.		
	private String type;				//The account type. Allowed values are: user, group, domain & anyone.
	private String authKey;				//The authkey parameter required for this permission.
	private boolean withLink;			//Whether the link is required for this permission.
	private String photoLink; 			//A link to the profile photo, if available.	
	private String value;				//The email address or domain name for the entity. 
										//This is used during inserts and is not populated in responses. 
										//When making a drive.permissions.insert request, exactly one of the id or value
										//fields must be specified.
	private String emailAddress;		//The email address of the user this permission refers to. 
										//This is an output-only field which is present when the permission type is user.
	private String domain;				//The domain name of the entity this permission refers to. 
										//This is an output-only field which is present when the permission type is user, 
										//group or domain.	

	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelPermission()
	{
		super(KIND_DRIVE_PERMISSION);
	}
	
	/**
	 * Get/Sets
	 */
	public String getEtag() 
	{
		return etag;
	}
	public ffhttp_GoogleDriveModelPermission setEtag(String etag)
	{
		this.etag = etag;
		return this;
	}
	public String getId()
	{
		return id;
	}
	public ffhttp_GoogleDriveModelPermission setId(String id)
	{
		this.id = id;
		return this;
	}
	public String getSelfLink()
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelPermission setSelfLink(String selfLink)
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getName()
	{
		return name;
	}
	public ffhttp_GoogleDriveModelPermission setName(String name)
	{
		this.name = name;
		return this;
	}
	public String getRole()
	{
		return role;
	}
	public ffhttp_GoogleDriveModelPermission setRole(String role)
	{
		this.role = role;
		return this;
	}
	public String[] getAdditionalRoles()
	{
		return additionalRoles;
	}
	public ffhttp_GoogleDriveModelPermission setAdditionalRoles(String[] additionalRoles)
	{
		this.additionalRoles = additionalRoles;
		return this;
	}
	public String getType()
	{
		return type;
	}
	public ffhttp_GoogleDriveModelPermission setType(String type)
	{
		this.type = type;
		return this;
	}
	public String getAuthKey()
	{
		return authKey;
	}
	public ffhttp_GoogleDriveModelPermission setAuthKey(String authKey)
	{
		this.authKey = authKey;
		return this;
	}
	public boolean isWithLink()
	{
		return withLink;
	}
	public ffhttp_GoogleDriveModelPermission setWithLink(boolean withLink)
	{
		this.withLink = withLink;
		return this;
	}
	public String getPhotoLink()
	{
		return photoLink;
	}
	public ffhttp_GoogleDriveModelPermission setPhotoLink(String photoLink)
	{
		this.photoLink = photoLink;
		return this;
	}
	public String getValue()
	{
		return value;
	}
	public ffhttp_GoogleDriveModelPermission setValue(String value)
	{
		this.value = value;
		return this;
	}
	public String getEmailAddress()
	{
		return emailAddress;
	}
	public ffhttp_GoogleDriveModelPermission setEmailAddress(String emailAddress)
	{
		this.emailAddress = emailAddress;
		return this;
	}
	public String getDomain()
	{
		return domain;
	}
	public ffhttp_GoogleDriveModelPermission setDomain(String domain)
	{
		this.domain = domain;
		return this;
	} 
    
	/**
	 * Object to represent a list of Google Drive permissions.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleDriveModelPermission> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_PERMISSION_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems()
		{
			return (List<ffhttp_GoogleDriveModelPermission>)items;
		}
	}
}
