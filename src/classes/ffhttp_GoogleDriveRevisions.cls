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
 * ffhttp_GoogleDriveRevisions
 *
 * Class to encapsulate all the Google Drive Revisions API calls.
 * https://developers.google.com/drive/v2/reference/#Revisions
 *
 * All revisions are related to a particular Google Drive file.
 */
public with sharing class ffhttp_GoogleDriveRevisions extends ffhttp_GoogleDriveResource 
{
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveRevisions(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @param file The file for which we require the revisions.
	 * @return Access to the Apps API calls.
	 */
	public ffhttp_GoogleDriveRevisions(ffhttp_GoogleDrive service, ffhttp_GoogleDriveModelFile file) 
	{
		super(service, file);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	 
	/**
     * Removes a revision from the file referenced in the constructor.
     *
     * Create a request for the method "revisions.delete".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param revisionId The ID of the revision.
     * @return the request
     */
	public DeleteRequest deleteRequest(String revisionId) 
	{
		validateFile();
		return new DeleteRequest(this, revisionId);
	}
	
	 /**
     * Gets a specific revision for the file referenced in the constructor.
     *
     * Create a request for the method "revisions.get".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param revisionId The ID of the revision.
     * @return the request
     */
	public GetRequest getRequest(String revisionId)
	{
		validateFile();
		return new GetRequest(this, revisionId);
	}
	
	/**
     * Lists the revisions for the file referenced in the constructor.
     *
     * Create a request for the method "revisions.list".
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
     * Updates a revision.
     *
     * Create a request for the method "revisions.update".
     *
     * This request holds the parameters needed by the drive server.  After setting any optional
     * parameters, call the execute() method to invoke the remote operation.
     *
     * @param content the {@link ffhttp_GoogleDriveModelRevision}
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelRevision revision)
	{
		validateFile();
		return new UpdateRequest(this, revision);
	}

	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/

	public class DeleteRequest extends GoogleDriveFileRequest
	{
		DeleteRequest(ffhttp_GoogleDriveRevisions revisions, String revisionId) 
		{
			super(revisions, ENDPOINT_REVISIONS + revisionId, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class GetRequest extends GoogleDriveFileRequest
	{
		GetRequest(ffhttp_GoogleDriveRevisions revisions, String revisionId) 
		{
			super(revisions, ENDPOINT_REVISIONS + revisionId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelRevision.class));
		}
	}
	
	public class ListRequest extends GoogleDriveFileRequest
	{
		ListRequest(ffhttp_GoogleDriveRevisions revisions)
		{
			super(revisions, ENDPOINT_REVISIONS, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelRevision.ItemList.class));
		}
	}
	
	public class UpdateRequest extends GoogleDriveFileRequest
	{
		UpdateRequest(ffhttp_GoogleDriveRevisions revisions, ffhttp_GoogleDriveModelRevision revision)
		{
			super(revisions, ENDPOINT_REVISIONS + revision.getId(), REQUEST_METHOD_PUT, revision,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelRevision.class));
		}
	}
}
