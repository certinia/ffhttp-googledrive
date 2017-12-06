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
 * ffhttp_GoogleDriveComments
 *
 * Class to encapsulate all the Google Drive Comments API calls.
 * https://developers.google.com/drive/v2/reference/#Comments
 *
 * All comments are related to a particular Google Drive file.
 */
public with sharing class ffhttp_GoogleDriveComments extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Comments API calls.
	 */
	public ffhttp_GoogleDriveComments(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the comments.
	 * @return Access to the Comments API calls.
	 */
	public ffhttp_GoogleDriveComments(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		super(service, file);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Removes a comment from a file.
     *
     * Create a request for the method "comments.delete".
     *
     * @param commentId The ID of the comment.
     * @return the request
     */
	public DeleteRequest deleteRequest(String commentId)
	{
		validateFile();
		return new DeleteRequest(this, commentId);
	}

	/**
     * Gets a comment by ID from a particular file.
     *
     * Create a request for the method "comments.get".
     *
     * @param commentId The ID of the comment.
     * @return the request
     */
	public GetRequest getRequest(String commentId)
	{
		validateFile();
		return new GetRequest(this, commentId);
	}
	
	/**
     * Creates a new comment on the given file.
     *
     * Create a request for the method "comments.insert".
     *
     * @param content the {@link ffhttp_GoogleDriveModelComment}
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelComment comment)
	{ 
		validateFile();	
		return new InsertRequest(this, comment);
	}

    /**
     * Lists the given file's comments.
     *
     * Create a request for the method "comments.list".
     *
     * @return the request
     */
	public ListRequest listRequest()
	{
		validateFile();
		return new ListRequest(this);
	}
	
	/**
     * Updates an existing comment.
     *
     * Create a request for the method "comments.update".
     *
     * @param content the {@link ffhttp_GoogleDriveModelComment}
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelComment comment)
	{
		validateFile();
		return new UpdateRequest(this, comment);
	}
	
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	 
	public class DeleteRequest extends GoogleDriveFileRequest
	{
		DeleteRequest(ffhttp_GoogleDriveComments comments, String commentId)
		{
			super(comments, ENDPOINT_COMMENTS + commentId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest 
	{
		GetRequest(ffhttp_GoogleDriveComments comments, String commentId)
		{
			super(comments, ENDPOINT_COMMENTS + commentId, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelComment.class));
		}
		
		/**
		 * Request parameters
		 */
		 
		 /**
		  * If set, this will succeed when retrieving a deleted comment, and will include any deleted replies. 
		  * (Default: false)
		  */
		public Boolean getIncludeDeleted()
		{
			return getParam('includeDeleted', false);
		}
		public GetRequest setIncludeDeleted(Boolean includeDeleted)
		{
			addParam('includeDeleted', includeDeleted);
			return this;
		}	
	}
	 
	public class InsertRequest extends GoogleDriveFileRequest
	{	
		InsertRequest(ffhttp_GoogleDriveComments comments, ffhttp_GoogleDriveModelComment comment) 
		{
			super(comments, ENDPOINT_COMMENTS, REQUEST_METHOD_POST, comment, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelComment.class));
		}
	}

	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDriveComments comments)
		{
			super(comments, ENDPOINT_COMMENTS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelComment.ItemList.class));
		}
		
		/**
		 * Request parameters
		 */
		public Boolean getIncludeDeleted()
		{
			return getParam('includeDeleted', false);
		}
		public ListRequest setIncludeDeleted(Boolean includeDeleted)
		{
			addParam('includeDeleted', includeDeleted);
			return this;
		}
		public Integer getMaxResults()
		{
			return getParam('maxResults', 20);
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
		public String getUpdatedMin()
		{
			return getParam('updatedMin', (String)null);
		}
		public ListRequest setUpdatedMin(String updatedMin)
		{
			addParam('updatedMin', updatedMin);
			return this;
		}
	}

	public class UpdateRequest extends GoogleDriveFileRequest
	{
		UpdateRequest(ffhttp_GoogleDriveComments comments, ffhttp_GoogleDriveModelComment comment)
		{
			super(comments, ENDPOINT_COMMENTS + comment.getCommentId(), REQUEST_METHOD_PUT, comment, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelComment.class));
		}
	}
}
