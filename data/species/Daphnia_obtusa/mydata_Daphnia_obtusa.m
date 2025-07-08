function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_obtusa
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_obtusa'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TH','TN','TN','TPa'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical = C2K(22); % K, body temp
metaData.data_0    = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1    = {}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 29];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Dina Lika'};
metaData.email_cur = {'lika@uoc.gr'}; 
metaData.date_acc  = [2024 01 29]; 

%% set data
% zero-variate data

data.ab = 2.1;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'MilbKrus2003';
  temp.ab = C2K(22);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on clutch interval of 2.4 d';
data.tp = 6;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'MilbKrus2003';
  temp.tp = C2K(22);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 29.9;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'MilbKrus2003';   
  temp.am = C2K(22);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.05; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'MilbKrus2003';
data.Lp  = 0.14;  units.Lp  = 'cm'; label.Lp  = 'total length at puberty'; bibkey.Lp  = 'MilbKrus2003';
data.Li  = 0.26; units.Li  = 'cm'; label.Li  = 'ultimate total length';   bibkey.Li  = 'MilbKrus2003';
  
data.Wdi  = 208e-6;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(260/370)^3 mug';

data.Ri  = 17.5/2.4; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'MilbKrus2003';   
  temp.Ri = C2K(22);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '17.5 eggs in 2.4 d';

% uni-variate data

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

% %% Group plots
% set1 = {''}; subtitle1 = {''};
% metaData.grp.sets = {set1};
% metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '345C9'; % Cat of Life
metaData.links.id_ITIS = '684657'; % ITIS
metaData.links.id_EoL = '65484119'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_obtusa'; % ADW
metaData.links.id_Taxo = '156181'; % Taxonomicon
metaData.links.id_WoRMS = '890552'; % WoRMS

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
bibkey = 'NixJenk2000'; type = 'Article'; bib = [ ...
'doi = {10.1023/a:1009985529660}, ' ...
'author = {M.H. Nix and D.G. Jenkins}, ' ... 
'year = {2000}, ' ...
'title = {Life history comparisons of Daphnia obtusa from temporary ponds, cultured with a low-quality food}, ' ...
'journal = {Oecologia (Berlin) }, ' ...
'volume = {34(1)}, ' ...
'pages = {19–27}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MilbKrus2003'; type = 'Article'; bib = [ ...
'doi = {10.1127/0003-9136/2003/0157-0433}, ' ...
'author = {Milbrink, G\"{o}ran and Kruse, Marie-Louise and Bengtsson, Jan}, ' ... 
'year = {2003}, ' ...
'title = {Competitive ability and life history strategies in four species of \emph{Daphnia}: \emph{D. obtusa}, \emph{D. magna}, \emph{D. pulex} and \emph{D. longispina}}, ' ...
'journal = {Archiv für Hydrobiologie}, ' ...
'volume = {157(4)}, ' ...
'pages = {433–453}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
