function [data, auxData, metaData, txtData, weights] = mydata_Laevapex_fuscus

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Planorbidae';
metaData.species    = 'Laevapex_fuscus'; 
metaData.species_en = 'Freshwater limpet'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFl', '0iFp', '0iFm'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHa', 'biHl'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(20); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wdi'; 'Ri'}; 
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

data.am = 385; units.am = 'd';    label.am = 'life span';                bibkey.am = 'McMa1976';   
  temp.am = C2K(20);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.07;  units.Lb  = 'cm';  label.Lb  = 'shell length at birth';   bibkey.Lb  = 'McMa1976';
data.Lp  = 0.35; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'McMa1976';
data.Li  = 0.79; units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'Wiki';

data.Wdi  = 4.3e-3; units.Wdi  = 'g';  label.Wdi  = 'ultimate dry weight';  bibkey.Wdi  = 'guess';
 comment.Wdi = 'based on size-corrected value for Ancylus_fluviatilis: 3.4e-3 * (0.79/0.73)^3';

data.Ni  = 15;   units.Ni  = '#'; label.Ni  = 'lifetime reprod output'; bibkey.Ni  = 'McMa1976';   
  temp.Ni = C2K(20);   units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
  comment.Ni = '5 eggs per capsule, 3 capsules per yr';
 
% uni-variate data
% time - length
data.tL = [ ... % age (d), shell length (cm)
6.113	0.124
22.174	0.163
35.981	0.164
50.307	0.211
64.585	0.295
77.156	0.365
93.289	0.346
120.266	0.398
144.981	0.418
156.986	0.480
176.547	0.481
188.072	0.466
215.592	0.544
243.168	0.576
277.687	0.578
303.614	0.549
323.165	0.557
343.828	0.597
361.639	0.617
383.434	0.671];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(20);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'McMa1976';
comment.tL = 'Data from White Rock Lake 1973, Dallas Co., Texas';

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
F1 = 'Potandric hermaprodite; Simple annual (univoltine) and two-generation per year (bivoltine)';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3RVB6'; % Cat of Life
metaData.links.id_ITIS = '76577'; % ITIS
metaData.links.id_EoL = '452809'; % Ency of Life
metaData.links.id_Wiki = 'Laevapex_fuscus'; % Wikipedia
metaData.links.id_ADW = 'Laevapex_fuscus'; % ADW
metaData.links.id_Taxo = '844477'; % Taxonomicon
metaData.links.id_WoRMS = '743611'; % WoRMS
metaData.links.id_molluscabase = '743611'; % molluscabase


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
bibkey = 'McMa1976'; type = 'Article'; bib = [ ... 
'author = {Robert F. McMahon}, ' ... 
'title = {Growth, Reproduction and Life Cycle in Six {T}exan Populations of Two Species of Freshwater Limpets}, ' ...
'journal = {The American Midland Naturalist}, ' ...
'number = {1}, ' ...
'volume = {95}, ' ...
'year = {1976}, ' ...
'pages = {174-185}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
