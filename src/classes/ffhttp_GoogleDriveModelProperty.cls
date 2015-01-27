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
 * ffhttp_GoogleDriveModelProperty
 *
 * An object that represent the meta data for file property in Google Drive.
 * https://developers.google.com/drive/v2/reference/properties#resource
 */
public with sharing class ffhttp_GoogleDriveModelProperty extends ffhttp_GoogleDriveModelAbstractObject 
{
	//Instance variables
	private String etag;		//ETag of the property.	
	private String selfLink;	//The link back to this property.	
	private String key;			//The key of this property.	
	private String visibility;	//The visibility of this property.	
	private String value;		//The value of this property.
	
	/**
	 * Constructor
	 */
	public ffhttp_GoogleDriveModelProperty()
	{
		super(KIND_DRIVE_PROPERTY);
	}
	
	/**
	 * Get/Sets
	 */
	public String getEtag()
	{
		return etag;
	}
	public ffhttp_GoogleDriveModelProperty setEtag(String etag) 
	{
		this.etag = etag;
		return this;
	}
	public String getSelfLink() 
	{
		return selfLink;
	}
	public ffhttp_GoogleDriveModelProperty setSelfLink(String selfLink) 
	{
		this.selfLink = selfLink;
		return this;
	}
	public String getKey() 
	{
		return key;
	}
	public ffhttp_GoogleDriveModelProperty setKey(String key) 
	{
		this.key = key;
		return this;
	}
	public String getVisibility() 
	{
		return visibility;
	}
	public ffhttp_GoogleDriveModelProperty setVisibility(String visibility) 
	{
		this.visibility = visibility;
		return this;
	}
	public String getValue() 
	{
		return value;
	}
	public ffhttp_GoogleDriveModelProperty setValue(String value) 
	{
		this.value = value;
		return this;
	}
	
	/**
	 * Object to represent a list of Google Drive properties.
	 */
	public with sharing class ItemList extends ffhttp_GoogleDriveModelAbstractObject.AbstractList 
	{
		List<ffhttp_GoogleDriveModelProperty> items;
			
		/**
		 * Constructor
		 */
		public ItemList()
		{
			super(KIND_DRIVE_PROPERTY_LIST);
		}
		
		public override List<ffhttp_GoogleDriveModelAbstractObject> getItems() 
		{
			return (List<ffhttp_GoogleDriveModelProperty>)items;
		}
	}
}
