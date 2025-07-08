function [data, auxData, metaData, txtData, weights] = mydata_Discus_perspectivus
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Gastropoda'; 
metaData.order      = 'Pulmonata'; 
metaData.family     = 'Discidae';
metaData.species    = 'Discus_perspectivus'; 
metaData.species_en = 'Keeled disk snail'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Thw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biD', 'biO'};
metaData.ecoCode.gender  = {'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ni'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 01 20];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 01 20]; 

%% set data
% zero-variate data

data.ab  = 25;   units.ab  = 'd'; label.ab  = 'age at birth';     bibkey.ab  = 'Kuzn2005';   
  temp.ab = C2K(21.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '24-36 d';
data.am  = 3*365;   units.am  = 'd'; label.am  = 'life span';     bibkey.am  = 'Kuzn2005';   
  temp.am = C2K(21.5);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 0.1; units.Lb  = 'cm';  label.Lb  = 'shell breath at birth';   bibkey.Lb  = 'Kuzn2005';
data.Lp  = 0.55; units.Lp  = 'cm';  label.Lp  = 'shell breath at puberty';   bibkey.Lp  = 'Kuzn2005';
data.Li  = 0.65; units.Li  = 'cm';  label.Li  = 'ultimate shell breath';   bibkey.Li  = 'animalbase';

data.Wwi  = 0.0484; units.Wwi  = 'g';  label.Wwi  = 'ultimate wet weight';   bibkey.Wwi  = 'EoL';

data.Ni  = 33;   units.Ni  = '#'; label.Ni  = 'life time reproduction output';     bibkey.Ni  = 'Kuzn2005';   
  temp.Ni = C2K(21.5);  units.temp.Ni = 'K'; label.temp.Ni = 'temperature';
 
% uni-variate data
% time-length
data.tL = [ ... % age (d), number of whorls (#)
0	2.772
0	2.448
0	2.549
0	2.691
30	3.396
30	3.517
30	3.659
30	3.740
30	3.902
64	4.364
64	4.404
64	4.546
64	4.829
64	5.031
101	5.838
101	5.170
101	5.291
101	5.413
101	4.907
101	5.008
131	6.178
131	5.308
131	5.429
131	5.490
131	5.692
131	5.713
161	5.326
161	5.609
161	5.710
161	5.932
161	6.377
210	6.556
210	6.333
210	6.050
210	6.111
210	6.212
210	5.848
210	5.929
255	6.350
255	6.431
255	6.168
255	6.269
255	6.087
255	5.925
285	6.528
285	6.043
285	6.326
285	6.367
285	6.427
410	6.404
410	6.323
410	6.586
410	6.121
492	6.461
492	6.319
492	6.360
492	6.097
705	6.437
705	6.538
705	6.336
795	6.555];
data.tL(:,2) = data.Lb*(data.Li/ data.Lb).^((data.tL(:,2)-data.tL(1,2))/(data.tL(end,2)-data.tL(1,2)));
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell height'};  
temp.tL    = C2K(21.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Kuzn2005';
comment.tL = 'based on # of whorls, assuming a constant factor per whorl, given Lb and Li';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Wwi = 5 * weights.Wwi;

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
F1 = 'Simultaneous hermaprodite';
metaData.bibkey.F1 = 'Kuzn2005'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6DBFR'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '4920208'; % Ency of Life
metaData.links.id_Wiki = 'Discus_perspectivus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW  not present 
metaData.links.id_Taxo = '38719'; % Taxonomicon 
metaData.links.id_WoRMS = '1050221'; % WoRMS
metaData.links.id_molluscabase = '1050221'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Discus_perspectivus}}';
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
bibkey = 'Kuzn2005'; type = 'Article'; bib = [ ... 
'author = {El\dot{z}bieta Ku\''{z}nik-{K}owalska}, ' ... 
'title = {LIFE CYCLE AND POPULATION DYNAMICS OF \emph{Discus perspectivus} ({M}EGERLE VON {M}\"{u}HLFELD, 1818) ({E}NDODONTIDAE)}, ' ...
'journal = {Folia Malacologica}, ' ...
'volume = {13}, ' ...
'year = {2005}, ' ...
'pages = {157-168}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'animalbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.animalbase.uni-goettingen.de/zooweb/servlet/AnimalBase/home/species?id=1239}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4920208}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

