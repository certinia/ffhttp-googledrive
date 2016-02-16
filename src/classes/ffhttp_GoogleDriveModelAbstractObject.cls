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
 * ffhttp_GoogleDriveModelAbstractObject
 *
 * Base Google Drive object returned via the Google Drive Response.
 * All other Google Drive objects extend this class.
 */
public abstract class ffhttp_GoogleDriveModelAbstractObject extends ffhttp_AbstractJsonSerializable
{
	//Google generic object types
	public static final String KIND_API_CHANNEL = 'api#channel';
	
	//Google Drive object types
	public static final String KIND_DRIVE_ABOUT = 'drive#about';
	public static final String KIND_DRIVE_APP = 'drive#app';
	public static final String KIND_DRIVE_COMMENT = 'drive#comment';
	public static final String KIND_DRIVE_CHANGE = 'drive#change';
	public static final String KIND_DRIVE_CHILD = 'drive#childReference';
	public static final String KIND_DRIVE_FILE = 'drive#file';
	public static final String KIND_DRIVE_PARENT = 'drive#parentReference';
	public static final String KIND_DRIVE_PERMISSION = 'drive#permission';
	public static final String KIND_DRIVE_PERMISSION_ID = 'drive#permissionId';
	public static final String KIND_DRIVE_PROPERTY = 'drive#property';
	public static final String KIND_DRIVE_REPLY = 'drive#commentReply';
	public static final String KIND_DRIVE_REVISION = 'drive#revision';
	public static final String KIND_DRIVE_USER = 'drive#user';
	
	//Google Drive list object types
	public static final String KIND_DRIVE_APP_LIST = 'drive#appList';
	public static final String KIND_DRIVE_COMMENT_LIST = 'drive#commentList';
	public static final String KIND_DRIVE_CHANGE_LIST = 'drive#changeList';
	public static final String KIND_DRIVE_CHILD_LIST = 'drive#childList';
	public static final String KIND_DRIVE_FILE_LIST = 'drive#fileList';
	public static final String KIND_DRIVE_PARENT_LIST = 'drive#parentList';
	public static final String KIND_DRIVE_PERMISSION_LIST = 'drive#permissionList';
	public static final String KIND_DRIVE_PROPERTY_LIST = 'drive#propertyList';
	public static final String KIND_DRIVE_REPLY_LIST = 'drive#commentReplyList';
	public static final String KIND_DRIVE_REVISION_LIST = 'drive#revisionList';
	
	//UploadTypes
	public static final String UPLOAD_TYPE_MEDIA = 'media';				//Upload the media only, without any metadata.
	public static final String UPLOAD_TYPE_MULTIPART = 'multipart';		//Upload both the media and its metadata, in a single request.
	public static final String UPLOAD_TYPE_RESUMABLE = 'resumable';		//Upload the file in a resumable fashion, using a series of at least two 
																		//requests where the first request includes the metadata.
	
	//Instance Variables
	private String kind;	//The kind of Google Drive object

	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelAbstractObject(String kind)
	{
		this.kind = kind;
	}
	
	/**
	 * Get/Sets
	 */
	public String getKind()
	{
		return kind;
	}
	
	/**
	 * AbstractList
	 *
	 * Base Google Drive object for lists returned via the Google Drive Response.
 	 * All other Google Drive lists extend this class.
	 */
	public abstract class AbstractList extends ffhttp_GoogleDriveModelAbstractObject
	{	
		//Instance Variables
		private String etag;			//The ETag of the list.
		private String selflink;		//A link back to this list.
		private String nextPageToken;	//The page token for the next page of items.
		private String nextLink;		//A link to the next page of items.
		
		//Abstract methods
		public abstract List<ffhttp_GoogleDriveModelAbstractObject> getItems();	//The actual list of items 
																				//(e.g. files, properties, etc...).
																				
		/**
		 * Constructor
		 */
		public AbstractList(String kind)
		{
			super(kind);
		}
		
		/**
		 * Get/Sets
		 */
		public String getEtag()
		{
			return etag;
		}
		public AbstractList setEtag(String etag)
		{
			this.etag = etag;
			return this;
		}
		public String getSelfLink()
		{
			return selfLink;
		}
		public AbstractList setSelfLink(String selfLink)
		{
			this.selfLink = selfLink;
			return this;
		}
		public String getNextPageToken()
		{
			return nextPageToken;
		}
		public AbstractList setNextPageToken(String nextPageToken)
		{
			this.nextPageToken = nextPageToken;
			return this;
		}
		public String getNextLink()
		{
			return nextLink;
		}
		public AbstractList setNextLink(String nextLink)
		{
			this.nextLink = nextLink;
			return this;
		}
	}
}
