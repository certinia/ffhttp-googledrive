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
 * ffhttp_GoogleDriveModelChange
 *
 * An object that represents the meta data for a change in Google Drive.
 * https://developers.google.com/drive/v2/reference/changes#resource
 */
public with sharing class ffhttp_GoogleDriveModelChange extends ffhttp_GoogleDriveModelAbstractObject
{
	//Instance variables
	private Long id;							//The ID of the change.
	private String fileId;						//The ID of the file associated with this change.
	private String selfLink;					//A link back to this change.
	private Boolean deleted;					//Whether the file has been deleted.	
	private DateTime modificationDate;			//The time of this modification.
	private ffhttp_GoogleDriveModelFile file;	//The updated state of the file. Present if the file has not been deleted.	
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelChange()
	{
		super(KIND_DRIVE_CHANGE);
	}
	
	/**
	 * Get/Sets
	 */
	public Long getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelChange setId(Long id) 
	{
		this.id = id;
		return this;
	}
	public String getFileId() 
	{
		return fileId;
	}
	public ffhttp_GoogleDriveModelChange setFileId(String fileId) 
	{
		this.fileId = fileId;
		return this;
	}
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelChange setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public Boolean getDeleted() 
	{
		return deleted;
	}
	public ffhttp_GoogleDriveModelChange setDeleted(Boolean deleted) 
	{
		this.deleted = deleted;
		return this;
	}
	public DateTime getModificationDate() 
	{
		return modificationDate;
	}
	public ffhttp_GoogleDriveModelChange setModificationDate(DateTime modificationDate) 
	{
		this.modificationDate = modificationDate;
		return this;
	}
	public ffhttp_GoogleDriveModelFile getFile() 
	{
		return file;
	}
	public ffhttp_GoogleDriveModelChange setFile(ffhttp_GoogleDriveModelFile file) 
	{
		this.file = file;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Drive changes.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList 
	{
		List<ffhttp_GoogleDriveModelChange> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_CHANGE_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelChange>)items;
		}
	}
}
