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
 * ffhttp_GoogleDriveModelReply
 *
 * An object that represent the meta data for a reply to a comment on a file in Google Drive.
 * https://developers.google.com/drive/v2/reference/replies#resource
 */
public with sharing class ffhttp_GoogleDriveModelReply extends ffhttp_GoogleDriveModelAbstractObject 
{
	//Statics for reply actions
	public static final String VERB_RESOLVE = 'resolve'; 	//To resolve a comment.
	public static final String VERB_REOPEN = 'reopen'; 		//To reopen (un-resolve) a comment.
	
	//Instance variables
	private String replyId;				//The ID of the reply.	
	private DateTime createdDate;		//The date when this reply was first created.
	private DateTime modifiedDate; 		//The date when this reply was last modified.	
	private String htmlContent;			//HTML formatted content for this reply.	
	private String content;				//The plain text content used to create this reply. 
										//This is not HTML safe and should only be used as a starting point to 
										//make edits to a reply's content. This field is required on inserts if 
										//no verb is specified (resolve/reopen).				
	private Boolean deleted;			//Whether this reply has been deleted.
										//If a reply has been deleted the content will be cleared and this will 
										//only represent a reply that once existed.			
	private String verb;				//The action this reply performed to the parent comment. 
										//When creating a new reply this is the action to be perform to the parent comment. 
										//Possible values are: resolve & reopen. 
	private ffhttp_GoogleDriveModelUser author; //The user who wrote this reply.	
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelReply()
	{
		super(KIND_DRIVE_REPLY);
	}
	
	/**
	 * Get/Sets
	 */
	public String getReplyId()
	{
		return replyId;
	}
	public ffhttp_GoogleDriveModelReply setReplyId(String replyId)
	{
		this.replyId = replyId;
		return this;
	}
	public DateTime getCreatedDate()
	{
		return createdDate;
	}
	public ffhttp_GoogleDriveModelReply setCreatedDate(DateTime createdDate)
	{
		this.createdDate = createdDate;
		return this;
	}
	public DateTime getModifiedDate()
	{
		return modifiedDate;
	}
	public ffhttp_GoogleDriveModelReply setModifiedDate(DateTime modifiedDate)
	{
		this.modifiedDate = modifiedDate;
		return this;
	}
	public String getHtmlContent()
	{
		return htmlContent;
	}
	public ffhttp_GoogleDriveModelReply setHtmlContent(String htmlContent)
	{
		this.htmlContent = htmlContent;
		return this;
	}
	public String getContent()
	{
		return content;
	}
	public ffhttp_GoogleDriveModelReply setContent(String content)
	{
		this.content = content;
		return this;
	}
	public Boolean getDeleted()
	{
		return deleted;
	}
	public ffhttp_GoogleDriveModelReply setDeleted(Boolean deleted)
	{
		this.deleted = deleted;
		return this;
	}
	public String getVerb()
	{
		return verb;
	}
	public ffhttp_GoogleDriveModelReply setVerb(String verb)
	{
		this.verb = verb;
		return this;
	}
	public ffhttp_GoogleDriveModelUser getAuthor()
	{
		return author;
	}
	public ffhttp_GoogleDriveModelReply setAuthor(ffhttp_GoogleDriveModelUser author)
	{
		this.author = author;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Drive replies.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList 
	{
		List<ffhttp_GoogleDriveModelReply> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_REPLY_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems()
		{
			return (List<ffhttp_GoogleDriveModelReply>)items;
		}
	}
}
