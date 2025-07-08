function [data, auxData, metaData, txtData, weights] = mydata_Diaphanosoma_senegal
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Ctenopoda'; 
metaData.family     = 'Sididae';
metaData.species    = 'Diaphanosoma_senegal'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A', 'B'};
metaData.ecoCode.ecozone = {'TP'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab_T'; 'ap'; 'Lb'; 'Lp'; 'Li'; 'Wdp'}; 
metaData.data_1     = {'t-L'; 't-N'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 16];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 16]; 

%% set data
% zero-variate data

data.ab = 0.96; units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'VenkKris1985';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 1.8;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'VenkKris1985';
  temp.tp = C2K(29);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'based on tLR data';
data.am = 18.7;    units.am = 'd';    label.am = 'life span'; bibkey.am = 'VenkKris1985';
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lb  = 0.059; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'VenkKris1985';
data.Lp  = 0.125; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'VenkKris1985';
data.Li  = 0.189; units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'VenkKris1985';

data.Wdi = 47.66e-6; units.Wdi = 'g'; label.Wdi = 'ultimate dry weight';   bibkey.Wdi = 'VenkKris1985';
   comment.Wdi = 'based on length-weight of Ceriodaphnia dubia: (0.189/0.09832)^3*6.71e-06'; 

% uni-variate data
% time-length-reproduction
data.tLR = [ ... % time since birth (h), length (mm), cum reprod (#)
    0.0 0.59  0
   13.2 0.88  0
   31.0 1.22  0
   54.8 1.37  3.2
   92.1 1.47  5.8
  117.7 1.53  8.7
  141.4 1.56 11.5
  164.9 1.63 14.5
  188.9 1.70 18.0
  212.1 1.73 20.6
  233.7 1.73 23.3
  257.2 1.76 26.1
  280.7 1.76 28.7
  305.5 1.79 31.7
  329.6 1.83 33.9
  353.9 1.86 35.2
  377.1 1.86 38.2
  399.7 1.89 40.5
  423.7 1.89 40.5];
data.tLR(:,1) = data.tLR(:,1)/ 24; % convert h to d
data.tLR(:,2) = data.tLR(:,2)/ 10; % convert mm to cm
units.tLR   = {'d', 'cm', '#'};  label.tLR = {'time since birth', 'length', 'cum # of eggs'};  
temp.tLR    = C2K(29);  units.temp.tLR = 'K'; label.temp.tLR = 'temperature';
bibkey.tLR = 'VenkKris1985'; treat.tLR = {1 {'length','cum reprod'}};

%% set weights for all real data
weights = setweights(data, []);
weights.tLR    = 5 * weights.tLR;
weights.Li    = 3 * weights.Li;

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
% set1 = {}; subtitle1 = {};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

% %% Discussion points
% D1 = '';     
% metaData.discussion = struct('D1', D1);

% %% Facts
% F1 = '';
% metaData.bibkey.F1 = ''; 
% metaData.facts = struct('F1',F1);
 
%% Links
metaData.links.id_CoL = '35BRM'; % Cat of Life
metaData.links.id_ITIS = '83857'; % ITIS
metaData.links.id_EoL = '338940'; % Ency of Life
metaData.links.id_Wiki = 'Diaphanosoma'; % Wikipedia
metaData.links.id_ADW = 'Diaphanosoma_senegal'; % ADW
metaData.links.id_Taxo = '351871'; % Taxonomicon
metaData.links.id_WoRMS = '1302661'; % WoRMS

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
bibkey = 'VenkKris1985'; type = 'Article'; bib = [ ... 
'doi = {10.1007/bf03186331}, ' ...
'author = {K. Venkataraman and S. Krishnaswamy}, ' ... 
'year = {1985}, ' ...
'title = {Laboratory culture of \emph{Diaphanosoma senegal} {G}authier, ({C}rustacea, {C}ladocera) from south {I}ndia}, ' ...
'journal = {Proc. Indian Acad. Sci. (Anim. Sci.)}, ' ...
'volume = {94(2)}, ' ...
'pages = {87–91}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

