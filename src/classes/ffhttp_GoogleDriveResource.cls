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
 * ffhttp_GoogleDriveResource
 *
 * Abstract class to provide the base functionality for all Google Drive API calls.
 * 
 * Google provides a set of resources that are all extended by this class.
 * See https://developers.google.com/drive/v2/reference/
 */
public abstract class ffhttp_GoogleDriveResource 
{
	//OAuth Scopes
	public static final String SCOPE_DRIVE = 'https://www.googleapis.com/auth/drive';
	public static final String SCOPE_DRIVE_APPDATA = 'https://www.googleapis.com/auth/drive.appdata';
	public static final String SCOPE_DRIVE_APPS_READONLY = 'https://www.googleapis.com/auth/drive.apps.readonly';
	public static final String SCOPE_DRIVE_FILE = 'https://www.googleapis.com/auth/drive.file';
	public static final String SCOPE_DRIVE_METADATA_READONLY = 'https://www.googleapis.com/auth/drive.metadata.readonly';
	public static final String SCOPE_DRIVE_READONLY = 'https://www.googleapis.com/auth/drive.readonly';
	public static final String SCOPE_DRIVE_SCRIPTS = 'https://www.googleapis.com/auth/drive.scripts';

	//Endpoints 
	public static final String UPLOAD_ENDPOINT = 'https://www.googleapis.com/upload/drive/v2/';
	public static final String METADATA_ENDPOINT = 'https://www.googleapis.com/drive/v2/';
		
	public static final String ENDPOINT_ABOUT = 'about/';
	public static final String ENDPOINT_APPS = 'apps/';
	public static final String ENDPOINT_CHANGES = 'changes/';
	public static final String ENDPOINT_CHANNELS = 'channels/';
	public static final String ENDPOINT_CHILDREN = 'children/';
	public static final String ENDPOINT_COMMENTS = 'comments/';
	public static final String ENDPOINT_FILES = 'files/';
	public static final String ENDPOINT_PARENTS = 'parents/';
	public static final String ENDPOINT_PERMISSIONS = 'permissions/';
	public static final String ENDPOINT_PERMISSIONIDS = 'permissionIds/';
	public static final String ENDPOINT_PROPERTIES = 'properties/';
	public static final String ENDPOINT_REPLIES = 'replies/';
	public static final String ENDPOINT_REVISIONS = 'revisions/';
	
	public static final String COMMAND_COPY = 'copy';
	public static final String COMMAND_TOUCH = 'touch';
	public static final String COMMAND_TRASH = 'trash';
	public static final String COMMAND_STOP = 'stop';
	public static final String COMMAND_UNTRASH = 'untrash';
	public static final String COMMAND_WATCH = 'watch';
	
	public static final String URL_SEPARATOR = '/';
	
	private ffhttp_GoogleDrive m_service;
	private ffhttp_GoogleDriveModelFile m_file;
	private ffhttp_GoogleDriveModelComment m_comment;
	
	/**
	 * Constructors
	 */
	public ffhttp_GoogleDriveResource(ffhttp_GoogleDrive service) 
	{
		m_service = service;
	}
	
	public ffhttp_GoogleDriveResource(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		m_service = service;
		m_file = file;
	}
	
	public ffhttp_GoogleDriveResource(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file, 
							  		  ffhttp_GoogleDriveModelComment comment) 
	{
		m_service = service;
		m_file = file;
		m_comment = comment;
	}
	
	public void validateFile() 
	{
		if (m_file == null) throw new ffhttp_SystemException(System.Label.ffhttp_gdrive_NullFile);
  		if (m_file.getId() == null) throw new ffhttp_SystemException(System.Label.ffhttp_gdrive_NullFileId);
	}
	
	public void validateComment() 
	{
		if (m_comment == null) throw new ffhttp_SystemException(System.Label.ffhttp_gdrive_NullComment);
  		if (m_comment.getCommentId() == null) throw new ffhttp_SystemException(System.Label.ffhttp_gdrive_NullCommentId);
	}
	
	/**
	 * Get/Sets
	 */
	public ffhttp_GoogleDrive getService() 
	{
		return m_service;
	}
	public ffhttp_GoogleDriveResource setService(ffhttp_GoogleDrive service) 
	{
		m_service = service;
		return this;
	}
	public ffhttp_GoogleDriveModelFile getFile() 
	{
		return m_file;
	}
	public ffhttp_GoogleDriveResource setFile(ffhttp_GoogleDriveModelFile file) 
	{
		m_file = file;
		return this;
	}
	public ffhttp_GoogleDriveModelComment getComment() 
	{
		return m_comment;
	}
	public ffhttp_GoogleDriveResource setComment(ffhttp_GoogleDriveModelComment comment) 
	{
		m_comment = comment;
		return this;
	}
	
	/*********************************************************************************************************
	 * Abstract inner classes
	 *********************************************************************************************************/
	
	/**
	 * GoogleDriveCommentRequest
	 *
	 * Abstract class created for requests that involve a comment e.g. all 'Replies' requests require this.
	 */
	public abstract class GoogleDriveCommentRequest extends GoogleDriveRequest
	{
		protected GoogleDriveCommentRequest(ffhttp_GoogleDriveResource resource, String subEndpoint, String method, 
												   ffhttp_IHttpContent content, ffhttp_IDeserialize responseDeserializer) 
		{
			super(resource, METADATA_ENDPOINT, 
				  ENDPOINT_FILES + resource.getFile().getId() + URL_SEPARATOR + ENDPOINT_COMMENTS + 
				  resource.getComment().getCommentId() + URL_SEPARATOR + subEndpoint, 
				  method, content, responseDeserializer);
		}
	}
	
	/**
	 * GoogleDriveFileRequest
	 *
	 * Abstract class created for requests that involve a file e.g. all 'Comment' requests require this.
	 */
	public abstract class GoogleDriveFileRequest extends GoogleDriveRequest
	{
		protected GoogleDriveFileRequest(ffhttp_GoogleDriveResource resource, String subEndpoint, String method, 
										 ffhttp_IHttpContent content, ffhttp_IDeserialize responseDeserializer) 
		{
			super(resource, METADATA_ENDPOINT, ENDPOINT_FILES + resource.getFile().getId() + URL_SEPARATOR + subEndpoint, 
				  method, content, responseDeserializer);
		}
	}
	
	/**
	 * GoogleDriveRequest
	 * 
	 * Abtract class created as the majority of requests support the fields parameter.
	 * This allows you to specify which fields to include in a partial response.
	 */
	public abstract class GoogleDriveRequest extends ffhttp_Client.AbstractClientRequest
	{ 
	 	protected GoogleDriveRequest(ffhttp_GoogleDriveResource resource, String mainEndpoint, String subEndpoint, String method, 
	 								 ffhttp_IHttpContent content, ffhttp_IDeserialize responseDeserializer) 
	 	{
			super(resource.getService(), mainEndpoint + subEndpoint, method, content, responseDeserializer);
		}
	 	
		public String getFields() 
		{
			return getParam('fields');
		}
		public GoogleDriveRequest setFields(String fieldList) 
		{
			addParam('fields', fieldList);
			return this;
		}
		public Boolean getPrettyPrint() 
		{
			return getParam('prettyPrint', true);
		}
		public GoogleDriveRequest setPrettyPrint(Boolean prettyPrint) 
		{
			addParam('prettyPrint', prettyPrint);
			return this;
		}
	}
}
