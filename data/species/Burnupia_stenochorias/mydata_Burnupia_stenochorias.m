function [data, auxData, metaData, txtData, weights] = mydata_Burnupia_stenochorias

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Burnupiidae';
metaData.species    = 'Burnupia_stenochorias'; 
metaData.species_en = 'Freshwater limpet'; 

metaData.ecoCode.climate = {'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'ap'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 30];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 30]; 

%% set data
% zero-variate data

data.tp = 53; units.tp = 'd';    label.tp = 'time since birth at puberty';  bibkey.tp = 'Davi2001';   
  temp.tp = C2K(20);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 147; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Davi2001';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.075;  units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'Davi2001';
data.Lp  = 0.35; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'Davi2001';
data.Li  = 0.54; units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Davi2001';

data.Wdi  = 1.4e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Ancylus_fluviatilis: 3.4e-3 * (0.54/0.73)^3';

data.Ni  = 141;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'Davi2001';   
  temp.Ni = C2K(20);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '5 eggs per capsule, 35 capsules per lifetime';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), shell length (cm)
1.107	0.117
1.234	0.113
1.236	0.107
12.072	0.213
12.075	0.203
12.332	0.185
18.000	0.251
18.133	0.222
18.137	0.208
28.732	0.267
28.851	0.298
28.852	0.292
42.850	0.383
43.107	0.366
43.239	0.343
52.814	0.443
53.200	0.417
53.335	0.382];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Davi2001';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'hermaprodite';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'NY3R'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4803056'; % Ency of Life
metaData.links.id_Wiki = 'Burnupia_stenochorias'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '1686788'; % Taxonomicon
metaData.links.id_WoRMS = '1058703'; % WoRMS
metaData.links.id_molluscabase = '1058703'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Laevapex_fuscus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Davi2001'; type = 'Phdthesis'; bib = [ ... 
'author = {Heather Denise Davies-Coleman}, ' ... 
'title = {The Growth and Reproduction of the Freshwater Limpet \emph{Burnupia stenochorias} ({P}ulmonata, {A}ncylidae), and An Evaluation of its Use As An Ecotoxicology Indicator in Whole Effluent Testing}, ' ...
'school = {Rhodes University}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
