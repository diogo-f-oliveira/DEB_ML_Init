function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_vernalis
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_vernalis'; 
metaData.species_en = 'Fairy shrimp'; 

metaData.ecoCode.climate = {'B'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFpe'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 28]; 

%% set data
% zero-variate data

data.tp = 25;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Dext1946';
  temp.tp = C2K(10);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 65;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Dext1946';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'Dext1946';
data.Lp  = 1.15;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Dext1946';
data.Li  = 2.59;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Dext1946';
  
data.Wdi  = 0.0295;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'Dext1946';
  comment.Wdi = 'based in Arteria salina: 0.0017*(2.59/1)^3';

data.Ri = 80/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on E. bundyi, corrected for size: 80 eggs per brood, guess one brood each 2 d';

% uni-variate data
% time-length
data.tL43 = [ ... % time since birth (d), length (cm), temp (C)
   10 0.465  3.0
   17 0.483  0.0
   24 0.625  0.5
   31 0.687  4.5
   38 0.831  0.5
   45 0.903  1.0
   52 1.176  9.0
   59 1.243 11.5
   66 1.544 21.0];
data.tL43(:,1) = data.tL43(:,1) + 5; % set origin at birth
units.tL43 = {'d', 'cm'}; label.tL43 = {'time since birth', 'length', 'Portage county 1943'};  
temp.tL43 = data.tL43(:,[1 3]); data.tL43(:,3)=[]; units.temp.tL43 = {'d','C'}; label.temp.tL43 = {'time','temperature'}; 
bibkey.tL43 = 'Dext1946'; 
%
data.tL44 = [ ... % time since birth (d), length (cm), temp (C)
    7 0.253  2.0
   14 0.511  5.5
   21 0.856 16.6
   28 1.192  4.7
   35 1.440  8.8
   42 1.675 10.5
   49 1.900 13.5];
data.tL44(:,1) = data.tL44(:,1) + 5; % set origin at birth
units.tL44 = {'d', 'cm'}; label.tL44 = {'time since birth', 'length', 'Portage county 1944'};  
temp.tL44 = data.tL44(:,[1 3]); data.tL44(:,3)=[]; units.temp.tL44 = {'d','C'}; label.temp.tL44 = {'time','temperature'}; 
bibkey.tL44 = 'Dext1946'; 

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL44','tL43'}; subtitle1 = {'Data of 1944, 1943'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TLWL'; % Cat of Life
metaData.links.id_ITIS = '83722'; % ITIS
metaData.links.id_EoL = '338953'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus_vernalis'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_vernalis'; % ADW
metaData.links.id_Taxo = '33073'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS

%% References
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Dext1946'; type = 'Article'; bib = [ ... 
'author = {Ralph W. Dexter}, ' ... 
'year = {1946}, ' ...
'title = {Further studies on the life history and distribution of \emph{Eubranchipus vernalis}}, ' ...
'journal = {Ohio Jour. Sci.}, ' ...
'volume = {46(1)}, ' ...
'pages = {31-44}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
