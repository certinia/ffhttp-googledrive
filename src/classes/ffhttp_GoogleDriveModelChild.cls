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
 * ffhttp_GoogleDriveModelChild
 *
 * An object that represents the meta data for a child reference in Google Drive.
 * https://developers.google.com/drive/v2/reference/children#resource
 */
public with sharing class ffhttp_GoogleDriveModelChild extends ffhttp_GoogleDriveModelAbstractObject 
{
	//Instance variables
	private String id;			//The ID of the child.	
	private String selfLink;	//A link back to this reference.	
	private String childLink;	//A link to the child.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelChild()
	{
		super(KIND_DRIVE_CHILD);
	}
	
	/**
	 * Get/Sets
	 */
	public String getId() 
	{
		return id;
	}
	public ffhttp_GoogleDriveModelChild setId(String id) 
	{
		this.id = id;
		return this;
	}
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelChild setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getChildLink() 
	{
		return childLink;
	}
	public ffhttp_GoogleDriveModelChild setChildLink(String childLink) 
	{
		this.childLink = childLink;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Drive child references.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList 
	{
	 	List<ffhttp_GoogleDriveModelChild> items;
		
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_CHILD_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelChild>)items;
		}
	}
}
