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
 * ffhttp_GoogleDriveFiles
 *
 * Class to encapsulate all the Google Drive Files API calls.
 * https://developers.google.com/drive/v2/reference/#Files
 */
public with sharing class ffhttp_GoogleDriveFiles extends ffhttp_GoogleDriveResource
{	
	//Statics
	//Corpus
	public static final String CORPUS_DEFAULT = 'DEFAULT';
	public static final String CORPUS_DOMAIN = 'DOMAIN';
	
	//Visibility
	public static final String VISIBILITY_DEFAULT = 'DEFAULT';
	public static final String VISIBILITY_PRIVATE = 'PRIVATE';
	
	/**
	 * Constructor
	 *
	 * @param service The ffhttp_GoogleDrive service.
	 * @return Access to the Files API calls.
	 */
	public ffhttp_GoogleDriveFiles(ffhttp_GoogleDrive service) 
	{
		super(service);
	}
	
	/*********************************************************************************************************
	 * Requests
	 *********************************************************************************************************/
	
	/**
     * Gets a file's metadata by ID.
     *
     * Create a request for the method "files.get".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID for the file in question.
     * @return the request
     */
	public GetRequest getRequest(String fileId)
	{
		return new GetRequest(this, fileId);
	}
	
	/**
     * Insert a new file (metadata & contents)
     *
     * Create a request for the method "files.insert".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param file The ffhttp_GoogleDriveModelFile containing the metadata for the file.
     * @param fileContents The contents of the file in Blob format.
     * @return the request
     */
	public InsertRequest insertRequest(ffhttp_GoogleDriveModelFile file, Blob fileContents)
	{
		if (fileContents == null)
		{
			return new InsertRequest(this, METADATA_ENDPOINT, file);
		}
		
		ffhttp_BlobContent br = new ffhttp_BlobContent(fileContents, file.getMimeType());
		return new InsertRequest(this, UPLOAD_ENDPOINT, br);
	}
	
	/**
     * Updates a file.
     *
     * Create a request for the method "files.update".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param file The {@link ffhttp_GoogleDriveModelFile} media metadata.
     * @return the request
     */
	public UpdateRequest updateRequest(ffhttp_GoogleDriveModelFile file, Blob fileContents)
	{
		if (fileContents == null)
		{
			return new UpdateRequest(this, METADATA_ENDPOINT, file, file);
		}
		
		ffhttp_BlobContent br = new ffhttp_BlobContent(fileContents, file.getMimeType());
		return new UpdateRequest(this, UPLOAD_ENDPOINT, file, br);
	}
	
	/**
     * Creates a copy of the specified file.
     *
     * Create a request for the method "files.copy".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID of the file to copy.
     * @param content the {@link ffhttp_GoogleDriveModelFile}
     * @return the request
     */
	public CopyRequest copyRequest(String fileId, ffhttp_GoogleDriveModelFile content)
	{
		return new CopyRequest(this, fileId, content);
	}
	
	/**
     * Permanently deletes a file by ID. Skips the trash.
     *
     * Create a request for the method "files.delete".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID of the file to delete.
     * @return the request
     */
	public DeleteRequest deleteRequest(String fileId) 
	{
		return new DeleteRequest(this, fileId);
	}
	
	/**
     * Lists the user's files.
     *
     * Create a request for the method "files.list".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @return the request
     */
	public ListRequest listRequest() 
	{
		return new ListRequest(this);
	}
	
	/**
     * Set the file's updated time to the current server time.
     *
     * Create a request for the method "files.touch".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID of the file to update.
     * @return the request
     */
	public TouchRequest touchRequest(String fileId)
	{
		return new TouchRequest(this, fileId);
	}
	
	 /**
     * Moves a file to the trash.
     *
     * Create a request for the method "files.trash".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID of the file to trash.
     * @return the request
     */
	public TrashRequest trashRequest(String fileId)
	{
		return new TrashRequest(this, fileId);
	}

 	/**
     * Restores a file from the trash.
     *
     * Create a request for the method "files.untrash".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID of the file to untrash.
     * @return the request
     */
	public UntrashRequest untrashRequest(String fileId)
	{
		return new UntrashRequest(this, fileId);
	}
	
	/**
     * Subscribe to changes on a file
     *
     * Create a request for the method "files.watch".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @param fileId The ID for the file in question.
     * @param watchParam the {@link ffhttp_GoogleDriveModelWatch}
     * @return the request
     */
	public WatchRequest watchRequest(String fileId, ffhttp_GoogleDriveModelWatch watchParam)
	{
		return new WatchRequest(this, fileId, watchParam);
	}
	
	/**
     * Permanently deletes all of the user's trashed files.
     *
     * Create a request for the method "files.emptyTrash".
     *
     * This request holds the parameters needed by the drive server. After setting any optional
     * parameters, call the execute method to invoke the remote operation.
     *
     * @return the request
     */
	public EmptyTrashRequest emptyTrashRequest()
	{
		return new EmptyTrashRequest(this);
	}

	/**
	* Exports a Google Doc to the requested MIME type and returns the exported content. 
	* Please note that the exported content is limited to 10MB. 
	*
	* Create a request for the method "files.export".
	*
	* This request holds the parameters needed by the drive server. After setting any optional
	* parameters, call the execute method to invoke the remote operation.
	*
	* @param fileId The ID for the file in question.
    * @return the request
	*/
	public ExportRequest exportRequest(String fileId)
	{
		return new ExportRequest(this, fileId);
	}
	
	/*********************************************************************************************************
	 * API Callout Inner Classes
	 *********************************************************************************************************/
	
	public class GetRequest extends GoogleDriveRequest
	{
		GetRequest(ffhttp_GoogleDriveFiles files, String fileId)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + fileId, REQUEST_METHOD_GET, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
		}
		
		/**
		 * Request parameters
		 */
		public Boolean getUpdateViewedDate()
		{
			return getParam('updateViewedDate', false);
		}
		public GetRequest setUpdateViewedDate(Boolean updateViewedDate)
		{
			addParam('updateViewedDate', updateViewedDate);
			return this;
		}
	}
	
	public class InsertRequest extends GoogleDriveRequest
	{
		InsertRequest(ffhttp_GoogleDriveFiles files, String endpoint, ffhttp_IHttpContent content) 
		{
			super(files, endpoint, ENDPOINT_FILES, REQUEST_METHOD_POST, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
				
			//If we are uploading data the uploadType must be set to media.  
			if (endpoint == UPLOAD_ENDPOINT)
			{
				addParam('uploadType', ffhttp_GoogleDriveModelAbstractObject.UPLOAD_TYPE_MEDIA);
			}
		}
	
		/**
		 * Request parameters
		 */
		public Boolean getConvert()
		{
			return getParam('convert', false);
		}
		public InsertRequest setConvert(Boolean convert)
		{
			addParam('convert', convert);
			return this;
		}
		public Boolean getOcr()
		{
			return getParam('ocr', false);
		}
		public InsertRequest setOcr(Boolean ocr)
		{
			addParam('ocr', ocr);
			return this;
		}
		public String getOcrLanguage()
		{
			return getParam('ocrLanguage', (String)null);
		}
		public InsertRequest setOcrLanguage(String ocrLanguage)
		{
			addParam('ocrLanguage', ocrLanguage);
			return this;
		}
		public Boolean getPinned()
		{
			return getParam('pinned', false);
		}
		public InsertRequest setPinned(Boolean pinned)
		{
			addParam('pinned', pinned);
			return this;
		}
		public String getTimedTextLanguage()
		{
			return getParam('timedTextLanguage', (String)null);
		}
		public InsertRequest setTimedTextLanguage(String timedTextLanguage)
		{
			addParam('timedTextLanguage', timedTextLanguage);
			return this;
		}
		public String getTimedTextTrackName()
		{
			return getParam('timedTextTrackName', (String)null);
		}
		public InsertRequest setTimedTextTrackName(String timedTextTrackName)
		{
			addParam('timedTextTrackName', timedTextTrackName);
			return this;
		}	
		public Boolean getUseContentAsIndexableText()
		{
			return getParam('useContentAsIndexableText', false);
		}
		public InsertRequest setUseContentAsIndexableText(Boolean useContentAsIndexableText)
		{
			addParam('useContentAsIndexableText', useContentAsIndexableText);
			return this;
		}
		public String getVisibility()
		{
			return getParam('visibility', 'DEFAULT');
		}
		public InsertRequest setVisibility(String visibility)
		{
			addParam('visibility', visibility);
			return this;
		}
	}
	
	public class UpdateRequest extends GoogleDriveRequest
	{
		UpdateRequest(ffhttp_GoogleDriveFiles files, String endpoint, ffhttp_GoogleDriveModelFile file, ffhttp_IHttpContent content) 
		{
			super(files, endpoint, ENDPOINT_FILES + file.getId(), REQUEST_METHOD_PUT, content, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
				  
			//If we are uploading data the uploadType must be set to media.  
			if (endpoint == UPLOAD_ENDPOINT)
			{
				addParam('uploadType', ffhttp_GoogleDriveModelAbstractObject.UPLOAD_TYPE_MEDIA);
			}
		}
	
		/**
		 * Request parameters
		 */
		public String getAddParents()
		{
			return getParam('addParents', (String)null);
		}
		public UpdateRequest setAddParents(String addParents)
		{
			addParam('addParents', addParents);
			return this;
		}
		public Boolean getConvert()
		{
			return getParam('convert', false);
		}
		public UpdateRequest setConvert(Boolean convert)
		{
			addParam('convert', convert);
			return this;
		}
		public Boolean getNewRevision()
		{
			return getParam('newRevision', true);
		}
		public UpdateRequest setNewRevision(Boolean newRevision)
		{
			addParam('newRevision', newRevision);
			return this;
		}
		public Boolean getOcr()
		{
			return getParam('ocr', false);
		}
		public UpdateRequest setOcr(Boolean ocr)
		{
			addParam('ocr', ocr);
			return this;
		}
		public String getOcrLanguage()
		{
			return getParam('ocrLanguage', (String)null);
		}
		public UpdateRequest setOcrLanguage(String ocrLanguage)
		{
			addParam('ocrLanguage', ocrLanguage);
			return this;
		}
		public Boolean getPinned()
		{
			return getParam('pinned', false);
		}
		public UpdateRequest setPinned(Boolean pinned)
		{
			addParam('pinned', pinned);
			return this;
		}
		public String getRemoveParents()
		{
			return getParam('removeParents', (String)null);
		}
		public UpdateRequest setRemoveParents(String removeParents)
		{
			addParam('removeParents', removeParents);
			return this;
		}
		public Boolean getSetModifiedDate()
		{
			return getParam('setModifiedDate', false);
		}
		public UpdateRequest setSetModifiedDate(Boolean setModifiedDate)
		{
			addParam('setModifiedDate', setModifiedDate);
			return this;
		}
		public String getTimedTextLanguage()
		{
			return getParam('timedTextLanguage', (String)null);
		}
		public UpdateRequest setTimedTextLanguage(String timedTextLanguage)
		{
			addParam('timedTextLanguage', timedTextLanguage);
			return this;
		}
		public String getTimedTextTrackName()
		{
			return getParam('timedTextTrackName', (String)null);
		}
		public UpdateRequest setTimedTextTrackName(String timedTextTrackName)
		{
			addParam('timedTextTrackName', timedTextTrackName);
			return this;
		}	
		public Boolean getUpdateViewedDate()
		{
			return getParam('updateViewedDate', true);
		}
		public UpdateRequest setUpdateViewedDate(Boolean updateViewedDate)
		{
			addParam('updateViewedDate', updateViewedDate);
			return this;
		}
		public Boolean getUseContentAsIndexableText()
		{
			return getParam('useContentAsIndexableText', false);
		}
		public UpdateRequest setUseContentAsIndexableText(Boolean useContentAsIndexableText)
		{
			addParam('useContentAsIndexableText', useContentAsIndexableText);
			return this;
		}
	}
	
	public class CopyRequest extends GoogleDriveRequest
	{
		CopyRequest(ffhttp_GoogleDriveFiles files, String fileId, ffhttp_GoogleDriveModelFile file)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + file.getId() + URL_SEPARATOR + COMMAND_COPY, REQUEST_METHOD_POST, file, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
		}
		
		/**
		 * Request parameters
		 */
		public Boolean getConvert()
		{
			return getParam('convert', false);
		}
		public CopyRequest setConvert(Boolean convert)
		{
			addParam('convert', convert);
			return this;
		}
		public Boolean getOcr()
		{
			return getParam('ocr', false);
		}
		public CopyRequest setOcr(Boolean ocr)
		{
			addParam('ocr', ocr);
			return this;
		}
		public String getOcrLanguage()
		{
			return getParam('ocrLanguage', (String)null);
		}
		public CopyRequest setOcrLanguage(String ocrLanguage)
		{
			addParam('ocrLanguage', ocrLanguage);
			return this;
		}
		public Boolean getPinned()
		{
			return getParam('pinned', false);
		}
		public CopyRequest setPinned(Boolean pinned)
		{
			addParam('pinned', pinned);
			return this;
		}
		public String getTimedTextLanguage()
		{
			return getParam('timedTextLanguage', (String)null);
		}
		public CopyRequest setTimedTextLanguage(String timedTextLanguage)
		{
			addParam('timedTextLanguage', timedTextLanguage);
			return this;
		}
		public String getTimedTextTrackName()
		{
			return getParam('timedTextTrackName', (String)null);
		}
		public CopyRequest setTimedTextTrackName(String timedTextTrackName)
		{
			addParam('timedTextTrackName', timedTextTrackName);
			return this;
		}	
		public String getVisibility()
		{
			return getParam('visibility', 'DEFAULT');
		}
		public CopyRequest setVisibility(String visibility)
		{
			addParam('visibility', visibility);
			return this;
		}
	}
	
	public class DeleteRequest extends GoogleDriveRequest
	{
		DeleteRequest(ffhttp_GoogleDriveFiles files, String id) 
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + id, REQUEST_METHOD_DELETE, null, null);
		}
	}
	
	public class ListRequest extends GoogleDriveRequest
	{
		ListRequest(ffhttp_GoogleDriveFiles files)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES, REQUEST_METHOD_GET, null,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.ItemList.class));
		}
		
		/**
		 * Request Parameters
		 */
		public String getCorpus()
		{
			return getParam('corpus', 'DEFAULT');
		}
		public ListRequest setCorpus(String corpus)
		{
			addParam('corpus', corpus);
			return this;
		}
		public Integer getMaxResults()
		{
			return getParam('maxResults', 100);
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
		public String getQ()
		{
			return getParam('q', (String)null);
		}
		public ListRequest setQ(String q)
		{
			addParam('q', q);
			return this;
		}
	}
		
	public class TouchRequest extends GoogleDriveRequest
	{
		TouchRequest(ffhttp_GoogleDriveFiles files, String id) 
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + id + URL_SEPARATOR + COMMAND_TOUCH, REQUEST_METHOD_POST, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
		}
	}
	
	public class TrashRequest extends GoogleDriveRequest
	{
		TrashRequest(ffhttp_GoogleDriveFiles files, String id) 
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + id + URL_SEPARATOR + COMMAND_TRASH, REQUEST_METHOD_POST, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
		}
	}
	
	public class UntrashRequest extends GoogleDriveRequest
	{
		UntrashRequest(ffhttp_GoogleDriveFiles files, String id) 
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + id + URL_SEPARATOR + COMMAND_UNTRASH, REQUEST_METHOD_POST, null, 
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelFile.class));
		}
	}
	
	public class WatchRequest extends GoogleDriveRequest
	{
		WatchRequest(ffhttp_GoogleDriveFiles files, String id, ffhttp_GoogleDriveModelWatch content)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + id + URL_SEPARATOR + COMMAND_WATCH, REQUEST_METHOD_POST, content,
				  new ffhttp_JsonDeserializer(ffhttp_GoogleDriveModelApiChannel.class));
		}
	}
	
	public class EmptyTrashRequest extends GoogleDriveRequest
	{
		EmptyTrashRequest(ffhttp_GoogleDriveFiles files)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + COMMAND_TRASH, REQUEST_METHOD_DELETE, null, null);
		}
	}

	public class ExportRequest extends GoogleDriveRequest
	{
		ExportRequest(ffhttp_GoogleDriveFiles files, String fileId)
		{
			super(files, METADATA_ENDPOINT, ENDPOINT_FILES + fileId + URL_SEPARATOR + COMMAND_EXPORT, REQUEST_METHOD_GET, null, 
				  null);
		}
		
		/**
		 * Request parameters
		 */
		public String getMimeType()
		{
			return getParam('mimeType', (String) null);
		}
		public ExportRequest setMimeType(String mimeType)
		{
			addParam('mimeType', mimeType);
			return this;
		}
	}
}
