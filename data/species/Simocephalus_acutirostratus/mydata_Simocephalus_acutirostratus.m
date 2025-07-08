function [data, auxData, metaData, txtData, weights] = mydata_Simocephalus_acutirostratus
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Simocephalus_acutirostratus'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','B'};
metaData.ecoCode.ecozone = {'TP','TA','TO'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1     = {'t-L'; 't-R'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 15];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 15]; 

%% set data
% zero-variate data

data.ab = 2;    units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'MuruSiva1973';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
data.tp = 3.3;    units.tp = 'd';    label.tp = 'time since birth at at puberty'; bibkey.tp = 'MuruSiva1973';   
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 43.6;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'MuruSiva1973';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.065; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'MuruSiva1973';
data.Lp  = 0.18; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MuruSiva1973';
data.Li  = 0.32;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'MuruSiva1973';
 
data.Wdi = 245.8;   units.Wdi = 'mug';   label.Wdi = 'ultimate dry weight';  bibkey.Wdi = 'guess';
  comment.Wdi = 'based on Simocephalus_serrulatus: (3.2/2)^3*60';

% uni-variate data
% time-length-reprod
data.tLR = [ ... % time since birth (h), length (mm), cum offspring (#)
     0 0.65   0
    24 0.90   0
    48 1.17   0
    72 1.62   0
    96 2.01   8
   144 2.22  26
   193 2.30  44
   235 2.53  65
   283 2.64  80
   348 2.66  90
   402 2.69 103
   466 2.80 116
   523 2.85 130
   577 2.88 148
   621 2.94 166
   669 3.02 191
   721 3.10 218
   783 3.10 230
   855 3.20 239
   903 3.20 248
   975 3.20 248
  1047 3.20 248];
data.tLR(:,1) = data.tLR(:,1)/24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/10; % convert mm to cm
units.tLR   = {'d', 'cm','#'};  label.tLR = {'time since birth', 'length','cumulative offspring'};  
temp.tLR    = C2K(29);  units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'MuruSiva1973'; treat.tLR = {1, {'length','cum reprod'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLR = 5 * weights.tLR; weights.tLR(end-6:end,2) = 0;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

% %% Group plots
% set1 = {'',''}; subtitle1 = {'Data for 5, 2 C'};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '4XFH8'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '3209051'; % Ency of Life
metaData.links.id_Wiki = 'Simocephalus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '4615050'; % Taxonomicon
metaData.links.id_WoRMS = '1303133'; % WoRMS

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
bibkey = 'MuruSiva1973'; type = 'Article'; bib = [ ... 
'author = {Murugan, N. and Sivaramakrishnan, K. G.}, ' ... 
'year = {1973}, ' ...
'title = {The biology of \emph{Simocephalus acutirostracus} {K}ing ({C}ladocera: {D}aphniidae)--Laboratory studies of life span, instar duration, egg production, growth and stages in embryonic development}, ' ...
'journal = {Freshwater Biol.}, ' ...
'volume = {3}, ' ...
'pages = {77-83}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
