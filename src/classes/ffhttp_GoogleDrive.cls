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
 * ffhttp_GoogleDrive
 *
 * The main GoogleDrive client class.
 *
 * This class contains the methods to access each of the Google Drive API calls.
 * https://developers.google.com/drive/v2/reference/
 */
public with sharing class ffhttp_GoogleDrive extends ffhttp_Client.AbstractClient 
{
	/**
	 * Constructor.
	 *
     * @param credentials HTTP request credentials required for authentication.
     * @return The Google Drive API HTTP client giving access to all API calls.
     */
	public ffhttp_GoogleDrive(ffhttp_Client.Credentials credentials) 
	{ 
		this.setCredentials(credentials);
	}
	
	/**
	 * An accessor for creating requests from the Files collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveFiles files()
	{
		return new ffhttp_GoogleDriveFiles(this);
	}
	
	/**
	 * An accessor for creating requests from the About collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveAbout about()
	{
		return new ffhttp_GoogleDriveAbout(this);
	}

	/**
	 * An accessor for creating requests from the Changes collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveChanges changes()
	{
		return new ffhttp_GoogleDriveChanges(this);
	}
	
	/**
	 * An accessor for creating requests from the Children collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveChildren children()
	{
		return new ffhttp_GoogleDriveChildren(this);
	}
	
	/**
	 * An accessor for creating requests from the Parents collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveParents parents()
	{
		return new ffhttp_GoogleDriveParents(this);
	}
	
	/**
	 * An accessor for creating requests from the Permissions collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDrivePermissions permissions()
	{
		return new ffhttp_GoogleDrivePermissions(this);
	}
	
	/**
	 * An accessor for creating requests from the Revisions collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveRevisions revisions()
	{
		return new ffhttp_GoogleDriveRevisions(this);
	}
	
	/**
	 * An accessor for creating requests from the Apps collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveApps apps()
	{
		return new ffhttp_GoogleDriveApps(this);
	}
	
	/**
     * An accessor for creating requests from the Comments collection.
     *
     * @return The resources collection.
     */
	public ffhttp_GoogleDriveComments comments()
	{
		return new ffhttp_GoogleDriveComments(this);
	}
	
	/**
     * An accessor for creating requests from the Replies collection.
     *
     * @return The resources collection.
     */
	public ffhttp_GoogleDriveReplies replies()
	{
		return new ffhttp_GoogleDriveReplies(this);
	}
	
	/**
	 * An accessor for creating requests from the Properties collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveProperties properties()
	{
		return new ffhttp_GoogleDriveProperties(this);
	}
	
	/**
	 * An accessor for creating requests from the Channels collection.
	 *
	 * @return The resources collection.
	 */
	public ffhttp_GoogleDriveChannels channels()
	{
		return new ffhttp_GoogleDriveChannels(this);
	}
}
