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
 * ffhttp_GoogleDriveModelComment
 *
 * An object that represents the meta data for a comment in Google Drive.
 * https://developers.google.com/drive/v2/reference/comments#resource
 */
public with sharing class ffhttp_GoogleDriveModelComment extends ffhttp_GoogleDriveModelAbstractObject
{
	//Statics for the comment status
	public static final String COMMENT_STATUS_OPEN = 'open';			//The comment is still open.
	public static final String COMMENT_STATUS_RESOLVED = 'resolved';	//The comment has been resolved by one of its replies.
	
	//Instance variables
	private String selfLink;						//A link back to this comment.
	private String commentId;						//The ID of the comment.	
	private DateTime createdDate;					//The date when this comment was first created.	
	private DateTime modifiedDate;					//The date when this comment or any of its replies were last modified.	
	private String htmlContent;						//HTML formatted content for this comment.
	private String content;							//The plain text content used to create this comment. 
													//This is not HTML safe and should only be used as a starting point to make 
													//edits to a comment's content.
	private Boolean deleted;						//Whether this comment has been deleted. 
													//If a comment has been deleted the content will be cleared and this will 
													//only represent a comment that once existed.				
	private String status;							//The status of this comment. 
													//Status can be changed by posting a reply to a comment with the desired status.
													// "open" - The comment is still open.
													// "resolved" - The comment has been resolved by one of its replies.
	private String anchor;							//A region of the document represented as a JSON string. 
													//See anchor documentation for details on how to define and 
													//interpret anchor properties.	
	private String fileId;							//The file which this comment is addressing.	
	private String fileTitle;						//The title of the file which this comment is addressing.	
	private Context context; 						//The context of the file which is being commented on.		
	private ffhttp_GoogleDriveModelUser author;		//The user who wrote this comment.
	private ffhttp_GoogleDriveModelReply[] replies;	//Replies to this post.	
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelComment()
	{
		super(KIND_DRIVE_COMMENT);
	}
	
	/**
	 * Get/Sets
	 */
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelComment setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getCommentId() 
	{
		return commentId;
	}
	public ffhttp_GoogleDriveModelComment setCommentId(String commentId) 
	{
		this.commentId = commentId;
		return this;
	}
	public DateTime getCreatedDate() 
	{
		return createdDate;
	}
	public ffhttp_GoogleDriveModelComment setCreatedDate(DateTime createdDate) 
	{
		this.createdDate = createdDate;
		return this;
	}
	public DateTime getModifiedDate() 
	{
		return modifiedDate;
	}
	public ffhttp_GoogleDriveModelComment setModifiedDate(DateTime modifiedDate) 
	{
		this.modifiedDate = modifiedDate;
		return this;
	}
	public String getHtmlContent() 
	{
		return htmlContent;
	}
	public ffhttp_GoogleDriveModelComment setHtmlContent(String htmlContent) 
	{
		this.htmlContent = htmlContent;
		return this;
	}
	public String getContent() 
	{
		return content;
	}
	public ffhttp_GoogleDriveModelComment setContent(String content) 
	{
		this.content = content;
		return this;
	}
	public Boolean getDeleted() 
	{
		return deleted;
	}
	public ffhttp_GoogleDriveModelComment setDeleted(Boolean deleted) 
	{
		this.deleted = deleted;
		return this;
	}
	public String getStatus() 
	{
		return status;
	}
	public ffhttp_GoogleDriveModelComment setStatus(String status) 
	{
		this.status = status;
		return this;
	}
	public String getAnchor() 
	{
		return anchor;
	}
	public ffhttp_GoogleDriveModelComment setAnchor(String anchor) 
	{
		this.anchor = anchor;
		return this;
	}
	public String getFileId() 
	{
		return fileId;
	}
	public ffhttp_GoogleDriveModelComment setFileId(String fileId) 
	{
		this.fileId = fileId;
		return this;
	}
	public String getFileTitle() 
	{
		return fileTitle;
	}
	public ffhttp_GoogleDriveModelComment setFileTitle(String fileTitle) 
	{
		this.fileTitle = fileTitle;
		return this;
	}
	public Context getContext() 
	{
		return context;
	}
	public ffhttp_GoogleDriveModelComment setContext(Context context) 
	{
		this.context = context;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getAuthor() 
	{
		return author;
	}
	public ffhttp_GoogleDriveModelComment setAuthor(ffhttp_GoogleDriveModelUser author) 
	{
		this.author = author;
		return this;
	}
	public ffhttp_GoogleDriveModelReply[] getReplies() 
	{
		return replies;
	}
	public ffhttp_GoogleDriveModelComment setReplies(ffhttp_GoogleDriveModelReply[] replies) 
	{
		this.replies = replies;
		return this;
	}
	
	/**
	 * Context
	 */
	public class Context
	{
		private String type;	//The MIME type of the context snippet.
		private String value; 	//Data representation of the segment of the file being commented on. 
								//In the case of a text file for example, this would be the actual text that the comment is about.	
		
		public String getType() 
		{
			return type;
		}
		public Context setType(String type) 
		{
			this.type = type;
			return this;
		}
		public String getValue() 
		{
			return value;
		}
		public Context setValue(String value) 
		{
			this.value = value;
			return this;
		}
	}
	
	/**
	 * Object to represent a list of Google Drive comments.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList
	{
		List<ffhttp_GoogleDriveModelComment> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_COMMENT_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelComment>)items;
		}
	}
}
