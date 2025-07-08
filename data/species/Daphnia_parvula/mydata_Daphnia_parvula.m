function [data, auxData, metaData, txtData, weights] = mydata_Daphnia_parvula
%% set metaData
metaData.phylum     = 'Arthropoda'; 
metaData.class      = 'Branchiopoda'; 
metaData.order      = 'Anomopoda'; 
metaData.family     = 'Daphniidae';
metaData.species    = 'Daphnia_parvula'; 
metaData.species_en = 'Waterflea'; 

metaData.ecoCode.climate = {'A','C'};
metaData.ecoCode.ecozone = {'TH','TN'};
metaData.ecoCode.habitat = {'0iFp', '0iFl', '0iFm'};
metaData.ecoCode.embryo  = {'Fbf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp', 'biD'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical = C2K(25); % K, body temp
metaData.data_0    = {'Lb'; 'Lp'; 'Li'; 'Wdi'}; 
metaData.data_1    = {'t-L_f'; 'T-ap'; 'T-am'; 'T-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 01 26];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};   

metaData.curator   = {'Dina Lika'};
metaData.email_cur = {'lika@uoc.gr'}; 
metaData.date_acc  = [2024 01 26]; 

%% set data
% zero-variate data

data.Lb  = 0.048; units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PacePort1984';
data.Lp  = 0.100; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'PacePort1984';
data.Li  = 0.13;  units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'PacePort1984';
  
data.Wdi  = 26;  units.Wdi  = 'mug';  label.Wdi  = 'ultimate dry weight';   bibkey.Wdi  = 'guess';
  comment.Wdi = 'based in Daphnia magna: 600*(130/370)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (#), length (mm)
 0.000	0.536
 5.092	1.043
27.782	1.279];
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'length','spring'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'PacePort1984'; 
%
data.tL_S = [ ... % time since birth (#), length (mm)
 0.000	0.476
 5.291	0.985
18.887	1.051];
data.tL_S(:,2) = data.tL_S(:,2)/10; % convert mm to cm
units.tL_S   = {'d', 'cm'};  label.tL_S = {'time since birth', 'length','summer'};  
temp.tL_S    = C2K(25);  units.temp.tL_S = 'K'; label.temp.tL = 'temperature';
bibkey.tL_S = 'PacePort1984'; 

% temperature-time since birth at puberty
data.Ttp = [ ...
    8 19.2
   20  6.2
   20  5.8
   25  4.6];
units.Ttp   = {'C', 'd'};  label.Ttp = {'temperature', 'time since birth at puberty'};  
bibkey.Ttp = 'PacePort1984'; 

% temperature-life span
data.Tam = [ ...
    8 89.9
   20 22.7
   20 20.7
   25 15.8];
units.Tam   = {'C', 'd'};  label.Tam = {'temperature', 'life span'};  
bibkey.Tam = 'PacePort1984'; 

% temperature-fecundity
data.TN = [ ...
    8 68
   20 70
   20 50
   25 14];
units.TN   = {'C', 'N'};  label.TN = {'temperature', 'fecundity'};  
bibkey.TN = 'PacePort1984'; treat.TN = {0, {}};

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 3 * weights.tL; 
weights.tL_S = 3 * weights.tL_S; 

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL_S'}; subtitle1 = {'Data for spring, summer'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Links
metaData.links.id_CoL = '345CC'; % Cat of Life
metaData.links.id_ITIS = '83880'; % ITIS
metaData.links.id_EoL = '338520'; % Ency of Life
metaData.links.id_Wiki = 'Daphnia'; % Wikipedia
metaData.links.id_ADW = 'Daphnia_parvula'; % ADW
metaData.links.id_Taxo = '347070'; % Taxonomicon
metaData.links.id_WoRMS = '1298096'; % WoRMS

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
bibkey = 'PacePort1984'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf00379783}, ' ...
'author = {Michael L. Pace and Karen Porter and Yvette S. Feig}, ' ... 
'year = {1984}, ' ...
'title = {Life history variation within a parthenogenetic population of \emph{Daphnia parvula} ({C}rustacea: {C}ladocera)}, ' ...
'journal = {Oecologia (Berlin) }, ' ...
'volume = {63(1)}, ' ...
'pages = {43–51}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'OrcuPort1984'; type = 'Article'; bib = [ ...
'doi = {10.1007/bf00379783}, ' ...
'author = {John D. Orcutt and Karen G. Porter}, ' ... 
'year = {1984}, ' ...
'title = {The synergistic effects of temperature and food concentration on life history parameters of \emph{Daphnia}}, ' ...
'journal = {Oecologia (Berlin) }, ' ...
'volume = {63}, ' ...
'pages = {300-306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
