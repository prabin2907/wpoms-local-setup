#!/bin/bash
set -e

# GitHub workflow summary
SUMMARY_FILE=$GITHUB_STEP_SUMMARY

echo "CI/CD Pipeline Completed Successfully!" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

echo "### Images Pushed to ECR" >> $SUMMARY_FILE
echo "- Frontend: $VERSION_PREFIX.$BUILD_NUMBER ($DATE_TAG)" >> $SUMMARY_FILE
echo "- Backend: $VERSION_PREFIX.$BUILD_NUMBER ($DATE_TAG)" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

echo "### Artifacts" >> $SUMMARY_FILE
echo "- docker-compose.yml uploaded to S3: $S3_BUCKET" >> $SUMMARY_FILE
echo "" >> $SUMMARY_FILE

# echo "### Deployment" >> $SUMMARY_FILE
# echo "- EC2 Host: $EC2_HOST" >> $SUMMARY_FILE
# echo "- Status: Deployed successfully" >> $SUMMARY_FILE
# echo "" >> $SUMMARY_FILE

# echo "### Build Details" >> $SUMMARY_FILE
# echo "- Commit SHA: $COMMIT_SHA" >> $SUMMARY_FILE
# echo "- Build Number: $BUILD_NUMBER" >> $SUMMARY_FILE
# echo "- Workflow Run: $GITHUB_SERVER_URL/$GITHUB_REPOSITORY/actions/runs/$GITHUB_RUN_ID" >> $SUMMARY_FILE