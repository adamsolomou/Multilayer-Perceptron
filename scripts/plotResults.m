clear all;close all;clc; 

%open reference file 
file_ID = fopen('simple_ratio.txt','r');
formatSpec = '%*4c %d %*c %f %*c'; 
simple = textscan(file_ID, formatSpec); 
fclose(file_ID);

%open inner file 
file_ID = fopen('naive_ratio.txt','r');
formatSpec = '%*4c %d %*c %f %*c'; 
naive = textscan(file_ID, formatSpec); 
fclose(file_ID);

%open outer file 
file_ID = fopen('atomic_ratio.txt','r');
formatSpec = '%*4c %d %*c %f %*c'; 
atomic = textscan(file_ID, formatSpec); 
fclose(file_ID);

%open both file 
file_ID = fopen('clustered_ratio.txt','r');
formatSpec = '%*4c %d %*c %f %*c'; 
clustered = textscan(file_ID, formatSpec); 
fclose(file_ID);

%open both file 
file_ID = fopen('par_for_clustered_ratio.txt','r');
formatSpec = '%*4c %d %*c %f %*c'; 
par_for_clustered = textscan(file_ID, formatSpec); 
fclose(file_ID);

% file_ID = fopen('range.txt','r'); 
% formatSpec = '%f'; 
% range = fscanf(file_ID,formatSpec); 
% fclose(file_ID); 

simple_min = simple{1}; 
simple_sec = simple{2}; 

naive_min = naive{1}; 
naive_sec = naive{2}; 

atomic_min = atomic{1}; 
atomic_sec = atomic{2}; 

clustered_min = clustered{1}; 
clustered_sec = clustered{2}; 

par_for_clustered_min = par_for_clustered{1}; 
par_for_clustered_sec = par_for_clustered{2}; 

ratio = [1/256 1/64 1/16 1/4 1 4 16 64 256];
%construct table 
ind = 1; 
for i = 1:length(ratio)
    simple_table(i,1) = double(simple_min(ind)*60) + simple_sec(ind); %real time 
    naive_table(i,1) = double(naive_min(ind)*60) + naive_sec(ind); %real time 
    atomic_table(i,1) = double(atomic_min(ind)*60) + atomic_sec(ind); %real time 
    clustered_table(i,1) = double(clustered_min(ind)*60) + clustered_sec(ind); %real time
    par_for_clustered_table(i,1) = double(par_for_clustered_min(ind)*60) + par_for_clustered_sec(ind); 
    ind = ind + 1; 
    simple_table(i,2) = double(simple_min(ind)*60) + simple_sec(ind); %user time 
    naive_table(i,2) = double(naive_min(ind)*60) + naive_sec(ind); %user time 
    atomic_table(i,2) = double(atomic_min(ind)*60) + atomic_sec(ind); %user time 
    clustered_table(i,2) = double(clustered_min(ind)*60) + clustered_sec(ind); %user time
    par_for_clustered_table(i,2) = double(par_for_clustered_min(ind)*60) + par_for_clustered_sec(ind);
    ind = ind + 1; 
    simple_table(i,3) = double(simple_min(ind)*60) + simple_sec(ind); %sys time 
    naive_table(i,3) = double(naive_min(ind)*60) + naive_sec(ind); %sys time 
    atomic_table(i,3) = double(atomic_min(ind)*60) + atomic_sec(ind); %sys time
    clustered_table(i,3) = double(clustered_min(ind)*60) + clustered_sec(ind); %sys time
    par_for_clustered_table(i,3) = double(par_for_clustered_min(ind)*60) + par_for_clustered_sec(ind);
    ind = ind + 1; 
end 

%plot real time (absolute times)
figure(); 
plot(ratio,simple_table(:,1),'b--o')
hold on 
plot(ratio,naive_table(:,1),'r--o');
plot(ratio,atomic_table(:,1),'g--o');
plot(ratio,clustered_table(:,1),'m--o'); 
plot(ratio,par_for_clustered_table(:,1),'c--o'); 
hold off 
legend('Simple','Naive','Atomic','Clustered','Par_for_clustered');

