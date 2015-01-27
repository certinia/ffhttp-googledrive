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
 * ffhttp_GoogleDriveModelRevision
 *
 * An object that represents the meta data for a revision in Google Drive.
 * https://developers.google.com/drive/v2/reference/revisions#resource
 */
public with sharing class ffhttp_GoogleDriveModelRevision extends ffhttp_GoogleDriveModelAbstractObject
{
	//Instance variables
	private String etag;									//The ETag of the revision.
	private String id;										//The ID of the revision.
	private String selfLink;								//A link back to this revision.	
	private String mimeType;								//The MIME type of the revision.	
	private DateTime modifiedDate;							//Last time this revision was modified (formatted RFC 3339 timestamp).
	private Boolean pinned;									//Whether this revision is pinned to prevent automatic purging. 
															//This will only be populated and can only be modified on files 
															//with content stored in Drive which are not Google Docs. 
															//Revisions can also be pinned when they are created through the 
															//drive.files.insert/update/copy by using the pinned query parameter.
	private Boolean published;								//Whether this revision is published. This is only populated and 
															//can only be modified for Google Docs.
	private String publishedLink;							//A link to the published revision.	
	private Boolean publishAuto;							//Whether subsequent revisions will be automatically republished. 
															//This is only populated and can only be modified for Google Docs.
	private Boolean publishedOutsideDomain;					//Whether this revision is published outside the domain. 
															//This is only populated and can only be modified for Google Docs.	
	private String downloadUrl;								//Short term download URL for the file. 
															//This will only be populated on files with content stored in Drive.		
	private String lastModifyingUserName;					//Name of the last user to modify this revision.
	private String originalFilename;						//The original filename when this revision was created. 
															//This will only be populated on files with content stored in Drive.	
	private String md5Checksum;								//An MD5 checksum for the content of this revision. 
															//This will only be populated on files with content stored in Drive.
	private Long fileSize;									//The size of the revision in bytes. 
															//This will only be populated on files with content stored in Drive.
	private Map<String, String> exportLinks; 				//Links for exporting Google Docs to specific formats.		
	private ffhttp_GoogleDriveModelUser lastModifyingUser;	//The last user to modify this revision.
	 
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelRevision()
	{
		super(KIND_DRIVE_REVISION);
	}
	
	/**
	 * Get/Sets
	 */
	public String getEtag() 
	{
		return etag;
	}
	public ffhttp_GoogleDriveModelRevision setEtag(String etag) 
	{
		this.etag = etag;
		return this;
	}
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelRevision setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelRevision setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getMimeType() 
	{
		return mimeType;
	}
	public ffhttp_GoogleDriveModelRevision setMimeType(String mimeType) 
	{
		this.mimeType = mimeType;
		return this;
	}
	public DateTime getModifiedDate() 
	{
		return modifiedDate;
	}
	public ffhttp_GoogleDriveModelRevision setModifiedDate(DateTime modifiedDate) 
	{
		this.modifiedDate = modifiedDate;
		return this;
	}
	public Boolean getPinned() 
	{
		return pinned;
	}
	public ffhttp_GoogleDriveModelRevision setPinned(Boolean pinned) 
	{
		this.pinned = pinned;
		return this;
	}
	public Boolean getPublished() 
	{
		return published;
	}
	public ffhttp_GoogleDriveModelRevision setPublished(Boolean published) 
	{
		this.published = published;
		return this;
	}
	public String getPublishedLink() 
	{
		return publishedLink;
	}
	public ffhttp_GoogleDriveModelRevision setPublishedLink(String publishedLink) 
	{
		this.publishedLink = publishedLink;
		return this;
	}
	public Boolean getPublishAuto() 
	{
		return publishAuto;
	}
	public ffhttp_GoogleDriveModelRevision setPublishAuto(Boolean publishAuto) 
	{
		this.publishAuto = publishAuto;
		return this;
	}
	public Boolean getPublishedOutsideDomain() 
	{
		return publishedOutsideDomain;
	}
	public ffhttp_GoogleDriveModelRevision setPublishedOutsideDomain(Boolean publishedOutsideDomain) 
	{
		this.publishedOutsideDomain = publishedOutsideDomain;
		return this;
	}
	public String getDownloadUrl() 
	{
		return downloadUrl;
	}
	public ffhttp_GoogleDriveModelRevision setDownloadUrl(String downloadUrl) 
	{
		this.downloadUrl = downloadUrl;
		return this;
	}
	public String getLastModifyingUserName() 
	{
		return lastModifyingUserName;
	}
	public ffhttp_GoogleDriveModelRevision setLastModifyingUserName(String lastModifyingUserName) 
	{
		this.lastModifyingUserName = lastModifyingUserName;
		return this;
	}
	public String getOriginalFilename() 
	{
		return originalFilename;
	}
	public ffhttp_GoogleDriveModelRevision setOriginalFilename(String originalFilename) 
	{
		this.originalFilename = originalFilename;
		return this;
	}
	public String getMd5Checksum() 
	{
		return md5Checksum;
	}
	public ffhttp_GoogleDriveModelRevision setMd5Checksum(String md5Checksum) 
	{
		this.md5Checksum = md5Checksum;
		return this;
	}
	public Long getFileSize() 
	{
		return fileSize;
	}
	public ffhttp_GoogleDriveModelRevision setFileSize(Long fileSize) 
	{
		this.fileSize = fileSize;
		return this;
	}
	public Map<String, String> getExportLinks() 
	{
		return exportLinks;
	}
	public ffhttp_GoogleDriveModelRevision setExportLinks(Map<String, String> exportLinks) 
	{
		this.exportLinks = exportLinks;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getLastModifyingUser() 
	{
		return lastModifyingUser;
	}
	public ffhttp_GoogleDriveModelRevision setLastModifyingUser(ffhttp_GoogleDriveModelUser lastModifyingUser) 
	{
		this.lastModifyingUser = lastModifyingUser;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Drive revisions.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList  
	{
		List<ffhttp_GoogleDriveModelRevision> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_REVISION_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelRevision>)items;
		}
	}
}
