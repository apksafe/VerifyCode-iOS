#!/bin/bash

podspecName=$(find . -name "*.podspec" -maxdepth 1 | xargs basename)
podRepoName="CocoaPods"

#找出podName
podName=$(sed -n '/.*s.name.*/p' $podspecName | sed "s/ //g")
#找出podVersion
podVersion=$(sed -n '/.*s.version.*/p' $podspecName | sed "s/ //g")
#找出podDependency
podDependency=$(sed -n '/.*s.dependency.*/p' $podspecName)
#找出当前git最新的tag
git fetch --tags
lastestVersion=$(git describe --tags `git rev-list --tags --max-count=1`)

echo "==============================================="
echo "在lint和发布到pod之前，请检查以下选项（很重要)"
echo "==============================================="

echo "***********************************************"
echo "pod发布名称:	$podName"
echo "当前git仓库最新tag: $lastestVersion"
echo "pod发布版本:	$podVersion"
echo "pod依赖库和依赖版本:$podDependency"
echo "***********************************************"
echo ""
echo "以上参数是否都正确？(yes/no)"

read input

input=$(echo $input | tr '[:upper:]' '[:lower:]')

if [[ $input == 'yes' ]]; then
	#lint
	pod spec lint $podspecName --verbose --allow-warnings  --use-libraries 

	if [[ $? -eq 0 ]]; then
		echo "-----------------------"
		echo "lint success"
		echo "-----------------------"
		pod trunk push $podspecName --verbose --allow-warnings  --use-libraries
	else
		echo "-----------------------"
		echo "lint fail"
		echo "-----------------------"
	fi
else
	echo "=======cancel======="
fi

exit 1
