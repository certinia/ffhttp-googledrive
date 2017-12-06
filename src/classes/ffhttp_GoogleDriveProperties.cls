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
 * ffhttp_GoogleDriveProperties
 *
 * Class to encapsulate all the Google Drive Properties API calls.
 * https://developers.google.com/drive/v2/reference/#Properties
 */
public with sharing class ffhttp_GoogleDriveProperties extends ffhttp_GoogleDriveResource
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveProperties(ffhttp_GoogleDrive service)
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the properties.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveProperties(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file)
	{
		super(service, file);
	}

	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Deletes a property from the file referenced in the constructor.
     *
     * Create a request for the method "properties.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the {@link Delete#execute()} method to invoke the remote operation.
     *
     * @param propertyKey The key of the property.
     * @return the request
     */
	public DeleteRequest deleteRequest(String propertyKey) 
	{
		validateFile();
		return new DeleteRequest(this, propertyKey);
	}
	
	/**
     * Gets a property by its key from the file referenced in the constructor.
     *
     * Create a request for the method "properties.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param propertyKey The key of the property.
     * @return the request
     */
	public GetRequest getRequest(String propertyKey)
	{
		validateFile();
		return new GetRequest(this, propertyKey);
	}
	
	/**
     * Adds a property to the file referenced in the constructor.
     *
     * Create a request for the method "properties.insert".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the {@link ffhttp_GoogleDriveModelProperty}
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelProperty property)
	{
		validateFile();
		return new InsertRequest(this, property);
	}
	
	/**
     * Lists the properties for the file referenced in the constructor.
     *
     * Create a request for the method "properties.list".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		validateFile();
		return new ListRequest(this);
	}
	
	/**
     * Updates a property for the file referenced in the constructor.
     *
     * Create a request for the method "properties.update".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the ffhttp_GoogleDriveModelProperty
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelProperty property)
	{
		validateFile();
		return new UpdateRequest(this, property);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleDriveFileRequest
	{
		DeleteRequest(ffhttp_GoogleDriveProperties properties, String propertyKey) 
		{
			super(properties, ENDPOINT_PROPERTIES + propertyKey, REQUEST_METHOD_DELETE, null, null);
		}
		
		/**
		 * Request parameters
		 */
		public String getVisibility()
		{
			return getParam('visibility', (String)null);
		}
		public DeleteRequest setVisibility(String visibility)
		{
			addParam('visibility', visibility);
			return this;
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest
	{
		GetRequest(ffhttp_GoogleDriveProperties properties, String propertyKey) 
		{
			super(properties, ENDPOINT_PROPERTIES + propertyKey, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelProperty.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getVisibility()
		{
			return getParam('visibility', (String)null);
		}
		public GetRequest setVisibility(String visibility)
		{
			addParam('visibility', visibility);
			return this;
		}
	}
	
	public class InsertRequest extends GoogleDriveFileRequest
	{
		InsertRequest(ffhttp_GoogleDriveProperties properties, ffhttp_GoogleDriveModelProperty content)
		{
			super(properties, ENDPOINT_PROPERTIES, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelProperty.class));
		}
	}
	
	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDriveProperties properties)
		{
			super(properties, ENDPOINT_PROPERTIES, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelProperty.ItemList.class));
		}
	}
	
	public class UpdateRequest extends GoogleDriveFileRequest
	{
		UpdateRequest(ffhttp_GoogleDriveProperties properties, ffhttp_GoogleDriveModelProperty content)
		{
			super(properties, ENDPOINT_PROPERTIES + content.getKey(), REQUEST_METHOD_PUT, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelProperty.class));
		}
		
		/**
		 * Request parameters
		 */
		public String getVisibility()
		{
			return getParam('visibility', (String)null);
		}
		public UpdateRequest setVisibility(String visibility)
		{
			addParam('visibility', visibility);
			return this;
		}
	}	
}
