function [data, auxData, metaData, txtData, weights] = mydata_Eubranchipus_holmanii
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anostraca'; 
metaData.family     = 'Chirocephalidae';
metaData.species    = 'Eubranchipus_holmanii'; 
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
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 01 29]; 

%% set data
% zero-variate data

data.tp = 30;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Modl1982';
  temp.tp = C2K(7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 95;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Modl1982';   
  temp.am = C2K(10);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.08; units.Lb  = 'cm'; label.Lb  = 'total length at birth';   bibkey.Lb  = 'guess';
data.Lp  = 0.78;  units.Lp  = 'cm'; label.Lp  = 'width head plate at puberty'; bibkey.Lp  = 'Modl1982';
  comment.Lp = 'based on remark that 0.812 cm has eggs already';
data.Li  = 1.2;  units.Li = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Modl1982';
  
data.Wdi  = 0.0029;  units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Arteria salina: 0.0017*(1.2/1)^3';

data.Ri = 30/2;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'guess';   
  temp.Ri = C2K(10);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on E. bundyi, corrected for size: 30 eggs per brood, guessed one brood each 2 d';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), head width (mm), temp (C)
15.633	0.468  4
35.788	0.812  7
41.990	0.852  7
50.129	0.910  7
67.829	1.002 10
93.023	1.205 17];
data.tL(:,1) = data.tL(:,1) + 4; % set origin at birth
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'length'};  
temp.tL = data.tL(:,[1 3]); data.tL(:,3) = []; units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'}; 
bibkey.tL = 'Modl1982'; 
comment.tL = 'from n NW Huntsville, Madison Co., Alabama. I converted head width to length by multiplying with 10, based on data for E.vernalis';

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

% %% Discussion points
% D1 = '';   
% metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TLWB'; % Cat of Life
metaData.links.id_ITIS = '624050'; % ITIS
metaData.links.id_EoL = '327173'; % Ency of Life
metaData.links.id_Wiki = 'Eubranchipus'; % Wikipedia
metaData.links.id_ADW = 'Eubranchipus_holmanii'; % ADW
metaData.links.id_Taxo = '807164'; % Taxonomicon
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
bibkey = 'Modl1982'; type = 'Article'; bib = [ ... 
'author = {Richard F. Modlin}, ' ... 
'year = {1982}, ' ...
'title = {A Comparison of Two \emph{Eubranchipus} Species ({C}rustacea: {A}nostraca)}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'volume = {107(1)}, ' ...
'pages = {107-113}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
