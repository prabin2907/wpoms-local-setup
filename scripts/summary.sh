#!/bin/bash
set -e

# GitHub workflow summary
SUMMARY_FILE=$GITHUB_STEP_SUMMARY

echo "## Deployment Status: SUCCESS" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

echo "### Images" >> $SUMMARY_FILE
echo "- Frontend: \`$VERSION_PREFIX.$BUILD_NUMBER ($DATE_TAG)\`" >> $SUMMARY_FILE
echo "- Backend: \`$VERSION_PREFIX.$BUILD_NUMBER ($DATE_TAG)\`" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

echo "### Access Application" >> $SUMMARY_FILE
echo "- Frontend: http://$EC2_HOST:5173" >> $SUMMARY_FILE
echo "- Backend API: http://$EC2_HOST:8081" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

echo "### Build Details" >> $SUMMARY_FILE
echo "- Commit: \`$COMMIT_SHA\`" >> $SUMMARY_FILE
echo "- Build: #$BUILD_NUMBER" >> $SUMMARY_FILE
echo "- Workflow: [View Run]($GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID)" >> $SUMMARY_FILE