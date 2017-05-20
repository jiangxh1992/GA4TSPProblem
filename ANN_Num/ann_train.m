function net = ann_train(input_data,desired_data,layer,epoch)

% BP train
net = newff(input_data,desired_data,layer);
net.trainParam.epochs = epoch;
net.trainParam.lr = 0.01;
net.trainParam.goal = 0.0001;
net.trainparam.show = 1;
net.trainFcn = 'trainlm';
%[net,tr] = train(net,input_data,desired_data);
net = train(net,input_data,desired_data);

%BP test
%train_result = net(input_data);
end