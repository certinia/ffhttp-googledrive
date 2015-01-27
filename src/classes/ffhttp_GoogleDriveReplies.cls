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
 * ffhttp_GoogleDriveReplies
 *
 * Class to encapsulate all the Google Drive Replies API calls.
 * https://developers.google.com/drive/v2/reference/#Replies
 *
 * All replies are related to a particular Google Drive file and comment.
 */
public with sharing class ffhttp_GoogleDriveReplies extends ffhttp_GoogleDriveResource 
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveReplies(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the comments.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveReplies(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		super(service, file);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the comments.
	 * @param comment The comment for which we require the replies.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveReplies(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file, 
							 		 ffhttp_GoogleDriveModelComment comment) 
	{
		super(service, file, comment);
	}

	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Deletes a reply.
     *
     * Create a request for the method "replies.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param replyId The ID of the reply.
     * @return the request
     */
	public DeleteRequest deleteRequest(String replyId) 
	{
		validateFile();
		validateComment();
		return new DeleteRequest(this, replyId);
	}
	
	 /**
     * Gets a reply.
     *
     * Create a request for the method "replies.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param replyId The ID of the reply.
     * @return the request
     */
	public GetRequest getRequest(String replyId)
	{
		validateFile();
		validateComment();
		return new GetRequest(this, replyId);
	}
	
	/**
     * Creates a new reply to the given comment.
     *
     * Create a request for the method "replies.insert".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param reply the ffhttp_GoogleDriveModelReply
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelReply reply)
	{
		validateFile();
		validateComment();
		return new InsertRequest(this, reply);
	}
	
	/**
     * Lists all of the replies to a comment in a given file.
     *
     * Create a request for the method "replies.list".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		validateFile();
		validateComment();
		return new ListRequest(this);
	}
	
	/**
     * Updates an existing reply.
     *
     * Create a request for the method "replies.update".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param reply the ffhttp_GoogleDriveModelReply
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelReply reply)
	{
		validateFile();
		validateComment();
		return new UpdateRequest(this, reply);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleDriveCommentRequest
	{
		DeleteRequest(ffhttp_GoogleDriveReplies replies, String replyId) 
		{
			super(replies, ENDPOINT_REPLIES + replyId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveCommentRequest
	{
		GetRequest(ffhttp_GoogleDriveReplies replies, String replyId) 
		{
			super(replies, ENDPOINT_REPLIES + replyId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelReply.class));
		}
		
		/**
		 * Request parameters
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
	
	public class InsertRequest extends GoogleDriveCommentRequest
	{
		InsertRequest(ffhttp_GoogleDriveReplies replies, ffhttp_GoogleDriveModelReply content)
		{
			super(replies, ENDPOINT_REPLIES, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelReply.class));
		}
	}
	
	public class ListRequest extends GoogleDriveCommentRequest
	{
		ListRequest(ffhttp_GoogleDriveReplies replies)
		{
			super(replies, ENDPOINT_REPLIES, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelReply.ItemList.class));
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
			return getParam('pageToken');
		}
		public ListRequest setPageToken(String pageToken)
		{
			addParam('pageToken', pageToken);
			return this;
		}
	}
	
	public class UpdateRequest extends GoogleDriveCommentRequest
	{
		UpdateRequest(ffhttp_GoogleDriveReplies replies, ffhttp_GoogleDriveModelReply reply)
		{
			super(replies, ENDPOINT_REPLIES + reply.getReplyId(), REQUEST_METHOD_PUT, reply,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelReply.class));
		}
	}
}
