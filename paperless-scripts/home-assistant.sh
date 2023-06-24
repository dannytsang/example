#!/usr/bin/env bash
echo "

A document with an id of ${DOCUMENT_ID} was just consumed.  I know the
following additional information about it:

* Generated File Name: ${DOCUMENT_FILE_NAME}
* Archive Path: ${DOCUMENT_ARCHIVE_PATH}
* Source Path: ${DOCUMENT_SOURCE_PATH}
* Created: ${DOCUMENT_CREATED}
* Added: ${DOCUMENT_ADDED}
* Modified: ${DOCUMENT_MODIFIED}
* Thumbnail Path: ${DOCUMENT_THUMBNAIL_PATH}
* Download URL: ${DOCUMENT_DOWNLOAD_URL}
* Thumbnail URL: ${DOCUMENT_THUMBNAIL_URL}
* Correspondent: ${DOCUMENT_CORRESPONDENT}
* Tags: ${DOCUMENT_TAGS}

It was consumed with the passphrase ${PASSPHRASE}

"
curl -X POST http://homeassistant.local:8123/api/webhook/[Home Assistant Webhook ID] \
  -H 'Authorization: Bearer [Long Lived Token]' \
  -H 'Content-Type: application/json' \
  -d '{"id":"'"$DOCUMENT_ID"'","name":"'"$DOCUMENT_FILE_NAME"'","correspondent":"'"$DOCUMENT_CORRESPONDENT"'","thumbnail_path":"'"${DOCUMENT_THUMBNAIL_PATH}"'","thumbnail_url":"'"${DOCUMENT_DOWNLOAD_URL}"'","download_url":"'"${DOCUMENT_DOWNLOAD_URL}"'","created_date":"'"${DOCUMENT_CREATED}"'","added_date":"'"${DOCUMENT_ADDED}"'"}'
